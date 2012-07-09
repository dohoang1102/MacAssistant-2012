//
//  NonPlayerSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 10/07/25.
//  Copyright 2010 littleblue. All rights reserved.
//

#import "NonPlayerSaver.h"
#import "StaffTendencySaver.h"
#import "ScoutingKnowledgeSaver.h"

@implementation NonPlayerSaver

+ (void)saveNonPlayer:(NonPlayer *)object toData:(NSMutableData *)data
{
	char cbuffer;
	short sbuffer;
	int ibuffer;
	BOOL bbuffer;
	
	sbuffer = [object homeReputation];
	[data appendBytes:&sbuffer length:2];
	sbuffer = [object currentReputation];
	[data appendBytes:&sbuffer length:2];
	sbuffer = [object worldReputation];
	[data appendBytes:&sbuffer length:2];
	sbuffer = [object currentAbility];
	[data appendBytes:&sbuffer length:2];
	sbuffer = [object potentialAbility];
	[data appendBytes:&sbuffer length:2];
	cbuffer = [object preferredFormation];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object preferredFormation2];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object defensiveFormation];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object attackingFormation];
	[data appendBytes:&cbuffer length:1];
	ibuffer = [object nonPlayingStatsID];
	[data appendBytes:&ibuffer length:4];
	[data appendData:[object unknownData1]];
	
	bbuffer = [object unknownBool1];
	[data appendBytes:&bbuffer length:1];
	
	if ([object unknownBool1]) {
		cbuffer = [object unknownChar1];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar2];
		[data appendBytes:&cbuffer length:1];
		
		[data appendData:[object unknownData2]];
	}
	
	bbuffer = [object hasScoutingKnowledges];
	[data appendBytes:&bbuffer length:1];
	
	if ([object hasScoutingKnowledges]) {
		cbuffer = [object unknownChar3];
		[data appendBytes:&cbuffer length:1];
		
		sbuffer = [[object scoutingKnowledges] count];
		[data appendBytes:&sbuffer length:2];
		for (int i = 0; i<[[object scoutingKnowledges] count]; i++) {
			[ScoutingKnowledgeSaver saveKnowledge:[[object scoutingKnowledges] objectAtIndex:i] toData:data];
		}
	}
	
	bbuffer = [object hasTendencies];
	[data appendBytes:&bbuffer length:1];
	
	if ([object hasTendencies]) {
		cbuffer = [[object tendencies] count];
		[data appendBytes:&cbuffer length:1];
		for (int i = 0; i<[[object tendencies] count]; i++) {
			[StaffTendencySaver saveStaffTendency:[[object tendencies] objectAtIndex:i] toData:data];
		}
	}
	
	bbuffer = [object unknownBool2];
	[data appendBytes:&bbuffer length:1];
	
	if ([object unknownBool2]) {
		[data appendData:[object unknownData3]];
	}
}

@end
