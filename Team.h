//
//  Team.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/17.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Controller.h"
#import "FMDate.h"
#import "Club.h"
#import "Person.h"
#import "Player.h"

// team types
#define TT_FIRST_TEAM			0
#define TT_RESERVE_TEAM			1
#define TT_A_TEAM				2
#define TT_B_TEAM				3
#define TT_SUPERDRAFT_A_TEAM	4
#define TT_SUPERDRAFT_B_TEAM	5
#define TT_SUPERDRAFT_C_TEAM	6
#define TT_SUPERDRAFT_D_TEAM	7
#define TT_WAIVER_TEAM			8
#define TT_UNDER_23_TEAM		9
#define TT_UNDER_21_TEAM		10
#define TT_UNDER_19_TEAM		11
#define TT_UNDER_18_TEAM		12
#define TT_C_TEAM				13
#define TT_AMATEUR_TEAM			14
#define TT_II_TEAM				15
#define TT_2_TEAM				16
#define TT_3_TEAM				17
#define TT_UNDER_20_TEAM		18

@interface Team : NSObject {
	char maximumSquadSize, minimumSquadSize, availablePlayers, lastPosition, continentalCupSeeding, databaseClass,
	homeMatchday, futureContinentalCupInfo, teamType, teamContainerType, nameGender, shortNameGender, maximumAge,
	unknownChar1, unknownChar2, unknownChar3, unknownChar4;
	unsigned char flags;
	short reputation, nationalReputation, firstFixtureYear, lastFixtureYear, unknownShort1;
	BOOL locked, clubsHaveSetFriendlyInstructions, newTeam;
	int divisionID, lastDivisionID, nextDivisionID, otherDivisionID, stadiumID, managerID,
	continentalCupID, futureContinentalCupID, teamContainerID, rowID, UID;
	
	Controller *controller;
	FMDate *lastSelectionDate, *unlockDate, *lastMatchDate;
	NSData *unknownData1, *unknownData2, *unknownData3, *unknownData4;
	NSString *name, *shortName;
	NSMutableArray *playerReplacements, *physios, *players, *coaches, *selectedTeam, *fixtureBlocks, *unknown8s,
	*unknowns1;
	
}

@property(assign,readwrite) char maximumSquadSize, minimumSquadSize, availablePlayers, lastPosition, continentalCupSeeding,
homeMatchday, futureContinentalCupInfo, teamType, teamContainerType, nameGender, shortNameGender, databaseClass,
maximumAge, unknownChar1, unknownChar2, unknownChar3, unknownChar4;
@property(assign,readwrite) unsigned char flags;
@property(assign,readwrite) short reputation, nationalReputation, firstFixtureYear, lastFixtureYear, unknownShort1;
@property(assign,readwrite) BOOL locked, clubsHaveSetFriendlyInstructions, newTeam;
@property(assign,readwrite) int divisionID, lastDivisionID, nextDivisionID, otherDivisionID, stadiumID, managerID,
continentalCupID, futureContinentalCupID, teamContainerID, rowID, UID;
@property(assign,readwrite) Controller *controller;
@property(assign,readwrite) FMDate *lastSelectionDate, *unlockDate, *lastMatchDate;
@property(copy,readwrite) NSString *name, *shortName;
@property(readwrite,copy) NSData *unknownData1, *unknownData2, *unknownData3, *unknownData4;
@property(retain,readwrite) NSMutableArray *playerReplacements, *physios, *players, *coaches, *selectedTeam, *fixtureBlocks,
*unknown8s, *unknowns1;

- (NSString *)teamString;
- (NSString *)teamTypeString;
- (NSString *)fullTeamString;
- (NSArray *)coachObjects;
- (NSArray *)playerObjects;
- (NSArray *)physioObjects;
- (NSArray *)matchdayStrings;
- (Club *)club;
- (int)averageCA;
- (int)averagePA;
- (int)averageAge;

- (void)healTeam;
@end
