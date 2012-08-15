//
//  Controller.m
//  MacAssistant
//
//  Created by Thanos Siopoudis on 8/22/10.
//  Copyright 2010 Thanos. All rights reserved.
//

#import "Controller.h"
#import "SidebarNode.h"
#import "LanguageIDs.h"
#import "GameVersions.h"
#import "FMDateLoader.h"
#import "FMString.h"
#import "Database.h"
#import "SupportFunctions.h"
#import "SXzlib.h"


@implementation Controller

@synthesize gamePath, dataLoaded, gameDBVersion, database, currentDate, idle, loader, prefWindow;

- (id)init
{
	[super init];
	
	infoStrings = [[NSMutableDictionary alloc] init];
	database = [[Database alloc] init];
	[database setController:self];
	
	idle = TRUE;
	
	return self;
}

- (void)awakeFromNib {
	[loader setUsesThreadedAnimation:YES];
    [loaderContainer setFrame:NSRectFromCGRect(CGRectMake(loaderContainer.frame.origin.x, 
                                         -(loaderContainer.frame.size.height), 
                                         loaderContainer.frame.size.width, 
                                         loaderContainer.frame.size.height))];
}

- (BOOL)validateToolbarItem:(NSToolbarItem *)theItem {
    if ([[theItem itemIdentifier] isEqualTo:[loadGameToolbarItem itemIdentifier]]) {
        return (!dataLoaded && idle);
    }
    else {
        return YES;
    }
}

- (void)populateOutlineContents:(id)inObject {
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
	[sidebar setDefaultAction:@selector(buttonDefaultHandler:) target:self];
	
	[sidebar addSection:@"1" caption:@"PEOPLE"];
	//[sidebar addSection:@"2" caption:@"PLACES"];
	//[sidebar addSection:@"3" caption:@"OTHER"];
	
	[sidebar addChild:@"1" key:@"1.1" caption:@"Players" icon:[NSImage imageNamed:@"footballer-icon.png"] action:@selector(selectedSidebarItemPlayers:) target:self];
	//[sidebar addChild:@"1" key:@"1.2" caption:@"Staff" icon:[NSImage imageNamed:@"boss-icon.png"] action:@selector(selectedSidebarItemStaff:) target:self];
	
	//[sidebar addChild:@"2" key:@"2.1" caption:@"Clubs" icon:nil action:@selector(buttonPres:) target:self];
	//[sidebar addChild:@"2" key:@"2.2" caption:@"Nations" icon:nil action:@selector(buttonPres:) target:self];
	
	//[sidebar addChild:@"3" key:@"3.1" caption:@"Game Info" icon:nil action:@selector(buttonPres:) target:self];
	[sidebar reloadData];
    
    [sidebar expandAll];
	
	[pool release];
}
     
- (void) selectedSidebarItemPlayers: (id)sender {
    NSLog(@"Clicked Players");
    [appDlg setDataLoaded:TRUE];
	[[appDlg topToolbar] validateVisibleItems];
}

- (void) selectedSidebarItemStaff: (id)sender {
    NSLog(@"Selected Staff");
    [appDlg setDataLoaded:TRUE];
	[[appDlg topToolbar] validateVisibleItems];
}

- (void) setBadgeNumber: (NSInteger)total atIndex: (NSString *)index {
	[sidebar setBadge:index count:total];
	[sidebar reloadData];
}

- (IBAction) loadGame: (id) sender {
	NSOpenPanel *filesearch = [NSOpenPanel openPanel];
	
	// Limit File selection to specific file types
	[filesearch setAllowedFileTypes:[NSArray arrayWithObjects:@"fm",nil]];
	
	[filesearch beginSheetModalForWindow:mainWin completionHandler:^(NSInteger result) {
		NSLog(@"handler closed with %ld", result);
		if (result == NSFileHandlingPanelOKButton) {
            [self setIdle:FALSE];
            [self validateToolbarItem:loadGameToolbarItem];
            [self setStatusViewTextFieldText:@"Loading..."];
            [self revealLoaderContainer];
            
			// Set the saved game path
			[self setGamePath:[[filesearch URL] path]];
			
			// Add the path to the "recently opened" menus in OSX
			[[NSDocumentController sharedDocumentController] noteNewRecentDocumentURL:[filesearch URL]];
			
			// Check if saved game has been Loaded
			if (dataLoaded) { [self resetdb]; }
            
			// Setup GameDB Thread
			gameDBThread = [[NSThread alloc] initWithTarget:self selector:@selector(initGame:) object:gamePath];
            
			// Graphics Thread HERE
			if ([[NSUserDefaults standardUserDefaults] boolForKey:@"parseGraphics"]==TRUE) { [parseGraphicsThread start]; }
			
			[gameDBThread start];
		}
	}];
}

