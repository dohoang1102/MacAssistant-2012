//
//  HumanLoader.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/22.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "GameVersions.h"
#import "HumanLoader.h"
#import "FMDateLoader.h"
#import "FMString.h"
#import "GeneralInfoLoader.h"
#import "BookmarkFolderLoader.h"
#import "NewsFilterListLoader.h"
#import "SupportFunctions.h"

@implementation HumanLoader

+ (Human *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset version:(short)version
{
	char cbuffer;
	short sbuffer;
	int ibuffer;
    
    NSMutableArray *tempArray;
	
	unsigned int offset = *byteOffset;
	
	Human *object = [[Human alloc] init];
	
	// ???
	[object setUnknownData1:[data subdataWithRange:NSMakeRange(offset, 10)]]; 
	offset += 10;
	
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setUnreadNewsItems:sbuffer];
	
	// ???
	//[object setUnknownData2:[data subdataWithRange:NSMakeRange(offset, 2)]]; 
	//offset += 2;
	
	[object setHolidayReturnDate:[FMDateLoader readFromData:data atOffset:&offset]];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setFogOfWarIndex:ibuffer];
	
	// ???
	[object setUnknownData3:[data subdataWithRange:NSMakeRange(offset, 2)]]; 
	offset += 2;
	
	[object setPassword:[FMString readFromData:data atOffset:&offset]];
	
    
	// ???
	[object setUnknownData17:[data subdataWithRange:NSMakeRange(offset, 184)]]; 
	offset += 184;
    
    if (version == FM2012_12_2) {
        offset += 48;
    }
    
    offset += 8;
    
    [data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
    //offset += (sbuffer * 16);
    
    offset += 128;
    
    offset += 20;
    
    [data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
    for (int x=0; x<cbuffer; x++) {
        [data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		tempArray = [[NSMutableArray alloc] init];
		for (int i=0;i<ibuffer;i++) {
			[tempArray addObject:[GeneralInfoLoader readFromData:data atOffset:&offset readInfo:YES]];
		}
		// [object setHomePageInfos:tempArray];
		[tempArray release];
    }
    
    [data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
    for (int i=0; i<sbuffer; i++) {
        offset += 216;
        offset += 25;
        [data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
        for (int x=0; x<ibuffer; x++) {
            offset += 17;
        }
    }
    
    offset += 28;
    if (version == FM2012_12_2) {
        offset += 8; // Two extra dates
    }
    
    [data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
    for (int i=0; i<ibuffer; i++) {
        offset += 19;
    }
    
    offset += 8;
    [data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
    offset += (ibuffer * 21);
    
    [data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
    offset += (ibuffer * 18);
    
    offset += 28;
    
    offset += 24;
    
    NSLog(@"at home page at %d",offset);
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setHomePageSet:cbuffer];
	
	if ([object homePageSet]) {
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		tempArray = [[NSMutableArray alloc] init];
		for (int i=0;i<ibuffer;i++) {
			[tempArray addObject:[GeneralInfoLoader readFromData:data atOffset:&offset readInfo:YES]];
		}
		[object setHomePageInfos:tempArray];
		[tempArray release];
	}
    
	NSLog(@"out of human at %d",offset);
	
	*byteOffset = offset;
	
	return object;
}

@end
