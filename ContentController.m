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

// Use RegExKit for OS X < 10.7
#if __MAC_OS_X_VERSION_MAX_ALLOWED < 1070
#import <RegexKit/RegexKit.h>
#endif

@implementation ContentController

@synthesize playerSearchResults, selectedRows, selectedPlayer;

- (id)init
{
	[super init];
    selectedRows = [[NSMutableDictionary alloc] init];
    [controller setContent:self];
    
	return self;
}

- (void)awakeFromNib {
	[playerFilter addRow:self];
	[playerFilter removeRowAtIndex:1];
	
	[statsFilter addRow:self];
	[statsFilter removeRowAtIndex:1];
	
	// [playerFilter removeRowAtIndex:2];
	NSView *v = [[predicateRow templateViews] lastObject];
	if([v isKindOfClass:[NSTextField class]]){
		NSRect frame = [v frame];
		frame.size.width = 200;
		[v setFrame:frame];
	}
    
    NSView * v2 = [[predicateRow2 templateViews] lastObject];
	if([v2 isKindOfClass:[NSTextField class]]){
		NSRect frame = [v2 frame];
		frame.size.width = 100;
		[v2 setFrame:frame];
	}
    
	[playersTableView setFont:[NSFont fontWithName:@"Helvetica" size:10.0f]];
    [playersTableView setTarget:self];
    [playersTableView setDoubleAction:@selector(showPlayerPanel:)];
}

- (IBAction)searchPlayers:(id)sender {
    [[controller database] setStatus:@"Searching, please wait..."];
    [[controller loader] setIndeterminate:YES];
    [[controller loader] startAnimation:self];
    [controller revealLoaderContainer];
    [appDlg endTheSheet:sheet];
	searchThread = [[NSThread alloc] initWithTarget:self selector:@selector(performSearch) object:nil];
    [searchThread start];
}

- (void)performSearch {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    NSMutableArray *pSearchResults = [[NSMutableArray alloc] init];
	NSMutableString *expression = [[NSMutableString alloc] init];
	
    // First Predicate Group
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
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Condition\'" withString:@"playerData.conditionPercent"];
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Adaptability\'" withString:@"personStats.adaptability"];
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Ambition\'" withString:@"personStats.admbition"];
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Controversy\'" withString:@"personStats.controversy"];
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Loyalty\'" withString:@"personStats.loyalty"];
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Pressure\'" withString:@"personStats.pressure"];
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Professionalism\'" withString:@"personStats.professionalism"];
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Sportsmanship\'" withString:@"personStats.sportsmanship"];
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Temperament\'" withString:@"personStats.temperament"];
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Home Reputation\'" withString:@"playerData.homeReputation"];
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Current Reputation\'" withString:@"playerData.currentReputation"];
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'World Reputation\'" withString:@"playerData.worldReputation"];
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Fitness\'" withString:@"playerData.fitnessPercent"];
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Jadedness\'" withString:@"playerData.jadedness"];
        
        // 3rd Predicate
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
        
        // 4th Predicate
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Contract Start Date\'" withString:@"mainContractStartNSDate"];
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Contract End Date\'" withString:@"mainContractEndNSDate"];
        
        // 5th Predicate
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Main Contract Type\'" withString:@"mainContractType"];
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Second Contract Type\'" withString:@"secondContractType"];
        
        // 6th Predicate
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Squad Status\'" withString:@"mainContractSquadStatus"];
		
		[expression appendFormat:@"(%@)", tmp];
	}
    
    // Second Predicate Group
    if ([[[statsFilter predicate] predicateFormat] length] > 0 && [statsFilter numberOfRows] > 1) {
        if ([expression length] > 0) { [expression appendString:@" AND "]; }
        
        
        NSString *tmp = [[[statsFilter predicate] predicateFormat] stringByReplacingOccurrencesOfString:@"\"" withString:@"\'"];
        
        NSMutableString *strToMakeReplacements = [[NSMutableString alloc] initWithString:tmp];
        
#if __MAC_OS_X_VERSION_MAX_ALLOWED > 1070
        NSError *error = nil;
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"([0-9]+)" options:NSRegularExpressionCaseInsensitive error:&error];
        
        NSArray *matches = [regex matchesInString:tmp options:NSMatchingReportProgress range:NSMakeRange(0, [tmp length])];
        for (int i = [matches count]-1; i>=0 ; i--) {
            NSTextCheckingResult *match = [matches objectAtIndex:i];
            
            NSRange matchRange = match.range;
            NSString *numString = [tmp substringWithRange:NSMakeRange(matchRange.location, matchRange.length)];
            NSInteger num = [numString intValue];
            
            NSString * replacementValue = [NSString stringWithFormat:@"%i", (int)(num / 0.2)];
            
            [strToMakeReplacements replaceCharactersInRange:match.range withString:replacementValue];
        }
#else
        NSString *regex = @"([0-9]+)";
        RKEnumerator *matches = [tmp matchEnumeratorWithRegex: regex];
        while ([matches nextRanges] != NULL) {
            NSRange matchRange = [matches currentRange];
            NSString *numString = [tmp substringWithRange:NSMakeRange(matchRange.location, matchRange.length)];
            NSInteger num = [numString intValue];
            
            NSString * replacementValue = [NSString stringWithFormat:@"%i", (int)(num / 0.2)];
            
            [strToMakeReplacements replaceCharactersInRange:[matches currentRange] withString:replacementValue];
        }
