//
//  ContentController.h
//  MacAssistant
//
//  Created by Thanos Siopoudis on 9/7/10.
//  Copyright 2010 Thanos. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <BWToolkitFramework/BWToolkitFramework.h>

@interface ContentController : NSObject<NSSplitViewDelegate> {
	IBOutlet Controller						*controller;
	NSMutableArray							*playerSearchResults;
	NSMutableDictionary						*selectedRows;
	IBOutlet NSTextField					*playerName;
	IBOutlet NSPredicateEditor				*playerFilter, *physicalFilter, *technicalFilter, *mentalFilter;
	IBOutlet NSTableView					*playersTableView;
	IBOutlet NSPredicateEditorRowTemplate	*predicateRow;
	IBOutlet BWStyledTextField				*styledText;
	IBOutlet BWStyledTextField				*physicalText;
	IBOutlet BWStyledTextField				*personalText;
	IBOutlet BWStyledTextField				*technicalText;
	IBOutlet BWStyledTextField				*mentalText;
	IBOutlet BWSheetController				*sheetController;
	IBOutlet NSButton						*searchButton;
}

- (IBAction)searchPlayers:(id)sender;
- (BOOL)shouldCloseSheet:(id)sender;

@property(readwrite, copy) NSMutableArray		*playerSearchResults;
@property(readwrite, copy) NSMutableDictionary	*selectedRows;

@end
