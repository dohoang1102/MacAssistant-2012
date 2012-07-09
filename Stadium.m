//
//  Stadium.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/29.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Stadium.h"


@implementation Stadium

@synthesize ownerID, capacity, seatingCapacity, expansionCapacity, usedCapacity, 
allSeaterCompetitionCapacity, rowID, UID, buildDate, databaseClass, decay, state,
pitchType, usedByU21NationalTeam, usedByNationalTeam, pitchLength, pitchWidth,
name, nearbyStadiumID, cityID, extinct, flags, nameGender, unknownData1, unknownData2,
unknownDate1, pitchLastRelaidDate, pitchRelayRequiredDate, minPitchLength, minPitchWidth, 
maxPitchLength, maxPitchWidth, pitchRecoveryRate, pitchCondition, latitude, longitude,
pitchDeteriorationRate;

- (NSArray *)stateStrings
{
	NSArray *strings = [NSArray arrayWithObjects:
						NSLocalizedString(@"Invalid", @"general 'invalid' option"),
						NSLocalizedString(@"Very Good", @"stadium state"),
						NSLocalizedString(@"Good", @"stadium state"),
						NSLocalizedString(@"Average", @"stadium state"),
						NSLocalizedString(@"Poor", @"stadium state"),
						NSLocalizedString(@"Very Poor", @"stadium state"),
						nil];
	return strings;
}

- (NSArray *)usedByNationalTeamStrings
{
	NSArray *strings = [NSArray arrayWithObjects:
						NSLocalizedString(@"No Matches", @"stadium used by national team"),
						NSLocalizedString(@"All Matches", @"stadium used by national team"),
						NSLocalizedString(@"Major Matches", @"stadium used by national team"),
						NSLocalizedString(@"Medium Matches", @"stadium used by national team"),
						NSLocalizedString(@"Minor Matches", @"stadium used by national team"),
						nil];
	return strings;
}

- (NSArray *)pitchTypeStrings
{
	NSArray *strings = [NSArray arrayWithObjects:
						NSLocalizedString(@"Invalid", @"general 'invalid' option"),
						NSLocalizedString(@"Grass", @"stadium pitch type"),
						NSLocalizedString(@"Synthetic (New Type - Soft)", @"stadium pitch type"),
						NSLocalizedString(@"Synthetic (Old Type - Hard)", @"stadium pitch type"),
						NSLocalizedString(@"Gravel / Clay / Sand", @"stadium pitch type"),
						NSLocalizedString(@"Gravel", @"stadium pitch type"),
						NSLocalizedString(@"Clay", @"stadium pitch type"),
						NSLocalizedString(@"Sand", @"stadium pitch type"),
						nil];
	return strings;
}

- (NSArray *)pitchDeteriorationRateStrings
{
	NSArray *strings = [NSArray arrayWithObjects:
						NSLocalizedString(@"Not Set", @"general 'not set' option"),
						NSLocalizedString(@"Slow", @"stadium deterioration rate"),
						NSLocalizedString(@"Medium", @"stadium deterioration rate"),
						NSLocalizedString(@"Fast", @"stadium deterioration rate"),
						nil];
	return strings;
}

@end
