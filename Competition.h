//
//  Competition.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/30.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Colour.h"
#import "Controller.h"

// comp name types
#define CT_DOMESTIC_TOP_DIVISION						0
#define CT_DOMESTIC_DIVISION							1
#define CT_MAIN_CUP										2
#define CT_LEAGUE_CUP									3
#define CT_DOMESTIC_CUP									4
#define CT_SUPER_CUP									5
#define CT_INTERNATIONAL_FINALS							6
#define CT_INTERNATIONAL_QUAIFIERS						7
#define CT_RESERVE_DIVISION								8
#define CT_CLUB_FRIENDLY								9
#define CT_MAIN_CONTINENTAL_INTERNATIONAL_FINALS		10
#define CT_MAIN_CONTINENTAL_INTERNATIONAL_QUALIFIERS	11
#define CT_CLUB_FINALS									12
#define CT_FRIENDLY										13
#define CT_DOMESTIC_OTHER_DIVISION						14
#define CT_U21_INTERNATIONAL_FINALS						15
#define CT_U21_INTERNATIONAL_QUALIFIERS					16
#define CT_U19_INTERNATIONAL_FINALS						17
#define CT_U19_INTERNATIONAL_QUALIFIERS					18
#define CT_U23_INTERNATIONAL_FINALS						19
#define CT_U23_INTERNATIONAL_QUALIFIERS					20
#define CT_CLUB_CHAMPIONS_CUP							21
#define CT_CUP_WINNERS_CUP								22
#define CT_RESERVE_CUP									23
#define CT_INTERNATIONAL_FRIENDLY						24
#define CT_U20_INTERNATIONAL_FINALS						25
#define CT_ALL_STARS_CUP								26
#define CT_U20_INTERNATIONAL_QUALIFIERS					27
#define CT_INACTIVE_COMPETITION							28
#define CT_INACTIVE_OTHER_DIVISION						29

// comp name types
#define CNT_ORIGINAL_DATABASE_NAME				0		// name from db
#define CNT_FRIENDLY_NAME						1		// comp is friendly
#define CNT_RESERVES_LEAGUE_NAME				2		// comp is reserve league
#define CNT_U19_LEAGUE_NAME						3		// comp is u19 league
#define CNT_NAME_ON_SERVER_ONLY					4		// e.g. friendly competition Kev's Cup
#define CNT_U21_LEAGUE_NAME						5		// comp is u21 league
#define CNT_U18_LEAGUE_NAME						6		// comp is u18 league
#define CNT_U20_LEAGUE_NAME						7		// comp is u20 league
#define CNT_RESERVES_CUP_NAME					8		// comp is reserve cup
#define CNT_U19_CUP_NAME						9		// comp is u19 cup
#define CNT_U21_CUP_NAME						10		// comp is u21 cup
#define CNT_U18_CUP_NAME						11		// comp is u18 cup
#define CNT_U20_CUP_NAME						12		// comp is u20 cup
#define CNT_YOUTH_CUP_U19_NAME					13		// comp is called youth cup (for u19s)
#define CNT_FRIENDLY_CUP						14		// comp is called friendly cup

// flags
#define CF_USES_SQUAD_NUMBERS	0x01
#define CF_IS_EXTINCT			0x04

@interface Competition : NSObject {
	char databaseClass, level, nameGender, shortNameGender, nameType, unknownChar1, 
	unknownChar2, unknownChar3, unknownChar4, unknownChar5, unknownChar6, unknownChar7,
	unknownChar8, unknownChar9, unknownChar10, type, flags;
	short minPitchLength, minPitchWidth, maxPitchLength, maxPitchWidth, reputation, 
		  nationalReputation, averageClubReputationAtStart, unknownShort1;
	BOOL hasInfos;
	int rowID, UID, continentID, nationID;
	int northBoundaryCityID, southBoundaryCityID, eastBoundaryCityID, westBoundaryCityID,
		leagueBodyClubID, lastHistoryID, historyIndexID, averageClubCashAtStart;
	Colour *colour;
	Controller *controller;
	
	NSString *name, *shortName, *threeLetterName;
	NSMutableArray *rules, *unknowns;
}

@property(assign,readwrite) char databaseClass, level, nameGender, shortNameGender, nameType, 
unknownChar1, unknownChar2, unknownChar3, unknownChar4, unknownChar5, unknownChar6, unknownChar7,
unknownChar8, unknownChar9, unknownChar10, type, flags;
@property(assign,readwrite) short minPitchLength, minPitchWidth, maxPitchLength, maxPitchWidth,
reputation, nationalReputation, averageClubReputationAtStart, unknownShort1;
@property(assign,readwrite) BOOL hasInfos;
@property(assign,readwrite) int rowID, UID, continentID, nationID, northBoundaryCityID,
southBoundaryCityID, eastBoundaryCityID, westBoundaryCityID, leagueBodyClubID, lastHistoryID, 
historyIndexID, averageClubCashAtStart;
@property(assign,readwrite) Controller *controller;
@property(assign,readwrite) Colour *colour;
@property(copy,readwrite) NSString *name, *shortName, *threeLetterName;
@property(copy,readwrite) NSMutableArray *rules, *unknowns;

- (BOOL)usesSquadNumbers;
- (BOOL)isExtinct;

- (NSArray *)typeStrings;
- (NSString *)nationString;
- (NSString *)continentString;

@end
