//
//  ContentController.m
//  MacAssistant
//
//  Created by Thanos Siopoudis on 9/7/10.
//  Copyright 2010 Thanos. All rights reserved.
//

#import "Award.h"
#import "Club.h"
#import "Colour.h"
#import "Person.h"
#import "Contract.h"
#import "Controller.h"
#import "Database.h"
#import "FMString.h"
#import "LangDB.h"
#import "ContentController.h"
#import "PlayerStatsTransformer.h"
#import "PlayerRatingTransformer.h"
#import "SupportFunctions.h"


@implementation ContentController

@synthesize playerSearchResults, selectedRows, selectedPlayer;

- (id)init
{
	[super init];
    selectedRows = [[NSMutableDictionary alloc] init];
    
	return self;
}

- (void)awakeFromNib {
	[playerFilter addRow:self];
	[playerFilter removeRowAtIndex:1];
	
	[physicalFilter addRow:self];
	[physicalFilter removeRowAtIndex:1];
	
	[technicalFilter addRow:self];
	[technicalFilter removeRowAtIndex:1];
	
	[mentalFilter addRow:self];
	[mentalFilter removeRowAtIndex:1];
	
	// [playerFilter removeRowAtIndex:2];
	NSView * v = [[predicateRow templateViews] lastObject];
	if([v isKindOfClass:[NSTextField class]]){
		NSRect frame = [v frame];
		frame.size.width = 200;
		[v setFrame:frame];
	}
    
	[playersTableView setFont:[NSFont fontWithName:@"Helvetica" size:10.0f]];
    [playersTableView setTarget:self];
    [playersTableView setDoubleAction:@selector(showPlayerPanel:)];
}

- (IBAction)searchPlayers:(id)sender {
	NSMutableArray *pSearchResults = [[NSMutableArray alloc] init];
	NSMutableString *expression = [[NSMutableString alloc] init];
	
	if ([[[playerFilter predicate] predicateFormat] length] > 0 &&
		[playerFilter numberOfRows]>1) {
		if ([expression length] > 0) { [expression appendString:@" AND "]; }
		NSString *tmp = [[[playerFilter predicate] predicateFormat] stringByReplacingOccurrencesOfString:@"\"" withString:@"\'"];
		
		// Next Replace all the predicate names with real key paths
		// 1st Predicate
		tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Name\'" withString:@"name"];
		tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Team\'" withString:@"teamString"];
		tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Nationality\'" withString:@"nationString"];
		
		// 2nd Predicate
		tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Age\'" withString:@"age"];
		tmp = [tmp stringByReplacingOccurrencesOfString:@"\'CA\'" withString:@"playerData.currentAbility"];
		tmp = [tmp stringByReplacingOccurrencesOfString:@"\'PA\'" withString:@"playerData.potentialAbility"];
		tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Sale Value\'" withString:@"playerData.value"];
		tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Asking Price\'" withString:@"playerData.askingPrice"];
		tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Position\' == \'GK\'" withString:@"playerStats.goalkeeper >= 15"];
		tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Position\' == \'SW\'" withString:@"playerStats.sweeper >= 15"];
		tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Position\' == \'D R\'" withString:@"playerStats.rightDefender >= 15"];
		tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Position\' == \'D C\'" withString:@"playerStats.centralDefender >= 15"];
		tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Position\' == \'D L\'" withString:@"playerStats.leftDefender >= 15"];
		tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Position\' == \'DM R\'" withString:@"playerStats.rightWingBack >= 15"];
		tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Position\' == \'DM C\'" withString:@"playerStats.centralDefensiveMidfielder >= 15"];
		tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Position\' == \'DM L\'" withString:@"playerStats.leftWingBack >= 15"];
		tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Position\' == \'M R\'" withString:@"playerStats.rightMidfielder >= 15"];
		tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Position\' == \'M C\'" withString:@"playerStats.centralMidfielder >= 15"];
		tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Position\' == \'M L\'" withString:@"playerStats.leftMidfielder >= 15"];
		tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Position\' == \'AM R\'" withString:@"playerStats.rightAttackingMidfielder >= 15"];
		tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Position\' == \'AM C\'" withString:@"playerStats.centralAttackingMidfielder >= 15"];
		tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Position\' == \'AM L\'" withString:@"playerStats.leftAttackingMidfielder >= 15"];
		tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Position\' == \'F C\'" withString:@"playerStats.centreForward >= 15"];
		tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Condition\'" withString:@"playerData.conditionPercent"];
		
		[expression appendFormat:@"(%@)", tmp];
	}
	
	if ([expression length] > 0) {
		[expression appendString:@" AND (playerData != NIL)"];
		NSPredicate *predicate = [NSPredicate predicateWithFormat:expression];
		NSLog(@"final predicate: %@",expression);
		[pSearchResults addObjectsFromArray:[[[controller database] people] filteredArrayUsingPredicate:predicate]];
		NSLog(@"%d results",[pSearchResults count]);
		[self setPlayerSearchResults:pSearchResults];
		
		[controller setBadgeNumber:[pSearchResults count] atIndex:@"1.1"];
	}
    [appDlg endTheSheet:sheet];
}

- (void)splitViewWillResizeSubviews:(NSNotification *)aNotification {
	NSNumber *dragIndex = [[aNotification userInfo] objectForKey:@"NSSplitViewDividerIndex"];
	NSLog(@"Index: %@", dragIndex);
}

- (BOOL)shouldCloseSheet:(id)sender {
	return YES;
}

- (void) showPlayerPanel:(id)sender {
    if (sender == nil) return;
    if ([sender isKindOfClass:[NSTableView class]]) {
        if (![playerDetails isVisible]) {
            [playerDetails makeKeyAndOrderFront:sender];
        }
    }
    else {
        NSLog(@"Type is not NSTableView!!");
    }
}

@end
