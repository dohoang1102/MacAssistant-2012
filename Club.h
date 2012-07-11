//
//  Club.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/24.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ClubFinance.h"
#import "TeamContainer.h"
#import "FMDate.h"
#import "Controller.h"

// professional status
#define CPS_NOT_SET				0
#define CPS_PROFESSIONAL		1
#define CPS_SEMI_PROFESSIONAL	2
#define CPS_AMATEUR				3

#define CPS_MAX					3

// appearance money clause type
#define CAMT_AFTER_LEAGUE_APPEARANCES			0
#define CAMT_AFTER_INTERNATIONAL_APPEARANCES	1
#define CAMT_PER_LEAGUE_APPEARANCE				2
#define CAMT_AFTER_LEAGUE_GOALS					3

// affiliation type
#define CAT_NORMAL_AFFILIATED_CLUB	1
#define CAT_SUB_TEAM				2
#define CAT_FEEDER_TEAM				3
#define CAT_B_CLUB					4
#define CAT_C_CLUB					5
#define CAT_2_CLUB					6
#define CAT_3_CLUB					7
#define CAT_II_CLUB					8
#define CAT_GOOD_RELATIONS			16

// club flags
#define CF_PLC						0x01
#define CF_PAYS_HIGH_WAGES			0x02
#define CF_NEEDS_SHORTLIST_UPDATE	0x04
#define CF_UNKNOWN_1				0x08
#define CF_UNKNOWN_2				0x10
#define CF_UNKNOWN_3				0x20
#define CF_UNKNOWN_4				0x40

#define CF_MAX						0x4F


@interface Club : NSObject {
	char databaseClass, nickname1Gender, nickname2Gender, youthFacilities;
	char professionalStatus, trainingFacilities, morale;
	char firstTeamStrengthRating, firstTeamQuicknessRating, firstTeamGoalkeepingRating,
	firstTeamTacticsRating, firstTeamBallControlRating, firstTeamDefendingRating,
	firstTeamAttackingRating, firstTeamShootingRating, firstTeamSetPiecesRating,
	firstTeamStrengthWorkload, firstTeamQuicknessWorkload, firstTeamGoalkeepingWorkload,
	firstTeamTacticsWorkload, firstTeamBallControlWorkload, firstTeamDefendingWorkload,
	firstTeamAttackingWorkload, firstTeamShootingWorkload, firstTeamSetPiecesWorkload,
	youthTeamStrengthRating, youthTeamQuicknessRating, youthTeamGoalkeepingRating,
	youthTeamTacticsRating, youthTeamBallControlRating, youthTeamDefendingRating,
	youthTeamAttackingRating, youthTeamShootingRating, youthTeamSetPiecesRating,
	youthTeamStrengthWorkload, youthTeamQuicknessWorkload, youthTeamGoalkeepingWorkload,
	youthTeamTacticsWorkload, youthTeamBallControlWorkload, youthTeamDefendingWorkload,
	youthTeamAttackingWorkload, youthTeamShootingWorkload, youthTeamSetPiecesWorkload;
	char UEFAPoints, UEFAMatches, unknownChar1, roughFinancialState, unknownChar2, unknownChar3, 
	unknownChar4, unknownChar5, unknownChar6, unknownChar7, unknownChar8, unknownChar9,
	unknownChar10, unknownChar11, unknownChar12, youthCoaching, youthRecruitment;
    char supporterLoyalty, supporterPassion, supporterPatience, supporterAffluence, supporterTemperament;
	unsigned char flags;
	short yearFounded, unknownShort1, unknownShort2;
	float UEFATempCoefficient;
	int nationID, futureTransferManagerID, chairmanID, cityID;
	int averageAttendance, minimumAttendance, maximumAttendance, seasonTicketHolders;
	int rowID, UID, maximumWeeklyWage, competitionID, UEFA5YearTotal;
	BOOL hasYouthAcademy, hasUEFACoefficient, hasScoutingKnowledges, allowSponsorshipForTopPlayers,
	isPLC, paysHighWages, needsShortlistUpdate, isLeagueBodyClub;
	ClubFinance *finance;
	TeamContainer *teamContainer;
	Controller *controller;
	
