//
//  Player.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/01.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "FMDate.h"

// MLS Player Types
#define MPT_FUTURE_PROFESSIONAL				5
#define MPT_DISCOVERY_PLAYER				6
#define MPT_GENERATION_ADIDAS				7
#define MPT_SENIOR_DEVELOPMENTAL_CONTRACT	8
#define MPT_DEVELOPMENTAL_CONTRACT			9
#define MPT_DESIGNATED_PLAYER_CONTRACT		11

// MLS Draft Type
#define MDT_SUPERDRAFT		0
#define MDT_SUPPLEMENTAL	1
#define MDT_INAUGURAL		2
#define MDT_DISPERSAL		4
#define MDT_DRAFT_LOTTERY	7
#define MDT_ALLOCATION		8

// Preferred Moves
#define PPM_RUNS_WITH_BALL_DOWN_LEFT						0x0000000000000001
#define PPM_RUNS_WITH_BALL_DOWN_RIGHT						0x0000000000000002
#define PPM_RUNS_WITH_BALL_THROUGH_CENTRE					0x0000000000000004
#define PPM_GETS_INTO_OPPOSITION_AREA						0x0000000000000008
#define PPM_MOVES_INTO_CHANNELS								0x0000000000000010
#define PPM_GETS_FORWARD_WHENEVER_POSSIBLE					0x0000000000000020
#define PPM_PLAYS_SHORT_SIMPLE_PASSES						0x0000000000000040
#define PPM_TRIES_KILLER_BALLS_OFTEN						0x0000000000000080
#define PPM_SHOOTS_FROM_DISTANCE							0x0000000000000100
#define PPM_SHOOTS_WITH_POWER								0x0000000000000200
#define PPM_PLACES_SHOTS									0x0000000000000400
#define PPM_CURLS_BALL										0x0000000000000800
#define PPM_LIKES_TO_ROUND_KEEPER							0x0000000000001000
#define PPM_LIKES_TO_TRY_TO_BREAK_OFFSIDE_TRAP				0x0000000000002000
// #define PPM_USES_OUTSIDE_OF_FOOT							0x0000000000004000
#define PPM_MARKS_OPPONENT_TIGHTLY							0x0000000000008000
// #define PPM_WINDS_UP_OPPONENTS							0x0000000000010000
#define PPM_ARGUES_WITH_OFFICIALS							0x0000000000020000
#define PPM_PLAYS_WITH_BACK_TO_GOAL							0x0000000000040000
#define PPM_COMES_DEEP_TO_GET_BALL							0x0000000000080000
// #define PPM_PLAYS_ONE_TWOS								0x0000000000100000
#define PPM_LIKES_TO_LOB_KEEPER								0x0000000000200000
// #define PPM_DICTATES_TEMPO								0x0000000000400000
#define PPM_LOOKS_FOR_PASS_RATHER_THAN_ATTEMPTING_TO_SCORE	0x0000000001000000
#define PPM_PLAYS_NO_THROUGH_BALLS							0x0000000002000000
#define PPM_STOPS_PLAY										0x0000000004000000
// #define PPM_KNOCKS_BALL_PAST_OPPONENT					0x0000000008000000
#define PPM_DWELLS_ON_BALL									0x0000000040000000
#define PPM_ARRIVES_LATE_IN_OPPOSITION_AREA					0x0000000080000000
#define PPM_TRIES_TO_PLAY_WAY_OUT_OF_TROUBLE				0x0000000100000000
#define PPM_STAYS_BACK_AT_ALL_TIMES							0x0000000200000000
#define PPM_AVOIDS_USING_WEAKER_FOOT						0x0000000400000000
// #define PPM_TRIES_TRICKS									0x0000000800000000
#define PPM_TRIES_LONG_RANGE_FREE_KICKS						0x0000001000000000
#define PPM_DIVES_INTO_TACKLES								0x0000002000000000
#define PPM_DOES_NOT_DIVE_INTO_TACKLES						0x0000004000000000
#define PPM_CUTS_INSIDE										0x0000008000000000
#define PPM_HUGS_LINE										0x0000010000000000
// #define PPM_GETS_CROWD_GOING								0x0000020000000000
#define PPM_TRIES_FIRST_TIME_SHOTS							0x0000040000000000
// #define PPM_TRIES_LONG_RANGE_PASSES						0x0000080000000000
// #define PPM_LIKES_BALL_PLAYED_INTO_FEET					0x0000100000000000
#define PPM_HITS_FREE_KICKS_WITH_POWER						0x0000200000000000
// #define PPM_LIKES_TO_BEAT_MAN_REPEATEDLY					0x0000400000000000
// #define PPM_LIKES_TO_SWITCH_BALL_TO_OTHER_FLANK			0x0000800000000000


