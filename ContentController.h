//
//  ContentController.h
//  MacAssistant
//
//  Created by Thanos Siopoudis on 9/7/10.
//  Copyright 2010 Thanos. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ContentController : NSObject<NSSplitViewDelegate> {
	IBOutlet Controller						*controller;
	NSMutableArray							*playerSearchResults;
	NSMutableDictionary						*selectedRows;
	IBOutlet NSTextField					*playerName;
	IBOutlet NSPredicateEditor				*playerFilter, *physicalFilter, *technicalFilter, *mentalFilter;
	IBOutlet NSTableView					*playersTableView;
	IBOutlet NSPredicateEditorRowTemplate	*predicateRow;
	IBOutlet NSTextField                    *styledText;
	IBOutlet NSTextField                    *physicalText;
	IBOutlet NSTextField                    *personalText;
	IBOutlet NSTextField                    *technicalText;
	IBOutlet NSTextField                    *mentalText;
	IBOutlet NSTextField                    *sheetController;
	IBOutlet NSButton						*searchButton;
}

- (IBAction)searchPlayers:(id)sender;
- (BOOL)shouldCloseSheet:(id)sender;

@property(readwrite, copy) NSMutableArray		*playerSearchResults;
@property(readwrite, copy) NSMutableDictionary	*selectedRows;

@end