- (void) resetdb {
	[self setDataLoaded:FALSE];
	[database release];
	database = [[Database alloc] init];
}

- (void) revealLoaderContainer {
    NSViewAnimation *theAnim;
    NSRect firstViewFrame;
    NSRect newViewFrame;
    NSMutableDictionary* firstViewDict;
    
    {
        firstViewDict = [NSMutableDictionary dictionaryWithCapacity:3];
        firstViewFrame = [loaderContainer frame];
        
        [firstViewDict setObject:loaderContainer forKey:NSViewAnimationTargetKey];
        [firstViewDict setObject:[NSValue valueWithRect:firstViewFrame]
                          forKey:NSViewAnimationStartFrameKey];
        
        // Change the ending position of the view.
        newViewFrame = firstViewFrame;
        newViewFrame.origin.y += newViewFrame.size.height;
        
        [firstViewDict setObject:[NSValue valueWithRect:newViewFrame]
                          forKey:NSViewAnimationEndFrameKey];
    }
    
    // Create the view animation object.
    theAnim = [[NSViewAnimation alloc] initWithViewAnimations:[NSArray
                                                               arrayWithObjects:firstViewDict, nil]];
    
    [theAnim setDuration: 0.5];
    [theAnim setAnimationCurve:NSAnimationEaseIn];
    // Run the animation.
    [theAnim startAnimation];
    
    // The animation has finished, so go ahead and release it.
    [theAnim release];
}

- (void) hideLoaderContainer {
    NSViewAnimation *theAnim;
    NSRect firstViewFrame;
    NSRect newViewFrame;
    NSMutableDictionary* firstViewDict;
    
    {
        firstViewDict = [NSMutableDictionary dictionaryWithCapacity:3];
        firstViewFrame = [loaderContainer frame];
        
        [firstViewDict setObject:loaderContainer forKey:NSViewAnimationTargetKey];
        [firstViewDict setObject:[NSValue valueWithRect:firstViewFrame]
                          forKey:NSViewAnimationStartFrameKey];
        
        // Change the ending position of the view.
        newViewFrame = firstViewFrame;
        newViewFrame.origin.y -= newViewFrame.size.height;
        
        [firstViewDict setObject:[NSValue valueWithRect:newViewFrame]
                          forKey:NSViewAnimationEndFrameKey];
    }
    
    // Create the view animation object.
    theAnim = [[NSViewAnimation alloc] initWithViewAnimations:[NSArray
                                                               arrayWithObjects:firstViewDict, nil]];
    
    [theAnim setDuration: 0.3];
    [theAnim setAnimationCurve:NSAnimationEaseIn];
    // Run the animation.
    [theAnim startAnimation];
    
    // The animation has finished, so go ahead and release it.
    [theAnim release];
}
			
- (IBAction) showPreferences:(id)sender {
    if (!prefWindow) {
        prefWindow = [[PreferencesController alloc] initWithWindowNibName:@"Preferences"];
    }
    if (![[prefWindow window] isVisible]) {
        [[prefWindow window] makeKeyAndOrderFront:self];
    }
    [[prefWindow window] center];
}

