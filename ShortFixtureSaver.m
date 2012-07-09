//
//  ShortFixtureSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 10/07/25.
//  Copyright 2010 littleblue. All rights reserved.
//

#import "ShortFixtureSaver.h"
#import "FMDateSaver.h"

@implementation ShortFixtureSaver

+ (void)saveFixture:(ShortFixture *)object toData:(NSMutableData *)data
{
	char cbuffer;
	int ibuffer;
	BOOL bbuffer;
	
	[FMDateSaver saveDate:[object date] toData:data];
	
	ibuffer = [object competitionID];
	[data appendBytes:&ibuffer length:4];
	bbuffer = [object hasName];
	[data appendBytes:&bbuffer length:1];
	
	if ([object hasName]) {
		ibuffer = [object competitionNameID];
		[data appendBytes:&ibuffer length:4];
		ibuffer = [object stageNameID];
		[data appendBytes:&ibuffer length:4];
		ibuffer = [object subStageNameID];
		[data appendBytes:&ibuffer length:4];
		ibuffer = [object extraStageNameID];
		[data appendBytes:&ibuffer length:4];
	}
	
	cbuffer = [object venue];
	[data appendBytes:&cbuffer length:1];
	ibuffer = [object homeTeamID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object awayTeamID];
	[data appendBytes:&ibuffer length:4];
	cbuffer = [object homeGoals];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object awayGoals];
	[data appendBytes:&cbuffer length:1];
	ibuffer = [object matchStatsIndex];
	[data appendBytes:&ibuffer length:4];
}

@end
