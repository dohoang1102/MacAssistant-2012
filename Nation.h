//
//  Nation.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/29.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "TeamContainer.h"
#import "Controller.h"

// style of football
#define SOF_UNSET				0
#define SOF_AFRICA				1
#define SOF_ASIA				2
#define SOF_BALKAN				3
#define SOF_BRASIL				4
#define SOF_BRITAIN				5
#define SOF_CARIBBEAN			6
#define SOF_CENTRAL_AMERICA		7
#define SOF_EASTERN_EUROPE		8
#define SOF_FRANCE				9
#define SOF_GERMANY				10
#define SOF_HOLLAND				11
#define SOF_ITALY				12
#define SOF_JAPAN				13
#define SOF_MIDDLE_EAST			14
#define SOF_NORTH_AFRICA		15
#define SOF_NORTH_AMERICA		16
#define SOF_NORTHERN_EUROPE		17
#define SOF_OCEANIA				18
#define SOF_RUSSIA				19
#define SOF_SCANDINAVIA			20
#define SOF_SOUTH_AFRICA		21
#define SOF_SOUTH_AMERICA		22
#define SOF_SOUTHERN_EUROPE		23
#define SOF_UNKNOWN_1			24 // spanish?

// state of development
#define SOD_NOT_SET				0
#define SOD_DEVELOPED_STATE		1
#define SOD_DEVELOPING_STATE	2
#define SOD_THIRD_WORLD_STATE	3

// game importance
#define NGI_NOT_SET				0
#define NGI_VERY_IMPORTANT		1
#define NGI_IMPORTANT			2
#define NGI_UNIMPORTANT			3
#define NGI_COMPLETELY_USELESS	4

// nation wage budgets
#define NWB_INVALID				-1
#define NWB_RICH				0
#define NWB_NORMAL				1
#define NWB_POOR				2
#define NWB_VERY_POOR			3

// nation group membership
#define NGM_INVALID			0
#define NGM_NON_EEC_COUNTRY	1
#define NGM_EEC_COUNTRY		2

// nation gain nationality type
// do they have to live in the nation Continuously or is the time Accumulative
#define NGT_CONTINUOUS		1
#define NGT_ACCUMULATIVE	2

@interface Nation : NSObject {
	char databaseClass, wageBudget, styleOfFootball, stateOfDevelopment, gameImportance, leagueStandard,
		economicFactor, yearsToGainNationality, EECNation, unknownChar1, unknownChar2, unknownChar3, unknownChar4, 
		unknownChar5, gainNationalityType;
	short numberOfClubs, FIFARanking, FIFARankingPoints, currentGameIndex, updateDays, flags,
		mainSquadGkShortlistMinimumReputation, mainSquadDefShortlistMinimumReputation, mainSquadMidShortlistMinimumReputation,
		mainSquadFwShortlistMinimumReputation, u21GkShortlistMinimumReputation, u21DefShortlistMinimumReputation,
		u21MidShortlistMinimumReputation, u21FwShortlistMinimumReputation, u19GkShortlistMinimumReputation, 
		u19DefShortlistMinimumReputation, u19MidShortlistMinimumReputation, u19FwShortlistMinimumReputation,
		reputation, unknownShort1, unknownShort2;
	int numberOfStaff, numberOfPlayers, numberOfCities, nationalStadiumID, firstNameStartIndex,
		surnameStartIndex, commonNameStartIndex, firstNameCount, surnameCount, commonNameCount,
		continentID, regionID, capitalID, rowID, UID, length, width, area, population;
	float wageFactor, unknownFloat1;
	BOOL leagueSelected, ruleGroupLoaded, FIFAFullMember;
	TeamContainer *teamContainer;
	Controller *controller;
	NSData *unknownData1, *unknownData2, *unknownData3, *unknownData4, *unknownData5, *unknownData6;
	NSMutableArray *rankingPoints, *rankingMatches, *coefficients, *humanPlayerPool, *mainSquadGkShortlist,
		*mainSquadDefShortlist, *mainSquadMidShortlist, *mainSquadFwShortlist, *u21GkShortlist,
		*u21DefShortlist, *u21MidShortlist, *u21FwShortlist, *u19GkShortlist, *u19DefShortlist, *u19MidShortlist, 
		*u19FwShortlist, *transferInfos, *bannedPlayers, *futureRegenPlayers, *futureRegenStaff, *famousPlayers,
		*spokenLanguages, *transferPreferences, *infos, *unknowns1, *unknowns2, *unknowns3, *unknowns4, *unknowns5,
		*agreements, *agents, *EUTreatedNations, *nonEUTreatedNations;
}

@property(readwrite,assign) char databaseClass, wageBudget, styleOfFootball, stateOfDevelopment, gameImportance, leagueStandard,
economicFactor, yearsToGainNationality, EECNation, unknownChar1, unknownChar2, unknownChar3, unknownChar4, unknownChar5, 
gainNationalityType;
@property(readwrite,assign) short numberOfClubs, FIFARanking, FIFARankingPoints, currentGameIndex, updateDays, flags,
mainSquadGkShortlistMinimumReputation, mainSquadDefShortlistMinimumReputation, mainSquadMidShortlistMinimumReputation,
mainSquadFwShortlistMinimumReputation, u21GkShortlistMinimumReputation, u21DefShortlistMinimumReputation,
u21MidShortlistMinimumReputation, u21FwShortlistMinimumReputation, u19GkShortlistMinimumReputation, 
u19DefShortlistMinimumReputation, u19MidShortlistMinimumReputation, u19FwShortlistMinimumReputation, unknownShort1, unknownShort2;
@property(nonatomic,readwrite,assign) short reputation;
@property(readwrite,assign) int numberOfStaff, numberOfPlayers, numberOfCities, nationalStadiumID, firstNameStartIndex,
surnameStartIndex, commonNameStartIndex, firstNameCount, surnameCount, commonNameCount,
continentID, regionID, capitalID, rowID, UID, length, width, area, population;
@property(readwrite,assign) float wageFactor, unknownFloat1;
@property(readwrite,assign) BOOL leagueSelected, ruleGroupLoaded, FIFAFullMember;
@property(readwrite,assign) TeamContainer *teamContainer;
@property(assign,readwrite) Controller *controller;
@property(readwrite,copy) NSData *unknownData1, *unknownData2, *unknownData3, *unknownData4, *unknownData5, *unknownData6;
@property(readwrite,copy) NSMutableArray *rankingPoints, *rankingMatches, *coefficients, *humanPlayerPool, *mainSquadGkShortlist,
*mainSquadDefShortlist, *mainSquadMidShortlist, *mainSquadFwShortlist, *u21GkShortlist, *agreements, *agents, *EUTreatedNations,
*u21DefShortlist, *u21MidShortlist, *u21FwShortlist, *u19GkShortlist, *u19DefShortlist, *u19MidShortlist, *nonEUTreatedNations,
*u19FwShortlist, *transferInfos, *bannedPlayers, *futureRegenPlayers, *futureRegenStaff, *famousPlayers,
*spokenLanguages, *transferPreferences, *infos, *unknowns1, *unknowns2, *unknowns3, *unknowns4, *unknowns5;

- (NSArray *)groupMembershipStrings;
- (NSArray *)styleOfFootballStrings;
- (NSArray *)gameImportanceStrings;
- (NSArray *)stateOfDevelopmentStrings;
- (NSString *)name;
- (NSString *)continentString;
- (NSString *)competitionString;
- (short)reputation;

@end