- (void) initGame: (NSString*) path {
	
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
	BOOL isNewFormat = TRUE;
		
	unsigned int fileLength, gameLength;
	
	[database setStatus:NSLocalizedString(@"Reading File Header...", @"editor status")];
	
	// Create file data object
	NSData *fileData;
	unsigned int i;
	unsigned int byteOffset = 0; // Location to read data from
	unsigned int fileOffset = 0;
	
	//Load file in memory
	NSData *gameData = [[NSData alloc] initWithContentsOfFile: path];
	gameLength = [gameData length];
	
	// Skip the first two bytes (endianess)
	byteOffset += 2;
	
	// Check that the file we are loading is a Football Manager File
	if (![[SupportFunctions readCStringFromData:gameData atOffset:&byteOffset length:4] isEqualToString:@"fmf."]) {
		// If it isn't, alert user
		NSAlert *alert = [NSAlert alertWithMessageText:NSLocalizedString(@"Invalid File", @"error - invalid file") defaultButton:@"OK" alternateButton:nil 
										   otherButton:nil informativeTextWithFormat:NSLocalizedString(@"This does not appear to be a valid FM savegame",@"error - not an FM game")];
		NSLog(@"This does not appear to be a valid FM savegame");
		[alert runModal];
	}
	
	//	0x03 unknown
	//		FM08 - 02 00 00
	//		FM09 - 03 00 00
	//		FM10 - 03 00 00
	//	0x04 fmf length
	//	0x04 unknown
	
	// Increment byte offset (as comment above)
	byteOffset += 11;
	
	// Now check if game is compressed by reading bytes
	[gameData getBytes:&compressed range:NSMakeRange(byteOffset, 1)]; byteOffset += 1;
	// Notify log as appropriate
	if (compressed) { NSLog(@"File Compressed"); }
	else { NSLog(@"File Not Compressed"); } 
	
	[database setStatus:NSLocalizedString(@"Reading game_info.dat...", @"editor status")];
#pragma mark game_info.dat
	if (compressed) {
		// If file is compressed, inflate it.
		fileData = [[NSData alloc] initWithData:[[gameData subdataWithRange:NSMakeRange(byteOffset, ([gameData length] - byteOffset))] zlibInflate]];
		byteOffset += [[fileData zlibDeflate] length];
		NSLog(@"File inflated");
	}
	else {
		// Otherwise set file length (minues already decided offset)
		fileData = [[NSData alloc] initWithData:[gameData subdataWithRange:NSMakeRange(byteOffset, ([gameData length] - byteOffset))]];
		fileLength = [fileData length];
		[gameData release];
	}
	
	// If file length is wrong (i.e. something bad has happened, exit).
	if ([fileData length] == 0) { return; }
	
	//	0x02 unknown
	//	0x04 file type (CString)
	//	0x02 file version
	//	0x09 unknown
	
	// Skip 17 bytes in the new file length (as comment above)
	fileOffset += 17;
	
	char marker;
    int counter = 0;
    NSString *dbFolder = @"/Volumes";
    
	[fileData getBytes:&marker range:NSMakeRange(fileOffset,1)];	fileOffset += 1;
	
	// Marker indicates subdirectory. Once reached, read.
	while (marker==6)
	{
		// Read subdirectory
        if (counter == 0) {
            [FMString readFromData:fileData atOffset:&fileOffset];
        }
        else {
            dbFolder = [dbFolder stringByAppendingString:[NSString stringWithFormat:@"/%@", [FMString readFromData:fileData atOffset:&fileOffset]]];
        }
		[fileData getBytes:&marker range:NSMakeRange(fileOffset,1)];	
		fileOffset += 1;
        counter++;
	}
    
    NSLog(@"lang db location: %@", dbFolder);
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"loadLangDB"] == TRUE) {
        // We need to check here if the lang_db.dat file exists!
        dbFolder = [dbFolder stringByAppendingString:@"/lang_db.dat"];
        if ([[NSFileManager defaultManager] fileExistsAtPath:dbFolder]) {
            // Since we found lang_db.dat make sure it's stored in the NSUserDefaults
            if ([[[NSUserDefaults standardUserDefaults] stringForKey:@"langDBPath"] length] < 2) {
                [[NSUserDefaults standardUserDefaults] setValue:dbFolder forKey:@"langDBPath"];
            }
            
            [database setStatus:NSLocalizedString(@"loading lang_db.dat", @"editor status")];
            [database readLangDB:dbFolder];
        }
	}
	
	//	0x03 unknown
	//	another 0x01 in fm11
	//	0x04 unknown (-1)
	//	0x01 unknown
	
	// Skip 8 bytes (as comment above)
	fileOffset += 9;
	
	// Start Date
	[FMDateLoader readFromData:fileData atOffset:&fileOffset];
	
	[fileData getBytes:&gameID range:NSMakeRange(fileOffset, 4)]; fileOffset += 4;
	
	//	unknown (Not sure what this is for?)
	fileOffset += 2515;
	
	[fileData getBytes:&timesSaved range:NSMakeRange(fileOffset, 4)]; fileOffset += 4;
	
	// 0x04	???
	// 0x04 date
	fileOffset += 8;
	
	[fileData getBytes:&startBuildVersion range:NSMakeRange(fileOffset, 4)]; fileOffset += 4;
	[fileData getBytes:&currentBuildVersion range:NSMakeRange(fileOffset, 4)]; fileOffset += 4;
	
	fileOffset += 10;
	
	// Log current progress
	NSLog(@"game_info.dat: %d of %ld [%d of %ld] read",fileOffset,[fileData length],byteOffset,[gameData length]);
	
	// Output current status to user
	[database setStatus:NSLocalizedString(@"Reading save_game_summary.dat...", @"editor status")];
