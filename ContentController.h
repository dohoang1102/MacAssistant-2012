//
//  ContentController.h
//  MacAssistant
//
//  Created by Thanos Siopoudis on 9/7/10.
//  Copyright 2010 Thanos. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MacAssistantAppDelegate.h"

@interface ContentController : NSObject<NSSplitViewDelegate,NSTableViewDelegate> {
	IBOutlet Controller						*controller;
	NSMutableArray							*playerSearchResults;
	NSMutableDictionary						*selectedRows;
	IBOutlet NSPredicateEditor				*playerFilter, *physicalFilter, *technicalFilter, *mentalFilter;
	IBOutlet NSTableView					*playersTableView;
	IBOutlet NSPredicateEditorRowTemplate	*predicateRow;
	IBOutlet NSButton						*searchButton;
    IBOutlet NSPanel                        *sheet;
    IBOutlet MacAssistantAppDelegate        *appDlg;
}

- (IBAction)searchPlayers:(id)sender;
- (BOOL)shouldCloseSheet:(id)sender;

@property(readwrite, copy) NSMutableArray		*playerSearchResults;
@property(readwrite, copy) NSMutableDictionary	*selectedRows;

@end