#define PPM_POSSESSES_LONG_FLAT_THROW						0x0004000000000000
#define PPM_RUNS_WITH_BALL_OFTEN							0x0008000000000000
#define PPM_RUNS_WITH_BALL_RARELY							0x0010000000000000



// Condition: 1 - 10000

@interface Player : NSObject {
	char morale, numberOfClubsShortlistedBy, recurringInjuryOccuranceCount, sentLightTrainingNews,
	trainingLevel, minutesPlayedLastMatch, MLSPlayerType, MLSDraftType, MLSLastDraftPick, MLSLastDraftRound,
	unknownChar1, unknownChar2, unknownChar3, unknownChar4, unknownChar5, unknownChar6, unknownChar7, 
	unknownChar8, unknownChar9, unknownChar11, unknownChar12, unknownChar13, unknownChar14, 
	unknownChar15, unknownChar16, unknownChar17;
	BOOL declaredForNation, AWOL, hasCareerStats, hasExtraPlayingData, hasInjuryStatus, hasForms,
	hasInternationalCareer, unknownBool1, unknownBool2, hasMLSData;
	BOOL runsWithBallDownLeft, runsWithBallDownRight, runsWithBallThroughCentre, getsIntoOppositionArea,
	movesIntoChannels, getsForwardWheneverPossible, playsShortSimplePasses, triesKillerBallsOften, shootsFromDistance, shootsWithPower,
	placesShots, curlsBall, likesToRoundKeeper, likesToTryToBreakOffsideTrap, marksOpponentTightly, arguesWithOfficials, playsWithBackToGoal,
	comesDeepToGetBall, likesToLobKeeper, looksForPassRatherThanAttemptingToScore, playsNoThroughBalls, stopsPlay, dwellsOnBall, 
	arrivesLateInOppositionArea, triesToPlayWayOutOfTrouble, staysBackAtAllTimes, avoidsUsingWeakerFoot, triesLongRangeFreeKicks,
	divesIntoTackles, doesNotDiveIntoTackles, cutsInside, hugsLine, triesFirstTimeShots, hitsFreeKicksWithPower, possessesLongFlatThrow,
	runsWithBallOften, runsWithBallRarely, MLSGuaranteedDealPlayer, MLSGuaranteedDealClub;
	short homeReputation, currentReputation, worldReputation, currentAbility, potentialAbility, unknownShort1,
	fitness, jadedness, condition, weight, height, clubLeagueGoals, clubGoals, clubAppearances, MLSLastDraftYear,
	leagueGoals, goals, appearances, clubLeagueAppearances, leagueAppearances, daysSinceLastMatch;
	int playerStatsID, value, askingPrice, firstClubID, recurringInjuryID, lastInjuryTypeID, fileListID, unknownInt2,
	unknownInt1, teamLastPlayedForID, internationalDebutOpposition, MLSRightsClubID, MLSLastDraftClubID;
	float unknownFloat1;
	unsigned long long preferredMoves;
	NSData *unknownData1, *unknownData2, *unknownData3, *unknownData4, *unknownData5, *unknownData6, *unknownData7, *unknownData8, 
	*unknownData9, *unknownData10, *unknownData11, *unknownData13, *unknownData14, *unknownData15, *unknownData16, 
	*unknownData17, *unknownData18, *unknownData19, *unknownData21, *unknownData22;
	NSMutableArray *injuries, *bans, *forms, *bookingCounts;
	FMDate *nextFitnessDropDate, *lastUpdateDate, *unknownDate1, *unknownDate2, *unknownDate3, *unknownDate4, 
	*unknownDate5, *unknownDate6, *unknownDate7, *unknownDate8, *internationalRetirementDate, *lastInternationalMatch, *unknownDate10, *unknownDate11, 
	*internationalDebutDate, *unknownDate14, *MLSDiscoveryPlayerDate, *MLSRightsExpiryDate;
}

