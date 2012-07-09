//
//  Award.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/24.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

// period
#define AP_INVALID							0
#define AP_OF_THE_WEEK						1
#define	AP_OF_THE_MONTH						2
#define	AP_OF_THE_SEASON					3
#define	AP_OF_THE_COMPETITION				4
#define	AP_OF_THE_YEAR						5
#define	AP_ON_SPECIFIED_DATE				6
#define	AP_OF_THE_ROUND						7
#define	AP_OF_THE_OPENING_OR_CLOSING_SEASON	8
#define	AP_UNKNOWN_2012                     9

#define AP_MAX								9

// recipient type
#define	ART_NOT_SET					0
#define	ART_PLAYER					1
#define	ART_NON_PLAYER				2
#define	ART_PLAYER_OR_NON_PLAYER	3
#define	ART_REFEREE					4
#define	ART_ROOKIE					5
#define	ART_SQUAD_OF_PLAYERS		7
#define	ART_CLUB_OR_NATION			8

#define ART_MAX						8

// type
#define	AT_IGNORE					-1
#define	AT_NOT_SET					0
#define	AT_CLUB						1
#define	AT_MANAGER					3
#define	AT_TOP_GOALSCORER			4
#define	AT_MOST_MAN_OF_THE_MATCH	5
#define	AT_PERSONALITY				14
#define	AT_GOAL						15
#define	AT_REFEREE					16
#define	AT_YOUTH_POLICY				17
#define	AT_RECRUITMENT_POLICY		19
#define	AT_ASSISTANT_REFEREE		20
#define	AT_CHAIRMAN					21
#define	AT_PHYSIO					22
#define	AT_COACH					24
#define	AT_MOST_ASSISTS				30
#define	AT_QUICKEST_GOAL			31
#define	AT_100TH_LEAGUE_GOAL		32
#define	AT_FLAIR_PLAYER				33
#define	AT_HIGHEST_AVERAGE_RATING	37
#define	AT_HIGHEST_REPUTATION		38
#define	AT_LEAST_GOALS_CONCEDED		39
#define	AT_MOST_IMPROVED			41
#define	AT_FAIR_PLAY_TEAM			42
#define	AT_COMEBACK					43

#define AT_MAX						43

// number of placings
#define ANP_NOT_SET				0
#define ANP_1ST_TO_3RD_PLACE	1
#define ANP_1ST_PLACE_ONLY		2
#define ANP_1ST_AND_2ND_PLACE	3

#define ANP_MAX					3

// position
#define APT_NOT_SET					0
#define APT_GOALKEEPER				1
#define APT_SWEEPER					2
#define APT_FULL_BACK				12
#define APT_DEFENDER				30
#define APT_WING_BACK				96
#define APT_DEFENSIVE_MIDFIELDER	128
#define APT_MIDFIELDER				16256
#define APT_ATTACKING_MIDFIELDER	14336
#define APT_WINGER					6144
#define APT_STRIKER					16384

// side
#define	AS_ANY				0
#define	AS_LEFT				1
#define	AS_RIGHT			2
#define	AS_CENTRE			3
#define	AS_LEFT_OR_RIGHT	4

#define AS_MAX				4

// voting
#define	AV_NO_VOTING				1
#define	AV_COMPETITION_CLUB_MANAGER	2
#define	AV_NATION_CLUB_MANAGER		3
#define	AV_CONTINENT_CLUB_MANAGER	4
#define	AV_CONTINENT_NATION_MANAGER	5
#define	AV_WORLD_CLUB_MANAGER		6
#define	AV_WORLD_NATION_MANAGER		7
#define	AV_ANY_MANAGER				8

#define AV_MAX						8

// voting format
#define AVF_NOT_SET				0
#define AVF_ONE_VOTE_EACH		1
#define AVF_3_VOTES_WEIGHTED	2
#define AVF_5_VOTES_WEIGHTED	3

#define AVF_MAX					3

