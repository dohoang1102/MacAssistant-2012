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
	
	NSPersistentStoreCoordinator *persistentStoreCoordinator;
    NSManagedObjectModel *managedObjectModel;
    NSManagedObjectContext *managedObjectContext;
    IBOutlet NSPanel *sheet;
}

@property (assign) IBOutlet NSWindow *window;

@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;

- (IBAction)saveAction:sender;

@end
