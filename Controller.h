//
//  Controller.h
//  MacAssistant
//
//  Created by Thanos Siopoudis on 8/22/10.
//  Copyright 2010 Thanos. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Sidebar.h"
#import "MacAssistantAppDelegate.h"
#import "MAView.h"
#import "PreferencesController.h"

@class Database;
@class FMDate;

@interface Controller : NSWindowController<NSAnimationDelegate> {
	NSString                            *gamePath;
	BOOL                                idle, dataLoaded, compressed;
	unsigned short                      gameDBVersion;
	Database                            *database;
	FMDate                              *currentDate, *startDate;
	NSThread                            *gameDBThread;
	NSThread                            *parseGraphicsThread;
	int                                 databaseChanges, timesSaved, startBuildVersion, saveStartOffset, currentBuildVersion, gameID;
	NSMutableDictionary                 *infoStrings;
    
	IBOutlet NSProgressIndicator        *loader;
	IBOutlet Sidebar                    *sidebar;
	IBOutlet NSWindow                   *mainWin;
    IBOutlet MacAssistantAppDelegate    *appDlg;
    IBOutlet NSTextField                *statusText;
    IBOutlet MAView                     *loaderContainer;
    IBOutlet NSToolbarItem              *loadGameToolbarItem;
    IBOutlet PreferencesController      *prefWindow;
}

- (IBAction) showPreferences:(id)sender;
- (IBAction) loadGame: (id) sender;
- (void) resetdb;
- (void) initGame: (NSString *)path;
- (void) resetDB;
- (void) populateOutlineContents:(id)inObject;
- (void) setBadgeNumber: (NSInteger)total atIndex: (NSString *)index;
- (void) revealLoaderContainer;
- (void) hideLoaderContainer;

@property(nonatomic, retain) IBOutlet NSProgressIndicator *loader;
@property(nonatomic, retain) IBOutlet PreferencesController *prefWindow;

@property(copy, readwrite) NSString *gamePath;
@property(copy, readwrite) FMDate *currentDate;

@property(assign, readwrite) Database *database;
@property(assign, readwrite) BOOL idle, dataLoaded;
@property(assign, readwrite) unsigned short gameDBVersion;

@end
