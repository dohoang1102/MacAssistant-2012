//
//  Team.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/17.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Team.h"
#import "TeamContainer.h"
#import "Club.h"
#import "Database.h"
#import "DatabaseTypes.h"

@implementation Team

@synthesize maximumSquadSize, minimumSquadSize, availablePlayers, lastPosition, continentalCupSeeding,
homeMatchday, futureContinentalCupInfo, teamType, teamContainerType, nameGender, shortNameGender,
reputation, nationalReputation, firstFixtureYear, lastFixtureYear, flags, locked, clubsHaveSetFriendlyInstructions, 
newTeam, divisionID, lastDivisionID, nextDivisionID, otherDivisionID, stadiumID, managerID, continentalCupID, 
futureContinentalCupID, teamContainerID, rowID, UID, lastSelectionDate, unlockDate, lastMatchDate, name,
playerReplacements, physios, players, coaches, selectedTeam, fixtureBlocks, shortName, databaseClass,
maximumAge, controller, unknownData1, unknownData2, unknownData3, unknownChar1, unknownChar2, unknownChar3, 
unknown8s, unknowns1, unknownShort1, unknownData4, unknownChar4;

- (id)init
{
	[super init];
	
	name = @"---";
	shortName = @"---";
	
	return self;
}

- (NSString *)teamString
{
	NSString *str;
	if (databaseClass==DBC_NATIONAL_TEAM) {
		str = [[[[[controller database] nations] objectAtIndex:teamContainerID] teamContainer] name];
	}
	else {
		str = [[[[[controller database] clubs] objectAtIndex:teamContainerID] teamContainer] name];
	}
	return str;
}

- (NSString *)fullTeamString
{
	if (![name isEqualToString:@"---"]) { return name; }
	
	return [NSString stringWithFormat:@"%@ %@",[[[self club] teamContainer] name],[[self teamTypeString] retain]];
}

- (NSString *)teamTypeString
{
	if (teamType==TT_FIRST_TEAM) { return NSLocalizedString(@"", @"team type"); } // returning blank for nicer UI
	if (teamType==TT_RESERVE_TEAM) { return NSLocalizedString(@"Reserves", @"team type"); }
	if (teamType==TT_A_TEAM) { return NSLocalizedString(@"A", @"team type"); }
	if (teamType==TT_B_TEAM) { return NSLocalizedString(@"B", @"team type"); }
	if (teamType==TT_C_TEAM) { return NSLocalizedString(@"C", @"team type"); }
	if (teamType==TT_SUPERDRAFT_A_TEAM) { return NSLocalizedString(@"Superdraft A Team", @"team type"); }
	if (teamType==TT_SUPERDRAFT_B_TEAM) { return NSLocalizedString(@"Superdraft B Team", @"team type"); }
	if (teamType==TT_SUPERDRAFT_C_TEAM) { return NSLocalizedString(@"Superdraft C Team", @"team type"); }
	if (teamType==TT_SUPERDRAFT_D_TEAM) { return NSLocalizedString(@"Superdraft D Team", @"team type"); }
	if (teamType==TT_WAIVER_TEAM) { return NSLocalizedString(@"Waiver Team", @"team type"); }
	if (teamType==TT_UNDER_23_TEAM) { return NSLocalizedString(@"Under-23", @"team type"); }
	if (teamType==TT_UNDER_21_TEAM) { return NSLocalizedString(@"Under-21", @"team type"); }
	if (teamType==TT_UNDER_20_TEAM) { return NSLocalizedString(@"Under-20", @"team type"); }
	if (teamType==TT_UNDER_19_TEAM) { return NSLocalizedString(@"Under-19", @"team type"); }
	if (teamType==TT_UNDER_18_TEAM) { return NSLocalizedString(@"Under-18", @"team type"); }
	if (teamType==TT_AMATEUR_TEAM) { return NSLocalizedString(@"Amateurs", @"team type"); }
	if (teamType==TT_II_TEAM) { return NSLocalizedString(@"II", @"team type"); }
	if (teamType==TT_2_TEAM) { return NSLocalizedString(@"2", @"team type"); }
	if (teamType==TT_3_TEAM) { return NSLocalizedString(@"3", @"team type"); }
	return [NSString stringWithFormat:@"Unknown Team Type:%d",teamType];
}

