//
//  Award.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/24.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Award.h"
#import "Nation.h"
#import "Competition.h"
#import "Continent.h"
#import "Database.h"

@implementation Award

@synthesize databaseClass, nameGender, shortNameGender, type, period,awardDate,
runBy, formation, maximumAge, winnerHomeReputation, winnerWorldReputation, based,
side, useStatsFrom, recipientType, votingFormat, minPercentGamesPlayed, minimumAge,
unknown1, unknown2, unknown3, unknown4, continentID, nationID, competitionID, rowID, 
UID, announcementDate, allowPreviousWinner, awardReputation, nationalReputation, 
colour, name, shortName, position, placings, useSubsForTeamAward, voting,
unknownChar1, unknownChar2, unknownChar3, unknownChar4, unknownChar5, unknownChar6, 
unknownChar7, controller;

- (NSArray *)periodStrings
{
	NSArray *strings = [NSArray arrayWithObjects:
						NSLocalizedString(@"Invalid",@"general 'invalid' option"),
						NSLocalizedString(@"Of The Week", @"award period"),
						NSLocalizedString(@"Of The Month", @"award period"),
						NSLocalizedString(@"Of The Season", @"award period"),
						NSLocalizedString(@"Of The Competition", @"award period"),
						NSLocalizedString(@"Of The Year", @"award period"),
						NSLocalizedString(@"On A Specified Date", @"award period"),
						NSLocalizedString(@"Of The Round", @"award period"),
						NSLocalizedString(@"Of The Opening Or Closing Season", @"award period"),
						nil];
	return strings;
}

- (NSArray *)basedStrings
{
	NSArray *strings = [NSArray arrayWithObjects:
						NSLocalizedString(@"Not Set", @"general 'not set' option"),
						NSLocalizedString(@"Foreign Based Nationals", @"award based"),
						NSLocalizedString(@"Domestic Based", @"award based"),
						NSLocalizedString(@"Domestic Based Foreigners", @"award based"),
						NSLocalizedString(@"Domestic Based Nationals", @"award based"),
						NSLocalizedString(@"Based Anywhere Nationals", @"award based"),
						NSLocalizedString(@"Based Anywhere Anyone", @"award based"),
						NSLocalizedString(@"Domestic Based African", @"award based"),
						NSLocalizedString(@"Based Continent Anyone", @"award based"),
						nil];
	return strings;
}

- (NSArray *)runByStrings
{
	NSArray *strings = [NSArray arrayWithObjects:
						NSLocalizedString(@"Not Set", @"general 'not set' option"),
						NSLocalizedString(@"Football Association", @"award run by"),
						NSLocalizedString(@"Media", @"award run by"),
						NSLocalizedString(@"Players", @"award run by"),
						nil];
	return strings;
}

- (NSArray *)sideStrings
{
	NSArray *strings = [NSArray arrayWithObjects:
						NSLocalizedString(@"Any", @"award side"),
						NSLocalizedString(@"Left", @"award side"),
						NSLocalizedString(@"Right", @"award side"),
						NSLocalizedString(@"Centre", @"award side"),
						NSLocalizedString(@"Left Or Right", @"award side"),
						nil];
	return strings;
}

- (NSArray *)useStatsFromStrings
{
	NSArray *strings = [NSArray arrayWithObjects:
						NSLocalizedString(@"Not Set", @"general 'not set' option"),
						NSLocalizedString(@"Domestic League", @"award use stats from"),
						NSLocalizedString(@"Domestic Cup", @"award use stats from"),
						NSLocalizedString(@"Domestic Overall", @"award use stats from"),
						NSLocalizedString(@"Continental", @"award use stats from"),
						NSLocalizedString(@"Overall Club", @"award use stats from"),
						NSLocalizedString(@"International", @"award use stats from"),
						NSLocalizedString(@"Overall", @"award use stats from"),
						nil];
	return strings;
}

- (NSArray *)numPlacingsStrings
{
	NSArray *strings = [NSArray arrayWithObjects:
						NSLocalizedString(@"Not Set", @"general 'not set' option"),
						NSLocalizedString(@"1st - 3rd Place", @"award no. placings"),
						NSLocalizedString(@"1st Place Only", @"award no. placings"),
						NSLocalizedString(@"1st and 2nd Place", @"award no. placings"),
						nil];
	return strings;
}

- (NSArray *)votingFormatStrings
{
	NSArray *strings = [NSArray arrayWithObjects:
						NSLocalizedString(@"Not Set", @"general 'not set' option"),
						NSLocalizedString(@"One Vote Each", @"award voting format"),
						NSLocalizedString(@"Three Votes Weighted", @"award voting format"),
						NSLocalizedString(@"Five Weighted", @"award voting format"),
						nil];
	return strings;
}

- (NSArray *)allowPreviousWinnerStrings
{
	NSArray *strings = [NSArray arrayWithObjects:
						NSLocalizedString(@"Not Set", @"general 'not set' option"),
						NSLocalizedString(@"Never", @"award allow previous winner"),
						NSLocalizedString(@"Rarely", @"award allow previous winner"),
						NSLocalizedString(@"Yes",nil),
						nil];
	return strings;
}

- (NSArray *)recipientTypeStrings
{
	NSArray *strings = [NSArray arrayWithObjects:
						NSLocalizedString(@"Not Set", @"general 'not set' option"),
						NSLocalizedString(@"Player", @"award recipient type"),
						NSLocalizedString(@"Non-Player", @"award recipient type"),
						NSLocalizedString(@"Player Or Non-Player", @"award recipient type"),
						NSLocalizedString(@"Referee", @"award recipient type"),
						NSLocalizedString(@"Rookie", @"award recipient type"),
						NSLocalizedString(@"Squad Of Players", @"award recipient type"),
						NSLocalizedString(@"Club Or Nation", @"award recipient type"),
						nil];
	return strings;
}

- (NSArray *)votingStrings
{
	NSArray *strings = [NSArray arrayWithObjects:
						NSLocalizedString(@"Invalid", @"general 'invalid' option"),
						NSLocalizedString(@"No Voting", @"award voting"),
						NSLocalizedString(@"Competition Club Manager", @"award voting"),
						NSLocalizedString(@"Nation Club Manager", @"award voting"),
						NSLocalizedString(@"Continent Club Manager", @"award voting"),
						NSLocalizedString(@"Continent Nation Manager", @"award voting"),
						NSLocalizedString(@"World Club Manager", @"award voting"),
						NSLocalizedString(@"World Nation Manager", @"award voting"),
						NSLocalizedString(@"Any Manager", @"award voting"),
						nil];
	return strings;
}

- (NSString *)nationString
{
	if (nationID>-1) { return [[[[[controller database] nations] objectAtIndex:nationID] teamContainer] name]; }
	return @"---";
}
- (NSString *)continentString;
{
	if (continentID>-1) { return [[[[controller database] continents] objectAtIndex:continentID] name]; }
	else if (continentID==-1 && nationID==-1 && competitionID==-1) { return @"World"; }
	return @"---";
}
- (NSString *)competitionString;
{
	if (competitionID>-1) { return [[[[controller database] competitions] objectAtIndex:competitionID] name]; }
	return @"---";
}


@end
