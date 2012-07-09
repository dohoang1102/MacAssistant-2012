//
//  NewsFilterSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 10/07/26.
//  Copyright 2010 littleblue. All rights reserved.
//

#import "NewsFilterSaver.h"
#import "NewsInfoSaver.h"
#import "FMString.h"
#import "SupportFunctions.h"

@implementation NewsFilterSaver

+ (void)saveFilter:(NewsFilter *)object toData:(NSMutableData *)data
{
	char cbuffer;
	int ibuffer;
	
	[SupportFunctions saveCString:[object type] toData:data];
	
	if ([[object type] isEqualToString:@"frlptlif"]) {
		cbuffer = [object unknownChar1];
		[data appendBytes:&cbuffer length:1];
	}
	else if ([[object type] isEqualToString:@"flpntlif"]) {
		cbuffer = [object unknownChar1];
		[data appendBytes:&cbuffer length:1];
	}
	else if ([[object type] isEqualToString:@"lblctlif"]) {
		[data appendData:[object unknownData1]];
	}
	
	[FMString saveString:[object unknownString1] toData:data];
	[data appendData:[object unknownData2]];
	
	ibuffer = [[object infos] count];
	[data appendBytes:&ibuffer length:4];
	for (int i = 0; i<[[object infos] count]; i++) {
		[NewsInfoSaver saveInfo:[[object infos] objectAtIndex:i] toData:data inType:[object type]];
	}
}

@end
