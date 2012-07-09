//
//  OfficialPastGameSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 10/07/25.
//  Copyright 2010 littleblue. All rights reserved.
//

#import "OfficialPastGameSaver.h"
#import "FMDateSaver.h"

@implementation OfficialPastGameSaver

+ (void)savePastGame:(OfficialPastGame *)object toData:(NSMutableData *)data
{
	char cbuffer;
	int ibuffer;
	
	cbuffer = [object yellowCards];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object redCards];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object rating];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object unknownChar1];
	[data appendBytes:&cbuffer length:1];
	[FMDateSaver saveDate:[object date] toData:data];
	cbuffer = [object homePenalties];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object awayPenalties];
	[data appendBytes:&cbuffer length:1];
	ibuffer = [object competitionID];
	[data appendBytes:&ibuffer length:4];
	cbuffer = [object homeGoals];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object awayGoals];
	[data appendBytes:&cbuffer length:1];
	ibuffer = [object homeTeamID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object awayTeamID];
	[data appendBytes:&ibuffer length:4];
}

@end