	NSData *unknownData1, *unknownData2, *unknownData3, *unknownData4, *unknownData5, *unknownData6;
	FMDate *seasonStartDate, *seasonEndDate, *preSeasonStartDate, *unknownDate1, *unknownDate2;
	NSMutableArray *directors, *scouts, *shortlist, *IDPCs, *sponsors, *regionalDivisions;
	NSMutableArray *coefficients, *scoutingKnowledges, *transferOffers;
	NSString *nickname1, *nickname2, *logoPath;
}

@property(assign,readwrite) char databaseClass, nickname1Gender, nickname2Gender,
youthFacilities, professionalStatus, trainingFacilities, morale,
firstTeamStrengthRating, firstTeamQuicknessRating, firstTeamGoalkeepingRating,
firstTeamTacticsRating, firstTeamBallControlRating, firstTeamDefendingRating,
firstTeamAttackingRating, firstTeamShootingRating, firstTeamSetPiecesRating,
firstTeamStrengthWorkload, firstTeamQuicknessWorkload, firstTeamGoalkeepingWorkload,
firstTeamTacticsWorkload, firstTeamBallControlWorkload, firstTeamDefendingWorkload,
firstTeamAttackingWorkload, firstTeamShootingWorkload, firstTeamSetPiecesWorkload,
youthTeamStrengthRating, youthTeamQuicknessRating, youthTeamGoalkeepingRating,
youthTeamTacticsRating, youthTeamBallControlRating, youthTeamDefendingRating,
youthTeamAttackingRating, youthTeamShootingRating, youthTeamSetPiecesRating,
youthTeamStrengthWorkload, youthTeamQuicknessWorkload, youthTeamGoalkeepingWorkload,
youthTeamTacticsWorkload, youthTeamBallControlWorkload, youthTeamDefendingWorkload,
youthTeamAttackingWorkload, youthTeamShootingWorkload, youthTeamSetPiecesWorkload,
UEFAPoints, UEFAMatches, unknownChar1, unknownChar2, roughFinancialState, unknownChar3, 
unknownChar4, unknownChar5, unknownChar6, unknownChar7, unknownChar8, unknownChar9,
unknownChar10, unknownChar11, unknownChar12, youthCoaching, youthRecruitment;
@property(assign,readwrite) float UEFATempCoefficient;
@property(assign,readwrite) unsigned char flags;
@property(assign,readwrite) short yearFounded, unknownShort1, unknownShort2;
@property(assign, readwrite) char supporterLoyalty, supporterPassion, supporterPatience, supporterAffluence, supporterTemperament;
@property(assign,readwrite) BOOL hasYouthAcademy, hasUEFACoefficient, hasScoutingKnowledges,
allowSponsorshipForTopPlayers, isPLC, paysHighWages, needsShortlistUpdate, isLeagueBodyClub;
@property(assign,readwrite) int nationID, averageAttendance, minimumAttendance, 
maximumAttendance, futureTransferManagerID, chairmanID, seasonTicketHolders, UID, rowID,
maximumWeeklyWage, competitionID, UEFA5YearTotal, cityID;
@property(assign,readwrite) ClubFinance *finance;
@property(assign,readwrite) TeamContainer *teamContainer;
@property(assign,readwrite) Controller *controller;
@property(copy,readwrite) NSString *nickname1, *nickname2, *logoPath;
@property(copy,readwrite) NSMutableArray *directors, *scouts, *shortlist, *IDPCs,
*sponsors, *regionalDivisions, *coefficients, *scoutingKnowledges, *transferOffers;
@property(assign,readwrite) FMDate *seasonStartDate, *seasonEndDate, *preSeasonStartDate, *unknownDate1,
*unknownDate2;
@property(readwrite,copy) NSData *unknownData1, *unknownData2, *unknownData3, *unknownData4, *unknownData5, *unknownData6;

- (NSArray *)professionalStatusStrings;
- (NSArray *)directorObjects;
- (NSArray *)scoutObjects;
- (NSString *)name;
- (NSString *)nationString;
- (NSString *)competitionString;
- (short)reputation;

@end