#pragma mark save_game_summary.dat
	
	// Again if compressed, expand file
	if (compressed) {
		[fileData release];
		fileData = [[NSData alloc] initWithData:[[gameData subdataWithRange:NSMakeRange(byteOffset, ([gameData length] - byteOffset))] zlibInflate]];
		byteOffset += [[fileData zlibDeflate] length];
		fileOffset = 0;
	}
	// Check that worked...
	if ([fileData length] == 0) { return; }
	
	//	0x02 unknown
	//	0x04 file type
	//	0x02 file version
	//	0x01 unknown
	
	// Skip 9 bytes (as comment above)
	fileOffset += 9;
	
	// Store number of leagues active for later
	[infoStrings setObject:[FMString readFromData:fileData atOffset:&fileOffset] forKey:@"leaguesActive"];
	// Likewise with current game version
	[infoStrings setObject:[FMString readFromData:fileData atOffset:&fileOffset] forKey:@"FMVersion"];
	
	// Store human manager's and current employment status
	for (i=1;i<=16;i++) {
		[infoStrings setObject:[FMString readFromData:fileData atOffset:&fileOffset] forKey:[NSString stringWithFormat:@"manager%dname",i]];
		[infoStrings setObject:[FMString readFromData:fileData atOffset:&fileOffset] forKey:[NSString stringWithFormat:@"manager%dclub",i]];
	}
	
	// Read last saved date (TBC)
	[FMDateLoader readFromData:fileData atOffset:&fileOffset];
	
	//	0x04 unknown
	//	0x04 no. of managers
	
	// Skip 8 bytes (as comment above)
	fileOffset += 8;
	
	NSLog(@"save_game_summary.dat: %d of %ld [%d of %ld] read",fileOffset,[fileData length],byteOffset,[gameData length]);
	
	[database setStatus:NSLocalizedString(@"Reading game_db.dat header...", @"editor status")];
