//
//  BookmarkFolderSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 10/07/26.
//  Copyright 2010 littleblue. All rights reserved.
//

#import "BookmarkFolderSaver.h"
#import "GeneralInfoSaver.h"

@implementation BookmarkFolderSaver

+ (void)saveFolder:(BookmarkFolder *)object toData:(NSMutableData *)data
{
	int ibuffer;
	
	ibuffer = [[object infos] count];
	[data appendBytes:&ibuffer length:4];
	for (int i = 0; i<[[object infos] count]; i++) {
		[GeneralInfoSaver saveInfo:[[object infos] objectAtIndex:i] toData:data saveInfo:YES];
	}
	
	ibuffer = [[object bookmarks] count];
	[data appendBytes:&ibuffer length:4];
	for (int i = 0; i<[[object bookmarks] count]; i++) {
		ibuffer = [[[object bookmarks] objectAtIndex:i] count];
		[data appendBytes:&ibuffer length:4];
		for (int j = 0; j<[[[object bookmarks] objectAtIndex:i] count]; j++) {
			[GeneralInfoSaver saveInfo:[[[object bookmarks] objectAtIndex:i] objectAtIndex:j] toData:data saveInfo:YES];
		}
	}
	
	ibuffer = [[object subFolders] count];
	[data appendBytes:&ibuffer length:4];
	for (int i = 0; i<[[object subFolders] count]; i++) {
		[BookmarkFolderSaver saveFolder:[[object subFolders] objectAtIndex:i] toData:data];
	}
}

@end
