//
//  PlayerBanLoader.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/21.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PlayerBanLoader.h"
#import "ShortFixtureLoader.h"
#import "FMDateLoader.h"

@implementation PlayerBanLoader

+ (PlayerBan *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset
{
	char cbuffer;
	short sbuffer;
	
	unsigned int offset = *byteOffset;
	
	PlayerBan *object = [[PlayerBan alloc] init];
	
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setDisciplineRulesIndex:sbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setGamesBannedFor:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setGamesMissed:cbuffer];
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setDaysBanned:sbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setReason:cbuffer];
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setPointsCount:sbuffer];
	[object setStartDate:[FMDateLoader readFromData:data atOffset:&offset]];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setScope:cbuffer];
	
	// ???
	[object setUnknownData1:[data subdataWithRange:NSMakeRange(offset, 6)]]; 
	offset += 6;
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setDecision:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setHasFixture:cbuffer];
	if ([object hasFixture]) {
		[object setFixture:[ShortFixtureLoader readFromData:data atOffset:&offset]];
	}
	
	*byteOffset = offset;
	
	return object;
}

@end
