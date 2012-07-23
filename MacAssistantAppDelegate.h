//
//  MacAssistantAppDelegate.h
//  MacAssistant
//
//  Created by Thanos Siopoudis on 8/22/10.
//  Copyright 2010 Thanos. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MacAssistantAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
	
	NSPersistentStoreCoordinator    *persistentStoreCoordinator;
    NSManagedObjectModel            *managedObjectModel;
    NSManagedObjectContext          *managedObjectContext;
    BOOL                            dataLoaded;
    
    IBOutlet NSPanel                *sheet;
    IBOutlet NSToolbar              *topToolbar;
    IBOutlet NSToolbarItem          *searchToolbarItem;
}

@property (assign) IBOutlet NSWindow *window;
@property (nonatomic, retain) IBOutlet NSToolbar *topToolbar;

@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;

@property (assign, readwrite) BOOL dataLoaded;

- (IBAction)saveAction:sender;
- (IBAction)showTheSheet:(id)sender;
- (IBAction)endTheSheet:(id)sender;

@end
