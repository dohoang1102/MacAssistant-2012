//
//  FixtureBlockLoader.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/17.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "FixtureBlockLoader.h"
#import "FMDateLoader.h"

@implementation FixtureBlockLoader

+ (FixtureBlock *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset
{
	char cbuffer;
	short sbuffer;
	
	unsigned int offset = *byteOffset;
	
	FixtureBlock *object = [[FixtureBlock alloc] init];
	
	[object setStartDate:[FMDateLoader readFromData:data atOffset:&offset]];
	[object setEndDate:[FMDateLoader readFromData:data atOffset:&offset]];
    
    // FM 2012 Extra Date
    offset += 4;
	
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setFixtureBlockID:sbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setType:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setActualCompetitionType:cbuffer];
    
    // FM 2012 4 unknown bytes at the end
    offset += 4;
	
	*byteOffset = offset;
	
	return object;
}

@end