@property(assign,readwrite) char morale, numberOfClubsShortlistedBy, recurringInjuryOccuranceCount, sentLightTrainingNews,
trainingLevel, minutesPlayedLastMatch, MLSPlayerType, MLSDraftType, MLSLastDraftPick, MLSLastDraftRound,
unknownChar1, unknownChar2, unknownChar3, unknownChar4, unknownChar5, unknownChar6, unknownChar7, 
unknownChar8, unknownChar9, unknownChar11, unknownChar12, unknownChar13, unknownChar14, 
unknownChar15, unknownChar16, unknownChar17;
@property(assign,readwrite) BOOL declaredForNation, AWOL, hasCareerStats, hasExtraPlayingData, hasInjuryStatus, hasForms,
hasInternationalCareer, unknownBool1, unknownBool2, hasMLSData, MLSGuaranteedDealPlayer, MLSGuaranteedDealClub;
@property(assign,readwrite) BOOL runsWithBallDownLeft, runsWithBallDownRight, runsWithBallThroughCentre, getsIntoOppositionArea,
movesIntoChannels, getsForwardWheneverPossible, playsShortSimplePasses, triesKillerBallsOften, shootsFromDistance, shootsWithPower,
placesShots, curlsBall, likesToRoundKeeper, likesToTryToBreakOffsideTrap, marksOpponentTightly, arguesWithOfficials, playsWithBackToGoal,
comesDeepToGetBall, likesToLobKeeper, looksForPassRatherThanAttemptingToScore, playsNoThroughBalls, stopsPlay, dwellsOnBall, 
arrivesLateInOppositionArea, triesToPlayWayOutOfTrouble, staysBackAtAllTimes, avoidsUsingWeakerFoot, triesLongRangeFreeKicks,
divesIntoTackles, doesNotDiveIntoTackles, cutsInside, hugsLine, triesFirstTimeShots, hitsFreeKicksWithPower, possessesLongFlatThrow,
runsWithBallOften, runsWithBallRarely;
@property(assign,readwrite) float unknownFloat1;
@property(assign,readwrite) short homeReputation, currentReputation, worldReputation, currentAbility, potentialAbility,
fitness, jadedness, condition, weight, height, clubLeagueGoals, clubGoals, clubAppearances, unknownShort1,
leagueGoals, goals, appearances, clubLeagueAppearances, leagueAppearances, daysSinceLastMatch, MLSLastDraftYear;
@property(assign,readwrite) int playerStatsID, value, askingPrice, firstClubID, recurringInjuryID, lastInjuryTypeID,
fileListID, unknownInt1, teamLastPlayedForID, internationalDebutOpposition, MLSRightsClubID, MLSLastDraftClubID,
unknownInt2;
@property(assign,readwrite) unsigned long long preferredMoves;
@property(readwrite,copy) NSData *unknownData1, *unknownData2, *unknownData3, *unknownData4, *unknownData5, *unknownData6, *unknownData7, *unknownData8, 
*unknownData9, *unknownData10, *unknownData11, *unknownData13, *unknownData14, *unknownData15, *unknownData16, 
*unknownData17, *unknownData18, *unknownData19, *unknownData21, *unknownData22;
@property(retain, readwrite) NSMutableArray *injuries, *bans, *forms, *bookingCounts;
@property(assign,readwrite) FMDate *nextFitnessDropDate, *lastUpdateDate, *unknownDate1, *unknownDate2, *unknownDate3, *unknownDate4, 
*unknownDate5, *unknownDate6, *unknownDate7, *unknownDate8, *internationalRetirementDate, *lastInternationalMatch, *unknownDate10, *unknownDate11, *internationalDebutDate, 
*unknownDate14, *MLSDiscoveryPlayerDate, *MLSRightsExpiryDate;

- (int)conditionPercent;
- (NSString *)heightString;
- (NSString *)weightString;

@end
