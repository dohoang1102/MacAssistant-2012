//
//  MatchFormSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 10/07/26.
//  Copyright 2010 littleblue. All rights reserved.
//

#import "MatchFormSaver.h"
#import "FMDateSaver.h"

@implementation MatchFormSaver

+ (void)saveMatchForm:(MatchForm *)object toData:(NSMutableData *)data
{
	char cbuffer;
	short sbuffer;
	int ibuffer;
	BOOL bbuffer;
	
	[FMDateSaver saveDate:[object date] toData:data];
	ibuffer = [object oppositionID];
	[data appendBytes:&ibuffer length:4];
	[data appendData:[object unknownData1]];
	bbuffer = [object hasStats];
	[data appendBytes:&bbuffer length:1];
	
	if ([object hasStats]) {
	//	sbuffer = [object positionMask];
	//	[data appendBytes:&sbuffer length:2];
		cbuffer = [object unknownChar1];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar2];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar3];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar4];
		[data appendBytes:&cbuffer length:1];
		
		cbuffer = [object goals];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object conceded];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object shots];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object shotsOnTarget];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object assists];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object runsPastOpponent];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object foulsMade];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object foulsAgainst];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object offsides];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object yellowCards];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object redCards];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object minuteOnAsASub];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object minuteSubstituted];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object minuteInjured];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object minuteSentOff];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object rating];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object passesAttempted];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object passesCompleted];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object keyPasses];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object tacklesAttempted];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object tacklesWon];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object keyTackles];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object headersAttempted];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object headersWon];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object keyHeaders];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object interceptions];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object condition];
		[data appendBytes:&cbuffer length:1];
		
	}
}

@end
