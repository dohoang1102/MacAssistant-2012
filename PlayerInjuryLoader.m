//
//  PlayerInjuryLoader.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/21.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PlayerInjuryLoader.h"
#import "ShortFixtureLoader.h"
#import "FMDateLoader.h"

@implementation PlayerInjuryLoader

+ (PlayerInjury *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset
{
	char cbuffer;
	short sbuffer;
	int ibuffer;
	
	unsigned int offset = *byteOffset;
	
	PlayerInjury *object = [[PlayerInjury alloc] init];
	
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setInjuryID:ibuffer];
	[object setFixture:[ShortFixtureLoader readFromData:data atOffset:&offset]];
	[object setInjuredDate:[FMDateLoader readFromData:data atOffset:&offset]];
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setDaysUntilLightTraining:sbuffer];
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setDaysUntilFullTraining:sbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setReceiveType:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setBeenToPhysio:cbuffer];
	
	// 0x02, int, char
	[object setUnknownData1:[data subdataWithRange:NSMakeRange(offset, 7)]]; 
	offset += 7;
	
	*byteOffset = offset;
	
	return object;
}

@end
