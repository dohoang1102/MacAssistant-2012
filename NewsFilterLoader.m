//
//  NewsFilterLoader.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/22.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "NewsFilterLoader.h"
#import "NewsInfoLoader.h"
#import "FMString.h"
#import "SupportFunctions.h"

@implementation NewsFilterLoader

+ (NewsFilter *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset
{
	char cbuffer;
	int ibuffer;
	NSMutableArray *tempArray;
	
	unsigned int offset = *byteOffset;
	
	NewsFilter *object = [[NewsFilter alloc] init];
	
	[object setType:[SupportFunctions readCStringFromData:data atOffset:&offset length:8]];
	NSLog(@"Filter Type: %@",[object type]);
	
	if ([[object type] isEqualToString:@"frlptlif"]) {
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar1:cbuffer];
	}
	else if ([[object type] isEqualToString:@"flpntlif"]) {
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar1:cbuffer];
	}
	else if ([[object type] isEqualToString:@"lblctlif"]) {
		[object setUnknownData1:[data subdataWithRange:NSMakeRange(offset, 7)]]; 
		offset += 7;
	}
	
	[object setUnknownString1:[FMString readFromData:data atOffset:&offset]];
	
	[object setUnknownData2:[data subdataWithRange:NSMakeRange(offset, 11)]]; 
	offset += 11;
	
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	tempArray = [[NSMutableArray alloc] init];
	for (int i=0;i<ibuffer;i++) {
		[tempArray addObject:[NewsInfoLoader readFromData:data atOffset:&offset inType:[object type]]];
	}
	[object setInfos:tempArray];
	[tempArray release];
	
	*byteOffset = offset;
	
	return object;
}

@end