- (NSArray *)playerObjects
{
	NSMutableArray *array = [[NSMutableArray alloc] init];
	
	for (id item in players) {
		if ([item intValue] < [[[controller database] people] count]) {
			[array addObject:[[[controller database] people] objectAtIndex:[item intValue]]];
		}
	}
	
	return array;
}

- (NSArray *)coachObjects
{
	NSMutableArray *array = [[NSMutableArray alloc] init];
	
	for (id item in coaches) {
		if ([item intValue] < [[[controller database] people] count]) {
			[array addObject:[[[controller database] people] objectAtIndex:[item intValue]]];
		}
	}
	
	return array;
}

- (NSArray *)physioObjects
{
	NSMutableArray *array = [[NSMutableArray alloc] init];
	
	for (id item in physios) {
		if ([item intValue] < [[[controller database] people] count]) {
			[array addObject:[[[controller database] people] objectAtIndex:[item intValue]]];
		}
	}
	
	return array;
}

- (NSArray *)matchdayStrings
{
	NSArray *strings = [NSArray arrayWithObjects:
						NSLocalizedString(@"Saturday",nil),
						NSLocalizedString(@"Sunday",nil),
						NSLocalizedString(@"Monday",nil),
						NSLocalizedString(@"Tuesday",nil),
						NSLocalizedString(@"Wednesday",nil),
						NSLocalizedString(@"Thursday",nil),
						NSLocalizedString(@"Friday",nil),
						nil];
	return strings;
}

- (Club *)club
{
	if (databaseClass==DBC_NATIONAL_TEAM) {
		return [[[controller database] nations] objectAtIndex:teamContainerID];
	}
	else { return [[[controller database] clubs] objectAtIndex:teamContainerID]; }
}

- (int)averageCA
{
	int total = 0;
	
	if ([players count]>0) {
		for (id item in players) {
			if ([item intValue] < [[[controller database] people] count]) {
				total += [[[[[controller database] people] objectAtIndex:[item intValue]] playerData] currentAbility];
			}	
		}
		total = total / [players count];
	}
	
	return total;
}

- (int)averagePA
{
	int total = 0;
	
	if ([players count]>0) {
		for (id item in players) {
			if ([item intValue] < [[[controller database] people] count]) {
				total += [[[[[controller database] people] objectAtIndex:[item intValue]] playerData] potentialAbility];
			}	
		}
		total = total / [players count];
	}
	
	return total;
}

- (int)averageAge
{
	int total = 0;
	
	if ([players count]>0) {
		for (id item in players) {
			if ([item intValue] < [[[controller database] people] count]) {
				total += [[[[controller database] people] objectAtIndex:[item intValue]] age];
			}
		}
		total = total / [players count];
	}
	
	return total;
}

- (void)healTeam
{
	if ([players count]>0) {
		for (id item in players) {
			NSLog(@"removing injuries for %@",[[[[controller database] people] objectAtIndex:[item intValue]] name]);
			
			// remove injuries
			[[[[[[controller database] people] objectAtIndex:[item intValue]] playerData] injuries] removeAllObjects];
			
			NSLog(@"fixing stats for %@",[[[[controller database] people] objectAtIndex:[item intValue]] name]);
			
			// fix condition,jadedness,fitness, morale
			[[[[[controller database] people] objectAtIndex:[item intValue]] playerData] setCondition:10000];
			[[[[[controller database] people] objectAtIndex:[item intValue]] playerData] setFitness:10000];
			[[[[[controller database] people] objectAtIndex:[item intValue]] playerData] setJadedness:0];
			[[[[[controller database] people] objectAtIndex:[item intValue]] playerData] setMorale:10];
		}
	}
}

@end
