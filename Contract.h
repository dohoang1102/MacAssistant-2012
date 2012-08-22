//
//  Contract.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/29.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "FMDate.h"

// contract types
#define CT_INVALID_CONTRACT					-1					// not used in a contract
#define CT_FULL_CONTRACT					0
#define CT_LOAN_CONTRACT					1
#define CT_TRIAL_CONTRACT					2
#define CT_FIRST_OPTION_CONTRACT			3
#define CT_CO_OWNERSHIP_CONTRACT			4
#define CT_LEAGUE_CONTRACT					5					// contracted to MLS for example

// squad status
#define SS_INVALID_SQUAD_STATUS			-1			// used for screen send/receive
#define SS_NOT_YET_SET					0
#define SS_KEY_PLAYER					1
#define SS_FIRST_TEAM_REGULAR			2
#define SS_FIRST_TEAM_SQUAD_ROTATION	3
#define SS_MAIN_BACKUP_PLAYER			4
#define SS_HOT_PROSPECT_FOR_FUTURE		5
#define SS_DECENT_YOUNGSTER				6
#define SS_NOT_NEEDED					7
#define SS_SQUAD_STATUS_COUNT			8

// extra squad status
#define SS_ON_TRIAL						(SQUAD_STATUS)8

// transfer status
#define TS_TRANSFER_LISTED_BY_CLUB		0x01
#define TS_LISTED_FOR_LOAN				0x02
#define TS_AUTO_ASKING_PRICE			0x04
#define TS_TRANSFER_LISTED_BY_REQUEST	0x08
#define TS_UNAVAILABLE					0x10
#define TS_YOUTH_PLAYER_BEING_RELEASED	0x20
#define TS_UNAVAILABLE_FOR_LOAN			0x40

// contract status
#define COT_PART_TIME	0
#define COT_FULL_TIME	1
#define COT_AMATEUR		2
#define COT_YOUTH		3

// loan contract flags
#define LCF_CAN_PLAY_AGAINST_OWN_CLUB	0x01
#define LCF_CAN_PLAY_IN_CUP				0x02
#define LCF_CAN_BE_RECALLED				0x04

@interface Contract : NSObject {
	char type, status, job, teamContainerType, currentSquadStatus, perceivedSquadStatus,
	happinessLevel, squadNumber, gamesMissedInARow, gamesPlayedInARow,
	clubChoiceFactor, transferOfferOptions, unknownChar1, unknownChar2, unknownChar3, 
	unknownChar4, unknownChar5, unknownChar6, unknownChar7, unknownChar8;
	unsigned char transferStatus;
	BOOL leavingOnBosman;
	short leagueGamesPlayedSinceJoined;
	int appearanceBonus, goalBonus, cleanSheetBonus, personID, clubID, weeklyWage, agreedPrice,
	unknownInt1;
	long long happiness;
	FMDate *expiryDate, *startDate, *endDate, *unknownDate1;
	NSData *unknownData1, *unknownData2, *unknownData3;
	NSMutableArray *clauses, *bonuses;
	
	BOOL transferListedByClub, listedForLoan, autoAskingPrice, unavailableForLoan,
	transferListedByRequest, unavailable, youthPlayerBeingReleased;
}

@property(assign,readwrite) char type, status, job, teamContainerType, currentSquadStatus, perceivedSquadStatus,
happinessLevel, squadNumber, gamesMissedInARow, gamesPlayedInARow, clubChoiceFactor,
transferOfferOptions, unknownChar1, unknownChar2, unknownChar3, unknownChar4, unknownChar5, unknownChar6, unknownChar7, 
unknownChar8;
@property(assign,readwrite) unsigned char transferStatus;
@property(assign,readwrite) BOOL leavingOnBosman, transferListedByClub, listedForLoan, autoAskingPrice, unavailableForLoan,
transferListedByRequest, unavailable, youthPlayerBeingReleased;
@property(assign,readwrite) short leagueGamesPlayedSinceJoined;
@property(assign,readwrite) int appearanceBonus, goalBonus, cleanSheetBonus, personID, clubID, weeklyWage,
agreedPrice, unknownInt1;
@property(assign,readwrite) long long happiness;
@property(assign,readwrite) FMDate *expiryDate, *startDate, *endDate, *unknownDate1;
@property(copy,readwrite) NSData *unknownData1, *unknownData2, *unknownData3;
@property(copy,readwrite) NSMutableArray *clauses, *bonuses;

- (NSArray *)squadStatusStrings;
- (NSArray *)statusStrings;
- (NSArray *)typeStrings;
- (BOOL)isLoanContract;
- (BOOL)isFullContract;
- (BOOL)isYouthContract;

@end