// run by
#define ARB_NOT_SET		0
#define ARB_FA			1
#define ARB_MEDIA		2
#define ARB_PLAYERS		3

#define ARB_MAX			3

// based
#define AB_NOT_SET						0
#define AB_FOREIGN_BASED_NATIONALS		1
#define AB_DOMESTIC_BASED				2
#define AB_DOMESTIC_BASED_FOREIGNERS	3
#define AB_DOMESTIC_BASED_NATIONALS		4
#define AB_BASED_ANYWHERE_NATIONALS		5
#define AB_BASED_ANYWHERE_ANYONE		6
#define AB_DOMESTIC_BASED_AFRICAN		7
#define AB_BASED_CONTINENT_ANYONE		8

#define AB_MAX							8

// use stats from
#define AUS_NOT_SET				0
#define AUS_DOMESTIC_LEAGUE		1
#define AUS_DOMESTIC_CUP		2
#define AUS_DOMESTIC_OVERALL	3
#define AUS_CONTINENTAL			4
#define AUS_OVERALL_CLUB		5
#define AUS_INTERNATIONAL		6
#define AUS_OVERALL				7

#define AUS_MAX					7

// allow previous winner
#define APW_NOT_SET	0
#define APW_NEVER	1
#define APW_RARELY	2
#define APW_YES		3

#define APW_MAX		3


#import <Cocoa/Cocoa.h>
#import "Colour.h"
#import "Controller.h"
#import "FMDate.h"

@interface Award : NSObject {
	char databaseClass, nameGender, shortNameGender, type, period;
	char runBy, formation, maximumAge, voting;
	char based, side, useStatsFrom, recipientType, votingFormat, minPercentGamesPlayed;
	char minimumAge, allowPreviousWinner, placings;
	char unknownChar1, unknownChar2, unknownChar3, unknownChar4, unknownChar5, unknownChar6, unknownChar7;
	BOOL useSubsForTeamAward;
	unsigned char unknown1, unknown2, unknown3, unknown4;
	unsigned char winnerHomeReputation, winnerWorldReputation;
	short awardReputation, nationalReputation;
	unsigned short position;
	int continentID, nationID, competitionID;
	unsigned int rowID, UID;
	
	Colour *colour;
	Controller *controller;
	
	FMDate *awardDate, *announcementDate;
	NSString *name, *shortName;
}

@property(assign,readwrite) BOOL useSubsForTeamAward;
@property(assign,readwrite) char databaseClass, nameGender, shortNameGender, type, period,
runBy, formation, maximumAge, based, voting, side, useStatsFrom, recipientType, votingFormat, 
minPercentGamesPlayed, minimumAge, allowPreviousWinner, placings, unknownChar1, unknownChar2,
unknownChar3, unknownChar4, unknownChar5, unknownChar6, unknownChar7;
@property(assign,readwrite) unsigned char unknown1, unknown2, unknown3, unknown4,
winnerHomeReputation, winnerWorldReputation;
@property(assign,readwrite) short awardReputation, nationalReputation;
@property(assign,readwrite) unsigned short position; 
@property(assign,readwrite) int continentID, nationID, competitionID;
@property(assign,readwrite) unsigned int rowID, UID;
@property(assign,readwrite) Controller *controller;
@property(assign,readwrite) Colour *colour;
@property(assign,readwrite) FMDate *awardDate, *announcementDate;;
@property(copy,readwrite) NSString *name, *shortName;

- (NSArray *)periodStrings;
- (NSArray *)runByStrings;
- (NSArray *)basedStrings;
- (NSArray *)sideStrings;
- (NSArray *)useStatsFromStrings;
- (NSArray *)allowPreviousWinnerStrings;
- (NSArray *)numPlacingsStrings;
- (NSArray *)votingFormatStrings;
- (NSArray *)recipientTypeStrings;
- (NSArray *)votingStrings;

- (NSString *)nationString;
- (NSString *)continentString;
- (NSString *)competitionString;

@end
