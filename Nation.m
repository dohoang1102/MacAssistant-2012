//
//  Nation.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/29.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Nation.h"
#import "Team.h"
#import "Database.h"

@implementation Nation

@synthesize numberOfClubs, FIFARanking, FIFARankingPoints, currentGameIndex, updateDays, flags,
mainSquadGkShortlistMinimumReputation, mainSquadDefShortlistMinimumReputation, mainSquadMidShortlistMinimumReputation,
mainSquadFwShortlistMinimumReputation, u21GkShortlistMinimumReputation, u21DefShortlistMinimumReputation,
u21MidShortlistMinimumReputation, u21FwShortlistMinimumReputation, u19GkShortlistMinimumReputation, 
u19DefShortlistMinimumReputation, u19MidShortlistMinimumReputation, u19FwShortlistMinimumReputation,
reputation, databaseClass, wageBudget, styleOfFootball, stateOfDevelopment, gameImportance, leagueStandard,
economicFactor, yearsToGainNationality, numberOfStaff, numberOfPlayers, numberOfCities, nationalStadiumID, 
firstNameStartIndex, surnameStartIndex, commonNameStartIndex, firstNameCount, surnameCount, commonNameCount,
continentID, regionID, capitalID, leagueSelected, ruleGroupLoaded, EECNation, FIFAFullMember, wageFactor,
rankingPoints, rankingMatches, coefficients, humanPlayerPool, mainSquadGkShortlist, infos, controller,
mainSquadDefShortlist, mainSquadMidShortlist, mainSquadFwShortlist, u21GkShortlist, unknowns1,
u21DefShortlist, u21MidShortlist, u21FwShortlist, u19GkShortlist, u19DefShortlist, u19MidShortlist, 
u19FwShortlist, transferInfos, bannedPlayers, futureRegenPlayers, futureRegenStaff, famousPlayers,
spokenLanguages, transferPreferences, rowID, UID, length, width, area, population, teamContainer,
unknowns2, unknowns3, unknowns4, unknowns5, unknownChar1, unknownChar2, unknownChar3, unknownChar4, unknownChar5,
unknownData1, unknownData2, unknownData3, unknownData4, unknownFloat1, agreements, agents, EUTreatedNations, 
nonEUTreatedNations, unknownShort1, unknownShort2, gainNationalityType, unknownData5, unknownData6;

- (NSArray *)styleOfFootballStrings
{
	NSArray *strings = [NSArray arrayWithObjects:
						NSLocalizedString(@"Not Set", @"general 'not set' option"),
						NSLocalizedString(@"Africa", @"nation style of football"),
						NSLocalizedString(@"Asia", @"nation style of football"),
						NSLocalizedString(@"Balkan", @"nation style of football"),
						NSLocalizedString(@"Brasil", @"nation style of football"),
						NSLocalizedString(@"Britain", @"nation style of football"),
						NSLocalizedString(@"Caribbean", @"nation style of football"),
						NSLocalizedString(@"Central American", @"nation style of football"),
						NSLocalizedString(@"Eastern European", @"nation style of football"),
						NSLocalizedString(@"France", @"nation style of football"),
						NSLocalizedString(@"Germany", @"nation style of football"),
						NSLocalizedString(@"Holland", @"nation style of football"),
						NSLocalizedString(@"Italy", @"nation style of football"),
						NSLocalizedString(@"Japan", @"nation style of football"),
						NSLocalizedString(@"Middle-East", @"nation style of football"),
						NSLocalizedString(@"North Africa", @"nation style of football"),
						NSLocalizedString(@"North America", @"nation style of football"),
						NSLocalizedString(@"Northern Europe", @"nation style of football"),
						NSLocalizedString(@"Oceania", @"nation style of football"),
						NSLocalizedString(@"Russia", @"nation style of football"),
						NSLocalizedString(@"Scandinavia", @"nation style of football"),
						NSLocalizedString(@"South Africa", @"nation style of football"),
						NSLocalizedString(@"South America", @"nation style of football"),
						NSLocalizedString(@"Southern Europe", @"nation style of football"),
						NSLocalizedString(@"Unknown Style 1", @"nation style of football"),
						nil];
	return strings;
}

- (NSArray *)stateOfDevelopmentStrings
{
	NSArray *strings = [NSArray arrayWithObjects:
						NSLocalizedString(@"Not Set", @"general 'not set' option"),
						NSLocalizedString(@"Developed", @"nation state of development"),
						NSLocalizedString(@"Developing", @"nation state of development"),
						NSLocalizedString(@"Third World", @"nation state of development"),
						nil];
	return strings;
}

- (NSArray *)gameImportanceStrings
{
	NSArray *strings = [NSArray arrayWithObjects:
						NSLocalizedString(@"Not Set", @"general 'not set' option"),
						NSLocalizedString(@"Very Important", @"nation game importance"),
						NSLocalizedString(@"Important", @"nation game importance"),
						NSLocalizedString(@"Unimportant", @"nation game importance"),
						NSLocalizedString(@"Completely Useless", @"nation game importance"),
						nil];
	return strings;
}

- (NSArray *)groupMembershipStrings
{
	NSArray *strings = [NSArray arrayWithObjects:
						NSLocalizedString(@"Invalid", @"general 'invalid' option"),
						NSLocalizedString(@"Non-EC Country", @"nation group membership"),
						NSLocalizedString(@"EC Country", @"nation group membership"),
						nil];
	return strings;
}

- (NSString *)name
{
	return [teamContainer name];
}

- (NSString *)continentString
{
	if (continentID>-1) { return [[[[controller database] continents] objectAtIndex:continentID] name]; }
	return @"---";
}


- (NSString *)competitionString
{
	if ([[teamContainer teams] count]>0) {
		if ([[[[controller database] teams] objectAtIndex:[[[teamContainer teams] objectAtIndex:0] intValue]] continentalCupID]>-1) {
			return [[[[controller database] competitions] objectAtIndex:[[[[controller database] teams] objectAtIndex:[[[teamContainer teams] objectAtIndex:0] intValue]] continentalCupID]] name];
		}
	}
	return @"---";
}

- (short)reputation
{
	if ([[teamContainer teams] count]>0) {
		return [[[[controller database] teams] objectAtIndex:[[[teamContainer teams] objectAtIndex:0] intValue]] reputation];
	}
	return 0;
}

@end
