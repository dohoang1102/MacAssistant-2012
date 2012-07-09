//
//  AlternativeStadiumLoader.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/14.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "AlternativeStadiumLoader.h"
#import "FMDateLoader.h"

@implementation AlternativeStadiumLoader

+ (AlternativeStadium *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset
{
	char cbuffer;
	int ibuffer;
	
	unsigned int offset = *byteOffset;
	
	AlternativeStadium *object = [[AlternativeStadium alloc] init];
	
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setStadiumID:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setClubID:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setCompetitionID:ibuffer];
	
	// ???
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar1:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar2:cbuffer];
	[object setUnknownDate1:[FMDateLoader readFromData:data atOffset:&offset]];
	[object setUnknownDate2:[FMDateLoader readFromData:data atOffset:&offset]];
	
	*byteOffset = offset;
	
	return object;
}

@end
