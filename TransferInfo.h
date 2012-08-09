//
//  TransferInfo.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/14.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "FMDate.h"

// transfer info types
#define TI_MAX_PLAYERS_ON_LOAN_IN_SEASON		0
#define TI_NO_OF_DISCOVERY_PLAYERS_IN_SEASON	1
#define TI_MONTHLY_INSTALLMENT_INFO				2
//#define TI_CLUB_SQUAD_SELECTION_TOTAL_VALUES	3
#define TI_UNKNOWN_15							3
#define TI_PLAYER_FIRST_OPTION_INFO				4
#define TI_NEXT_SALE_PERCENTAGE_INFO			5
#define TI_APPEARANCE_MONEY_INFO				6
#define TI_BUY_BACK_INFO						7
#define TI_MAX_NON_EEC_PLAYERS_INFO				8
#define TI_STARTING_PLAYER_RECORD_INFO			9
#define TI_ARRANGED_FRIENDLY_INFO								10
#define TI_NO_OF_NON_EU_PLAYERS_SIGNED_FROM_ABROAD_PER_SEASON	11
#define TI_PROMOTION_CASH_INFO									12
#define TI_MAX_PLAYERS_ON_SHORT_TERM_LOAN_IN_SEASON				13
#define TI_MAX_PLAYERS_ON_LONG_TERM_LOAN_IN_SEASON				14
#define TI_UNKNOWN_1_MLS						15
#define TI_UNKNOWN_2							16
#define TI_UNKNOWN_12							17
#define TI_UNKNOWN_11							18
#define TI_UNKNOWN_10							19
#define TI_UNKNOWN_6							20
#define TI_UNKNOWN_9							21
#define TI_UNKNOWN_7							22
#define TI_UNKNOWN_13							23
#define TI_UNKNOWN_3							24
#define TI_UNKNOWN_5							25
#define TI_UNKNOWN_4							26
#define TI_UNKNOWN_8							27
#define TI_UNKNOWN_14							28
#define TI_UNKNOWN_16							29
#define TI_UNKNOWN_17                           30

// next sale percentage fees to check 
#define FTC_INITIAL_FEE					0x01
#define FTC_MONTHLY_INSTALLMENTS		0x02
#define FTC_LEAGUE_APPEARANCES			0x04
#define FTC_INTERNATIONAL_APPEARANCES	0x08
#define FTC_LEAGUE_GOALS				0x10
#define FTC_FEE_PER_LEAGUE_GAME			0x20
#define	FTC_AFTER_PROMOTION				0x40
#define FTC_CHECK_ALL					0x4F

#define FTC_MAX							0x7F

// appearance money types
#define AMT_AFTER_LEAGUE_APPEARANCES			0
#define AMT_AFTER_INTERNATIONAL_APPEARANCES		1
#define AMT_PER_LEAGUE_APPEARANCE				2
#define AMT_AFTER_LEAGUE_GOALS					3

#define AMT_COUNT								3

@interface TransferInfo : NSObject {
	char type, playersBeenOnLoan, discoveryPlayersSigned, paymentsRemaining,
		 maxNumberNonECPlayers, playersSigned, percentage;
	char unknownChar1, unknownChar2, unknownChar3, unknownChar4,
	unknownChar5, unknownChar6, unknownChar7, unknownChar8, unknownChar9, unknownChar10;
	unsigned char feesToCheck;
	BOOL totalValuesExist, teamHasBeenInvited;
	short mostApps, mostGoals;
	int info, cash, buyingClubID, sellingClubID, playerID, futureCash, appearances,
		appearancesSoFar, appearanceInfoType, mostAppsPersonID, mostGoalsPersonID;
	int unknownInt1;
	FMDate *lastUpdateDate, *deadline, *firstOptionEndDate, *unknownDate1;
	NSData *unknownData1, *unknownData2, *unknownData3;
	NSString *mostAppsFirstName, *mostAppsSurname, *mostGoalsFirstName, *mostGoalsSurname;
	NSMutableArray *totalValues, *unknownDates, *players;
}

@property(assign, readwrite) char type, playersBeenOnLoan, discoveryPlayersSigned, paymentsRemaining,
maxNumberNonECPlayers, playersSigned, percentage, unknownChar1, unknownChar2, unknownChar3, unknownChar4,
unknownChar5, unknownChar6, unknownChar7, unknownChar8, unknownChar9, unknownChar10;
@property(assign, readwrite) unsigned char feesToCheck;
@property(assign, readwrite) BOOL totalValuesExist, teamHasBeenInvited;
@property(assign, readwrite) short mostApps, mostGoals;
@property(assign, readwrite) int info, cash, buyingClubID, sellingClubID, playerID, futureCash, appearances,
appearancesSoFar, appearanceInfoType, mostAppsPersonID, mostGoalsPersonID, unknownInt1;
@property(assign, readwrite) FMDate *lastUpdateDate, *deadline, *firstOptionEndDate, *unknownDate1;
@property(copy, readwrite) NSData *unknownData1, *unknownData2, *unknownData3;
@property(copy, readwrite) NSString *mostAppsFirstName, *mostAppsSurname, *mostGoalsFirstName, *mostGoalsSurname;
@property(copy, readwrite) NSMutableArray *totalValues, *unknownDates, *players;

@end