#endif        
         
        tmp = strToMakeReplacements;
        
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Corners\'" withString:@"playerStats.corners"];
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Crossing\'" withString:@"playerStats.crossing"];
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Dribbling\'" withString:@"playerStats.dribbling"];
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Finishing\'" withString:@"playerStats.finishing"];
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'First Touch\'" withString:@"playerStats.firstTouch"];
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Free Kick Taking\'" withString:@"playerStats.freeKicks"];
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Heading\'" withString:@"playerStats.heading"];
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Long Shots\'" withString:@"playerStats.longShots"];
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Long Throws\'" withString:@"playerStats.longThrows"];
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Marking\'" withString:@"playerStats.marking"];
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Passing\'" withString:@"playerStats.passing"];
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Penalty Taking\'" withString:@"playerStats.penalties"];
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Tackling\'" withString:@"playerStats.tackling"];
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Technique\'" withString:@"playerStats.technique"];
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Aggression\'" withString:@"playerStats.aggression"];
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Anticipation\'" withString:@"playerStats.anticipation"];
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Bravery\'" withString:@"playerStats.bravery"];
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Composure\'" withString:@"playerStats.composure"];
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Concentration\'" withString:@"playerStats.concentration"];
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Creativity\'" withString:@"playerStats.creativity"];
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Decisions\'" withString:@"playerStats.decisions"];
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Determination\'" withString:@"playerStats.determination"];
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Flair\'" withString:@"playerStats.flair"];
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Influence\'" withString:@"playerStats.influence"];
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Off The Ball\'" withString:@"playerStats.offTheBall"];
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Positioning\'" withString:@"playerStats.positioning"];
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Teamwork\'" withString:@"playerStats.teamwork"];
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Work Rate\'" withString:@"playerStats.workRate"];
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Acceleration\'" withString:@"playerStats.acceleration"];
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Agility\'" withString:@"playerStats.agility"];
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Balance\'" withString:@"playerStats.balance"];
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Jumping\'" withString:@"playerStats.jumping"];
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Natural Fitness\'" withString:@"playerStats.naturalFitness"];
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Pace\'" withString:@"playerStats.pace"];
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Stamina\'" withString:@"playerStats.stamina"];
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Strength\'" withString:@"playerStats.strength"];
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Dirtiness\'" withString:@"playerStats.dirtiness"];
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Consistency" withString:@"playerStats.consistency"];
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Important Matches\'" withString:@"playerStats.importantMatches"];
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Injury Proneness\'" withString:@"playerStats.injuryProneness"];
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Versatility\'" withString:@"playerStats.versatility"];
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Aerial Ability\'" withString:@"playerStats.aerialAbility"];
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Command of Area\'" withString:@"playerStats.commandOfArea"];
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Communication\'" withString:@"playerStats.communication"];
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Handling\'" withString:@"playerStats.handling"];
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Kicking\'" withString:@"playerStats.kicking"];
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'One on Ones\'" withString:@"playerStats.oneOnOnes"];
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Reflexes\'" withString:@"playerStats.reflexes"];
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Eccentricity\'" withString:@"playerStats.eccentricity"];
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Rushing Out\'" withString:@"playerStats.rushingOut"];
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Tendency to Punch\'" withString:@"playerStats.tendencyToPunch"];
        tmp = [tmp stringByReplacingOccurrencesOfString:@"\'Throwing\'" withString:@"playerStats.throwing"];
        
        [expression appendFormat:@"(%@)", tmp];
    }
	
	if ([expression length] > 0) {
		[expression appendString:@" AND (playerData != NIL)"];
		NSPredicate *predicate = [NSPredicate predicateWithFormat:expression];
		NSLog(@"final predicate: %@",expression);
		[pSearchResults addObjectsFromArray:[[[controller database] people] filteredArrayUsingPredicate:predicate]];
		NSLog(@"%ld results",[pSearchResults count]);
        [self performSelectorOnMainThread:@selector(setResultsWithArray:) withObject:pSearchResults waitUntilDone:NO];
	}
    
    [pool release];
}

- (void) setResultsWithArray: (NSMutableArray *)results {
    [self setPlayerSearchResults:results];
    
    [controller setBadgeNumber:[results count] atIndex:@"1.1"];
    [controller hideLoaderContainer];
    [[controller loader] stopAnimation:self];
    [[controller loader] setIndeterminate:NO];
}

- (void)splitViewWillResizeSubviews:(NSNotification *)aNotification {
	NSNumber *dragIndex = [[aNotification userInfo] objectForKey:@"NSSplitViewDividerIndex"];
	NSLog(@"Index: %@", dragIndex);
}

- (BOOL)shouldCloseSheet:(id)sender {
	return YES;
}

- (IBAction)clearSearchTerms:(id)sender {
    // Remove all rows except the first one
    
    int totalRows = [playerFilter numberOfRows];
    for (int i=totalRows; i>1; i--) {
        if (i > 1) {
            [playerFilter removeRowAtIndex:(i - 1) ];
        }
    }
    
    totalRows = [statsFilter numberOfRows];
    for (int i=totalRows; i>1; i--) {
        if (i > 1) {
            [statsFilter removeRowAtIndex:(i - 1)];
        }
    }
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
