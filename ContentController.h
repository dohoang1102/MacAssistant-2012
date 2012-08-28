//
//  ContentController.h
//  MacAssistant
//
//  Created by Thanos Siopoudis on 9/7/10.
//  Copyright 2010 Thanos. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MacAssistantAppDelegate.h"
#import "Controller.h"

@interface ContentController : NSObject<NSSplitViewDelegate,NSTableViewDelegate> {
	NSMutableArray							*playerSearchResults;
    NSMutableArray                          *selectedPlayer;
	NSMutableDictionary						*selectedRows;
    NSThread                                *searchThread;
    
    IBOutlet NSArrayController              *pSearchResultsController;
    IBOutlet Controller						*controller;
	IBOutlet NSPredicateEditor				*playerFilter, *statsFilter;
	IBOutlet NSTableView					*playersTableView;
	IBOutlet NSPredicateEditorRowTemplate	*predicateRow;
    IBOutlet NSPredicateEditorRowTemplate	*predicateRow2;
	IBOutlet NSButton						*searchButton;
    IBOutlet NSPanel                        *sheet;
    IBOutlet MacAssistantAppDelegate        *appDlg;

    // playerDetailPanel IBOutlets
    IBOutlet NSPanel                        *playerDetails;
    IBOutlet NSTextField                    *playerName;
    IBOutlet NSTextField                    *playerCA;
    IBOutlet NSTextField                    *playerPA;
}

//- (void)setupImageTextCells;
- (IBAction)searchPlayers:(id)sender;
- (IBAction)clearSearchTerms:(id)sender;
- (BOOL)shouldCloseSheet:(id)sender;

@property(readwrite, copy) NSMutableArray		*playerSearchResults;
@property(readwrite, copy) NSMutableArray		*selectedPlayer;
@property(readwrite, copy) NSMutableDictionary	*selectedRows;

@end
