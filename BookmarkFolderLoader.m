//
//  BookmarkFolderLoader.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/22.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "BookmarkFolderLoader.h"
#import "GeneralInfoLoader.h"

@implementation BookmarkFolderLoader

+ (BookmarkFolder *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset
{
	int ibuffer, ibuffer2;
	NSMutableArray *tempArray, *tempArray2;
	
	unsigned int offset = *byteOffset;
	
	BookmarkFolder *object = [[BookmarkFolder alloc] init];
	
	NSLog(@"at infos at %d",offset);
	
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	tempArray = [[NSMutableArray alloc] init];
	for (int i=0;i<ibuffer;i++) {
		[tempArray addObject:[GeneralInfoLoader readFromData:data atOffset:&offset readInfo:YES]];
	}
	[object setInfos:tempArray];
	[tempArray release];
	
	NSLog(@"at bookmarks at %d",offset);
	
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	tempArray = [[NSMutableArray alloc] init];
	for (int i=0;i<ibuffer;i++) {
		tempArray2 = [[NSMutableArray alloc] init];
		[data getBytes:&ibuffer2 range:NSMakeRange(offset, 4)]; offset += 4;
		for (int j=0;j<ibuffer2;j++) {
			[tempArray2 addObject:[GeneralInfoLoader readFromData:data atOffset:&offset readInfo:YES]];
		}
		[tempArray addObject:tempArray2];
		[tempArray2 release];
	}
	[object setBookmarks:tempArray];
	[tempArray release];
	
//	NSLog(@"at subFolders at %d",offset);
	
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	tempArray = [[NSMutableArray alloc] init];
	for (int i=0;i<ibuffer;i++) {
		[tempArray addObject:[BookmarkFolderLoader readFromData:data atOffset:&offset]];
	}
	[object setSubFolders:tempArray];
	[tempArray release];
	
	*byteOffset = offset;
	
	return object;
}

@end
