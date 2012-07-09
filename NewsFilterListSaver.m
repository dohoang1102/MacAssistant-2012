//
//  NewsFilterListSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 10/07/26.
//  Copyright 2010 littleblue. All rights reserved.
//

#import "NewsFilterListSaver.h"
#import "NewsFilterSaver.h"
#import "SupportFunctions.h"
#import "GameVersions.h"

@implementation NewsFilterListSaver

+ (void)saveFilterList:(NewsFilterList *)object toData:(NSMutableData *)data version:(short)version
{
	int ibuffer;
	
	if (version >= FM2010_10_3) {
		[data appendData:[object unknownData1]];
	}
	
	[SupportFunctions saveCString:[object type] toData:data];
	
	ibuffer = [[object filters] count];
	[data appendBytes:&ibuffer length:4];
	for (int i = 0; i<[[object filters] count]; i++) {
		[NewsFilterSaver saveFilter:[[object filters] objectAtIndex:i] toData:data];
	}
	
	if ([[object type] isEqualToString:@"tslntslf"]) {
		[data appendData:[object unknownData2]];
	}
	else if ([[object type] isEqualToString:@"slfttslf"]) {
		[data appendData:[object unknownData3]];
	}
}

@end
