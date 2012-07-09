//
//  FifaRankingMatchLoader.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/16.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "FifaRankingMatchLoader.h"

@implementation FifaRankingMatchLoader

+ (FifaRankingMatch *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset
{
	char cbuffer;
	short sbuffer;
	
	unsigned int offset = *byteOffset;
	
	FifaRankingMatch *object = [[FifaRankingMatch alloc] init];
	
	// ???
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar:cbuffer];
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setPoints:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setMonth:cbuffer];
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setYear:sbuffer];
	
	*byteOffset = offset;
	
	return object;
}

@end
