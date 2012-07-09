//
//  NewsFilterListLoader.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/22.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "GameVersions.h"
#import "NewsFilterListLoader.h"
#import "NewsFilterLoader.h"
#import "SupportFunctions.h"

@implementation NewsFilterListLoader

+ (NewsFilterList *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset version:(short)version
{
	int ibuffer;
	NSMutableArray *tempArray;
	
	unsigned int offset = *byteOffset;
	
	NewsFilterList *object = [[NewsFilterList alloc] init];
	
	if (version >= FM2010_10_3) {
		// sub type?
		[object setUnknownData1:[data subdataWithRange:NSMakeRange(offset, 4)]]; 
		offset += 4;
	}
	
	[object setType:[SupportFunctions readCStringFromData:data atOffset:&offset length:8]];
	
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	tempArray = [[NSMutableArray alloc] init];
	for (int i=0;i<ibuffer;i++) {
		[tempArray addObject:[NewsFilterLoader readFromData:data atOffset:&offset]];
	}
	[object setFilters:tempArray];
	[tempArray release];
	
	if ([[object type] isEqualToString:@"tslntslf"]) {
		// ???
		[object setUnknownData2:[data subdataWithRange:NSMakeRange(offset, 4)]]; 
		offset += 4;
	}
	else if ([[object type] isEqualToString:@"slfttslf"]) {
		// ???
		[object setUnknownData3:[data subdataWithRange:NSMakeRange(offset, 10)]]; 
		offset += 10;
	}
	
	*byteOffset = offset;
	
	return object;
}

@end
