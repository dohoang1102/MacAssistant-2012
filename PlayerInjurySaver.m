//
//  PlayerInjurySaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 10/07/25.
//  Copyright 2010 littleblue. All rights reserved.
//

#import "PlayerInjurySaver.h"
#import "FMDateSaver.h"
#import "ShortFixtureSaver.h"

@implementation PlayerInjurySaver

+ (void)saveInjury:(PlayerInjury *)object toData:(NSMutableData *)data
{
	char cbuffer;
	short sbuffer;
	int ibuffer;
	BOOL bbuffer;
	
	ibuffer = [object injuryID];
	[data appendBytes:&ibuffer length:4];
	[ShortFixtureSaver saveFixture:[object fixture] toData:data];
	[FMDateSaver saveDate:[object injuredDate] toData:data];
	sbuffer = [object daysUntilLightTraining];
	[data appendBytes:&sbuffer length:2];
	sbuffer = [object daysUntilFullTraining];
	[data appendBytes:&sbuffer length:2];
	cbuffer = [object receiveType];
	[data appendBytes:&cbuffer length:1];
	bbuffer = [object beenToPhysio];
	[data appendBytes:&bbuffer length:1];
	[data appendData:[object unknownData1]];
}

@end