#pragma mark game_db.dat
	
	// Again, if compressed, expand
	if (compressed) {
		[fileData release];
		fileData = [[NSData alloc] initWithData:[[gameData subdataWithRange:NSMakeRange(byteOffset, ([gameData length] - byteOffset))] zlibInflate]];
		fileLength = [fileData length];
		[gameData release];
		//	byteOffset += [[fileData zlibDeflate] length];
		fileOffset = 0;
	}
	
	// Check that worked...
	if ([fileData length] == 0) { 
		NSLog(@"Error Loading game_db.dat");
		[self setIdle:TRUE];
		return; 
	}
	
	//	0x02 unknown
	//	0x04 file type
	
	// Skip 6 bytes (as comment above)
	fileOffset += 6;
	
	//Red current game database version
	[fileData getBytes:&gameDBVersion range:NSMakeRange(fileOffset, 2)]; fileOffset += 2;
	NSLog(@"Game Version: %d at %d",gameDBVersion, fileOffset);
	
	//Check version is compatiable with supported versions
	if (gameDBVersion != FM2012_12_2 && gameDBVersion != FM2012_12_1) {
		NSAlert *alert = [NSAlert alertWithMessageText:[NSString stringWithFormat:NSLocalizedString(@"Incompatible Database Version - %hu",@"error"),gameDBVersion] defaultButton:@"OK" alternateButton:nil 
										   otherButton:nil informativeTextWithFormat:NSLocalizedString(@"The version of FM this game was saved under is not compatible with MacAssistant 2012. Please upload a copy of your save game to a filehost and file a new bug at the project's github page (https://github.com/thanoulas/MacAssistant-2012/issues)",@"error message")];
		NSLog(@"Incompatible Database Version.");
		[alert runModal];
		
	}
	
	//	0x06 unknown
	
	// Skip 6 bytes (as comment above)
	fileOffset += 6;
	
	// Read in current saved date
	currentDate = [FMDateLoader readFromData:fileData atOffset:&fileOffset];
	[infoStrings setObject:[[currentDate date] descriptionWithCalendarFormat:@"%d/%m/%Y" timeZone:nil locale:nil] forKey:@"currentGameDate"];
	NSLog(@"Current Date: %@",[currentDate date]);
	
	// 0x01 unknown
	
	// Skip a byte (as comment above)
	fileOffset += 1;
	
	// Read the game start date
	startDate = [FMDateLoader readFromData:fileData atOffset:&fileOffset];
	[infoStrings setObject:[[startDate date] descriptionWithCalendarFormat:@"%d/%m/%Y" timeZone:nil locale:nil] forKey:@"gameStartDate"];
	NSLog(@"Start Date: %@",[startDate date]);
	
	// 0x02 unknown
	
	// Skip two bytes (as comment above)
	fileOffset += 2;
	
	// Read unknown date
	FMDate *unknownDate4 = [FMDateLoader readFromData:fileData atOffset:&fileOffset];
	NSLog(@"Unknown Date 4: %@",[unknownDate4 date]);
	
	// 0x01 unknown
	// Skip a byte (as comment above)
	fileOffset += 1;
	
	// Read uknown date
	FMDate *unknownDate5 = [FMDateLoader readFromData:fileData atOffset:&fileOffset];
	NSLog(@"Unknown Date 5: %@",[unknownDate5 date]);
	
	[fileData getBytes:&databaseChanges range:NSMakeRange(fileOffset, 4)]; fileOffset += 4;
	
	// 0x1537 unknown
	
	// Skip bytes (as comment above)
    if (gameDBVersion >= FM2012_12_1) {
        fileOffset += 1361;
    }
	else if (isNewFormat) { fileOffset += 1526; }
	else {
		fileOffset += 1537;
		
		if (gameDBVersion>FM2010_10_0_1) {
			fileOffset += 4;
		}
	}
	
	//////////////////////////////////
	// Tidy up
	[pool drain];
	
	pool = [[NSAutoreleasePool alloc] init];
	
	saveStartOffset = fileOffset;
	
	if (!compressed) { saveStartOffset += 18; }
	
    // Write uncompressed data to desktop (for debug purposes)
    // [fileData writeToFile:@"/Users/Tom/Desktop/data.tad" atomically:YES];
    
	// read game DB
	[database readGameDB:fileData atOffset:&fileOffset];
	
	if (!compressed) { [database setSaveEndOffset:([database saveEndOffset] + 18)]; }
	
	NSLog(@"game_db.dat: %d of %d [%d of %d] read",fileOffset,fileLength,byteOffset,gameLength);
	
	[fileData release];
	
	[self setIdle:TRUE];
	[self setDataLoaded:TRUE];
    
	[self populateOutlineContents:nil];
    [self doneLoadingSaveGame];
	
    [self performSelectorOnMainThread:@selector(hideLoaderContainer) withObject:nil waitUntilDone:NO];
    
	[pool drain];
	/////////////////////////////////
}

- (BOOL)application:(NSApplication *)theApplication openFile:(NSString *)filename
{
	// check it still exists
	BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:filename];
	
	//	10.6 >
	//	[self setGamePath:[NSURL fileURLWithPath:filename]];
	//	10.5
	[self setGamePath:filename];
	
	if (dataLoaded) { [self resetDB]; }
	
	parseGraphicsThread = [[NSThread alloc] initWithTarget:database selector:@selector(parseGraphics:) object:[[NSUserDefaults standardUserDefaults] stringForKey:@"graphicsLocation"]];
	gameDBThread = [[NSThread alloc] initWithTarget:self selector:@selector(initGame:) object:filename];
	if ([[NSUserDefaults standardUserDefaults] boolForKey:@"parseGraphics"]==TRUE) { [parseGraphicsThread start]; }
	[gameDBThread start];
	
	return fileExists;
}

- (void)resetDB
{
	[self setDataLoaded:FALSE];
	[database release];
	database = [[Database alloc] init];
}

- (void)setStatusViewTextFieldText: (NSString *)text {
    [statusText setStringValue:text];
}

- (void)doneLoadingSaveGame {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    NSNumberFormatter *numFormatter = [[NSNumberFormatter alloc] init];
    [numFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    
    NSString *countries = [numFormatter stringFromNumber:[NSNumber numberWithUnsignedInt:[[database nations] count]]];
    NSString *clubs = [numFormatter stringFromNumber:[NSNumber numberWithUnsignedInt:[[database clubs] count]]];
    NSString *people = [numFormatter stringFromNumber:[NSNumber numberWithUnsignedInt:[[database people] count]]];
    
    [self setStatusViewTextFieldText:[NSString stringWithFormat:@"Loaded %@ Countries, %@ Clubs and %@ Persons", 
                                     countries, 
                                     clubs, 
                                     people]];
    
    [pool release];
}
						
@end
