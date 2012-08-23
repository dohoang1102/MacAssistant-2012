//
//  MatchFormLoader.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/21.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "MatchFormLoader.h"
#import "FMDateLoader.h"

@implementation MatchFormLoader

+ (MatchForm *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset
{
	char cbuffer;
	int ibuffer;
	
	unsigned int offset = *byteOffset;
	
	MatchForm *object = [[MatchForm alloc] init];
	
	[object setDate:[FMDateLoader readFromData:data atOffset:&offset]];
	
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setOppositionID:ibuffer];
	
	// ???
	[object setUnknownData1:[data subdataWithRange:NSMakeRange(offset, 5)]]; 
	offset += 5;
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setHasStats:cbuffer];
	
	if ([object hasStats]) {
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setPositionMask:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar1:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar2:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar3:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar4:cbuffer];
		
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setGoals:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setConceded:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setShots:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setShotsOnTarget:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setAssists:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setRunsPastOpponent:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setFoulsMade:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setFoulsAgainst:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setOffsides:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setYellowCards:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setRedCards:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setMinuteOnAsASub:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setMinuteSubstituted:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setMinuteInjured:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setMinuteSentOff:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setRating:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setPassesAttempted:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setPassesCompleted:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setKeyPasses:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setTacklesAttempted:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setTacklesWon:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setKeyTackles:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setHeadersAttempted:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setHeadersWon:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setKeyHeaders:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setInterceptions:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setCondition:cbuffer];
	}
	
	*byteOffset = offset;
	
	return object;
}

@end
