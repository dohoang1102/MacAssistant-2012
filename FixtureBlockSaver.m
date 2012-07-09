//
//  FixtureBlockSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 10/07/25.
//  Copyright 2010 EnjoyLocally.co.uk. All rights reserved.
//

#import "FixtureBlockSaver.h"
#import "FMDateSaver.h"

@implementation FixtureBlockSaver

+ (void)saveFixtureBlock:(FixtureBlock *)object toData:(NSMutableData *)data
{
	char cbuffer;
	short sbuffer;
	
	[FMDateSaver saveDate:[object startDate] toData:data];
	[FMDateSaver saveDate:[object endDate] toData:data];
	
	sbuffer = [object fixtureBlockID];
	[data appendBytes:&sbuffer length:2];
	cbuffer = [object type];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object actualCompetitionType];
	[data appendBytes:&cbuffer length:1];
	
}

@end
