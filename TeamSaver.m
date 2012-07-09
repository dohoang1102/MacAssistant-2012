//
//  TeamSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 10/07/25.
//  Copyright 2010 EnjoyLocally.co.uk. All rights reserved.
//

#import "DatabaseTypes.h"
#import "GameVersions.h"
#import "TeamSaver.h"
#import "FixtureBlockSaver.h"
#import "PlayerReplacementSaver.h"
#import "Unknown8Saver.h"
#import "FMDateSaver.h"
#import "FMString.h"

@implementation TeamSaver

+ (void)saveTeam:(Team *)object toData:(NSMutableData *)data version:(short)version
{
	char cbuffer;
	unsigned char ucbuffer;
	short sbuffer;
	int ibuffer;
	BOOL bbuffer;
	
	cbuffer = [object databaseClass];
	[data appendBytes:&cbuffer length:1];
	
	if ([object databaseClass]==DBC_NATIONAL_TEAM) {
		[FMDateSaver saveDate:[object lastSelectionDate] toData:data];
		[FMDateSaver saveDate:[object unlockDate] toData:data];
		cbuffer = [object maximumSquadSize];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object minimumSquadSize];
		[data appendBytes:&cbuffer length:1];
		bbuffer = [object locked];
		[data appendBytes:&bbuffer length:1];
		bbuffer = [object clubsHaveSetFriendlyInstructions];
		[data appendBytes:&bbuffer length:1];
		cbuffer = [object availablePlayers];
		[data appendBytes:&cbuffer length:1];
		
		cbuffer = [[object playerReplacements] count];
		[data appendBytes:&cbuffer length:1];
		for (int i = 0; i<[[object playerReplacements] count]; i++) {
			[PlayerReplacementSaver savePlayer:[[object playerReplacements] objectAtIndex:i] toData:data];
		}
		
		[data appendData:[object unknownData1]];
		
		sbuffer = [object unknownShort1];
		[data appendBytes:&sbuffer length:2];
		
		[data appendData:[object unknownData4]];
		
	}
	
	ucbuffer = [object flags];
	[data appendBytes:&ucbuffer length:1];
	cbuffer = [object lastPosition];
	[data appendBytes:&cbuffer length:1];
	sbuffer = [object reputation];
	[data appendBytes:&sbuffer length:2];
	sbuffer = [object nationalReputation];
	[data appendBytes:&sbuffer length:2];
	ibuffer = [object divisionID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object lastDivisionID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object nextDivisionID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object stadiumID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object managerID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object continentalCupID];
	[data appendBytes:&ibuffer length:4];
	cbuffer = [object continentalCupSeeding];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object homeMatchday];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object unknownChar1];
	[data appendBytes:&cbuffer length:1];
	ibuffer = [object futureContinentalCupID];
	[data appendBytes:&ibuffer length:4];
	cbuffer = [object futureContinentalCupInfo];
	[data appendBytes:&cbuffer length:1];
	sbuffer = [object firstFixtureYear];
	[data appendBytes:&sbuffer length:2];
	sbuffer = [object lastFixtureYear];
	[data appendBytes:&sbuffer length:2];
	[FMDateSaver saveDate:[object lastMatchDate] toData:data];
	ibuffer = [object otherDivisionID];
	[data appendBytes:&ibuffer length:4];
	[data appendData:[object unknownData2]];
	
	sbuffer = [[object players] count];
	[data appendBytes:&sbuffer length:2];
	for (int i = 0; i<[[object players] count]; i++) {
		ibuffer = [[[object players] objectAtIndex:i] intValue];
		[data appendBytes:&ibuffer length:4];
	}
	
	sbuffer = [[object fixtureBlocks] count];
	[data appendBytes:&sbuffer length:2];
	for (int i = 0; i<[[object fixtureBlocks] count]; i++) {
		[FixtureBlockSaver saveFixtureBlock:[[object fixtureBlocks] objectAtIndex:i] toData:data];
	}
	
	sbuffer = [[object unknown8s] count];
	[data appendBytes:&sbuffer length:2];
	for (int i = 0; i<[[object unknown8s] count]; i++) {
		[Unknown8Saver saveUnknown:[[object unknown8s] objectAtIndex:i] toData:data];
	}
	
	[data appendData:[object unknownData3]];
	
	cbuffer = [[object unknowns1] count];
	[data appendBytes:&cbuffer length:1];
	for (int i = 0; i<[[object unknowns1] count]; i++) {
		ibuffer = [[[object unknowns1] objectAtIndex:i] intValue];
		[data appendBytes:&ibuffer length:4];
	}
	
	cbuffer = [object unknownChar2];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object unknownChar3];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object unknownChar4];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object teamType];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object teamContainerType];
	[data appendBytes:&cbuffer length:1];
	bbuffer = [object newTeam];
	[data appendBytes:&bbuffer length:1];
	cbuffer = [object maximumAge];
	[data appendBytes:&cbuffer length:1];
	ibuffer = [object teamContainerID];
	[data appendBytes:&ibuffer length:4];
	[FMString saveString:[object name] toData:data];
	cbuffer = [object nameGender];
	[data appendBytes:&cbuffer length:1];
	[FMString saveString:[object shortName] toData:data];
	cbuffer = [object shortNameGender];
	[data appendBytes:&cbuffer length:1];
	ibuffer = [object rowID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object UID];
	[data appendBytes:&ibuffer length:4];
}

@end
