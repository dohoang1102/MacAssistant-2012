//
//  Player.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/01.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Player.h"
#import "SupportFunctions.h"

@implementation Player

@synthesize morale, numberOfClubsShortlistedBy, recurringInjuryOccuranceCount, sentLightTrainingNews,
trainingLevel, minutesPlayedLastMatch, declaredForNation, AWOL, hasCareerStats, hasExtraPlayingData, 
hasInjuryStatus, homeReputation, currentReputation, worldReputation, currentAbility, potentialAbility,
fitness, jadedness, condition, weight, height, clubLeagueGoals, clubGoals, clubAppearances, bookingCounts,
leagueGoals, goals, appearances, clubLeagueAppearances, leagueAppearances, daysSinceLastMatch,
playerStatsID, value, askingPrice, firstClubID, recurringInjuryID, lastInjuryTypeID, preferredMoves,
injuries, bans, nextFitnessDropDate, lastUpdateDate, fileListID, forms, hasForms, hasInternationalCareer,
unknownData1, unknownData2, unknownData3, unknownData4, unknownData5, unknownData6, unknownData7, unknownData8, 
unknownData9, unknownData10, unknownData11, unknownData13, unknownData14, unknownData15, unknownData16, 
unknownData17, unknownData18, unknownData19, unknownData21, unknownData22, unknownChar9,
unknownDate1, unknownDate2, unknownDate3, unknownDate4, unknownDate5, unknownDate6, unknownDate7, 
internationalRetirementDate, unknownDate10, unknownDate11, unknownDate14, unknownInt2,
unknownFloat1, unknownInt1, unknownShort1, unknownBool1, unknownBool2, unknownDate8,
unknownChar1, unknownChar2, unknownChar3, unknownChar4, unknownChar5, unknownChar6, unknownChar7, 
unknownChar8, lastInternationalMatch, hasMLSData, unknownChar11, unknownChar12, unknownChar13, unknownChar14, 
unknownChar15, unknownChar16, unknownChar17, teamLastPlayedForID, internationalDebutDate, internationalDebutOpposition,
MLSPlayerType, MLSDraftType, MLSLastDraftPick, MLSLastDraftRound, MLSGuaranteedDealPlayer, MLSGuaranteedDealClub,
MLSRightsClubID, MLSLastDraftClubID, MLSLastDraftYear, MLSDiscoveryPlayerDate, MLSRightsExpiryDate;

#pragma mark PPMs

- (BOOL)runsWithBallDownLeft { if (preferredMoves & PPM_RUNS_WITH_BALL_DOWN_LEFT) { return TRUE; } return FALSE; }
- (void)setRunsWithBallDownLeft:(BOOL)val {
	if (preferredMoves & PPM_RUNS_WITH_BALL_DOWN_LEFT) {
		if (!val) { preferredMoves = (preferredMoves ^ PPM_RUNS_WITH_BALL_DOWN_LEFT); }
	}
	else { preferredMoves = (preferredMoves | PPM_RUNS_WITH_BALL_DOWN_LEFT); }
}

- (BOOL)runsWithBallDownRight { if (preferredMoves & PPM_RUNS_WITH_BALL_DOWN_RIGHT) { return TRUE; } return FALSE; }
- (void)setRunsWithBallDownRight:(BOOL)val {
	if (preferredMoves & PPM_RUNS_WITH_BALL_DOWN_RIGHT) {
		if (!val) { preferredMoves = (preferredMoves ^ PPM_RUNS_WITH_BALL_DOWN_RIGHT); }
	}
	else { preferredMoves = (preferredMoves | PPM_RUNS_WITH_BALL_DOWN_RIGHT); }
}

- (BOOL)runsWithBallThroughCentre { if (preferredMoves & PPM_RUNS_WITH_BALL_THROUGH_CENTRE) { return TRUE; } return FALSE; }
- (void)setRunsWithBallThroughCentre:(BOOL)val {
	if (preferredMoves & PPM_RUNS_WITH_BALL_THROUGH_CENTRE) {
		if (!val) { preferredMoves = (preferredMoves ^ PPM_RUNS_WITH_BALL_THROUGH_CENTRE); }
	}
	else { preferredMoves = (preferredMoves | PPM_RUNS_WITH_BALL_THROUGH_CENTRE); }
}

- (BOOL)getsIntoOppositionArea { if (preferredMoves & PPM_GETS_INTO_OPPOSITION_AREA) { return TRUE; } return FALSE; }
- (void)setGetsIntoOppositionArea:(BOOL)val {
	if (preferredMoves & PPM_GETS_INTO_OPPOSITION_AREA) {
		if (!val) { preferredMoves = (preferredMoves ^ PPM_GETS_INTO_OPPOSITION_AREA); }
	}
	else { preferredMoves = (preferredMoves | PPM_GETS_INTO_OPPOSITION_AREA); }
}

- (BOOL)movesIntoChannels { if (preferredMoves & PPM_MOVES_INTO_CHANNELS) { return TRUE; } return FALSE; }
- (void)setMovesIntoChannels:(BOOL)val {
	if (preferredMoves & PPM_MOVES_INTO_CHANNELS) {
		if (!val) { preferredMoves = (preferredMoves ^ PPM_MOVES_INTO_CHANNELS); }
	}
	else { preferredMoves = (preferredMoves | PPM_MOVES_INTO_CHANNELS); }
}

- (BOOL)getsForwardWheneverPossible { if (preferredMoves & PPM_GETS_FORWARD_WHENEVER_POSSIBLE) { return TRUE; } return FALSE; }
- (void)setGetsForwardWheneverPossible:(BOOL)val {
	if (preferredMoves & PPM_GETS_FORWARD_WHENEVER_POSSIBLE) {
		if (!val) { preferredMoves = (preferredMoves ^ PPM_GETS_FORWARD_WHENEVER_POSSIBLE); }
	}
	else { preferredMoves = (preferredMoves | PPM_GETS_FORWARD_WHENEVER_POSSIBLE); }
}

- (BOOL)playsShortSimplePasses { if (preferredMoves & PPM_PLAYS_SHORT_SIMPLE_PASSES) { return TRUE; } return FALSE; }
- (void)setPlaysShortSimplePasses:(BOOL)val {
	if (preferredMoves & PPM_PLAYS_SHORT_SIMPLE_PASSES) {
		if (!val) { preferredMoves = (preferredMoves ^ PPM_PLAYS_SHORT_SIMPLE_PASSES); }
	}
	else { preferredMoves = (preferredMoves | PPM_PLAYS_SHORT_SIMPLE_PASSES); }
}

- (BOOL)triesKillerBallsOften { if (preferredMoves & PPM_TRIES_KILLER_BALLS_OFTEN) { return TRUE; } return FALSE; }
- (void)setTriesKillerBallsOften:(BOOL)val {
	if (preferredMoves & PPM_TRIES_KILLER_BALLS_OFTEN) {
		if (!val) { preferredMoves = (preferredMoves ^ PPM_TRIES_KILLER_BALLS_OFTEN); }
	}
	else { preferredMoves = (preferredMoves | PPM_TRIES_KILLER_BALLS_OFTEN); }
}

- (BOOL)shootsFromDistance { if (preferredMoves & PPM_SHOOTS_FROM_DISTANCE) { return TRUE; } return FALSE; }
- (void)setShootsFromDistance:(BOOL)val {
	if (preferredMoves & PPM_SHOOTS_FROM_DISTANCE) {
		if (!val) { preferredMoves = (preferredMoves ^ PPM_SHOOTS_FROM_DISTANCE); }
	}
	else { preferredMoves = (preferredMoves | PPM_SHOOTS_FROM_DISTANCE); }
}

- (BOOL)shootsWithPower { if (preferredMoves & PPM_SHOOTS_WITH_POWER) { return TRUE; } return FALSE; }
- (void)setShootsWithPower:(BOOL)val {
	if (preferredMoves & PPM_SHOOTS_WITH_POWER) {
		if (!val) { preferredMoves = (preferredMoves ^ PPM_SHOOTS_WITH_POWER); }
	}
	else { preferredMoves = (preferredMoves | PPM_SHOOTS_WITH_POWER); }
}

- (BOOL)placesShots { if (preferredMoves & PPM_PLACES_SHOTS) { return TRUE; } return FALSE; }
- (void)setPlacesShots:(BOOL)val {
	if (preferredMoves & PPM_PLACES_SHOTS) {
		if (!val) { preferredMoves = (preferredMoves ^ PPM_PLACES_SHOTS); }
	}
	else { preferredMoves = (preferredMoves | PPM_PLACES_SHOTS); }
}

- (BOOL)curlsBall { if (preferredMoves & PPM_CURLS_BALL) { return TRUE; } return FALSE; }
- (void)setCurlsBall:(BOOL)val {
	if (preferredMoves & PPM_CURLS_BALL) {
		if (!val) { preferredMoves = (preferredMoves ^ PPM_CURLS_BALL); }
	}
	else { preferredMoves = (preferredMoves | PPM_CURLS_BALL); }
}

- (BOOL)likesToRoundKeeper { if (preferredMoves & PPM_LIKES_TO_ROUND_KEEPER) { return TRUE; } return FALSE; }
- (void)setLikesToRoundKeeper:(BOOL)val {
	if (preferredMoves & PPM_LIKES_TO_ROUND_KEEPER) {
		if (!val) { preferredMoves = (preferredMoves ^ PPM_LIKES_TO_ROUND_KEEPER); }
	}
	else { preferredMoves = (preferredMoves | PPM_LIKES_TO_ROUND_KEEPER); }
}

- (BOOL)likesToTryToBreakOffsideTrap { if (preferredMoves & PPM_LIKES_TO_TRY_TO_BREAK_OFFSIDE_TRAP) { return TRUE; } return FALSE; }
- (void)setLikesToTryToBreakOffsideTrap:(BOOL)val {
	if (preferredMoves & PPM_LIKES_TO_TRY_TO_BREAK_OFFSIDE_TRAP) {
		if (!val) { preferredMoves = (preferredMoves ^ PPM_LIKES_TO_TRY_TO_BREAK_OFFSIDE_TRAP); }
	}
	else { preferredMoves = (preferredMoves | PPM_LIKES_TO_TRY_TO_BREAK_OFFSIDE_TRAP); }
}

- (BOOL)marksOpponentTightly { if (preferredMoves & PPM_MARKS_OPPONENT_TIGHTLY) { return TRUE; } return FALSE; }
- (void)setMarksOpponentTightly:(BOOL)val {
	if (preferredMoves & PPM_MARKS_OPPONENT_TIGHTLY) {
		if (!val) { preferredMoves = (preferredMoves ^ PPM_MARKS_OPPONENT_TIGHTLY); }
	}
	else { preferredMoves = (preferredMoves | PPM_MARKS_OPPONENT_TIGHTLY); }
}

- (BOOL)arguesWithOfficials { if (preferredMoves & PPM_ARGUES_WITH_OFFICIALS) { return TRUE; } return FALSE; }
- (void)setArguesWithOfficials:(BOOL)val {
	if (preferredMoves & PPM_ARGUES_WITH_OFFICIALS) {
		if (!val) { preferredMoves = (preferredMoves ^ PPM_ARGUES_WITH_OFFICIALS); }
	}
	else { preferredMoves = (preferredMoves | PPM_ARGUES_WITH_OFFICIALS); }
}

- (BOOL)playsWithBackToGoal { if (preferredMoves & PPM_PLAYS_WITH_BACK_TO_GOAL) { return TRUE; } return FALSE; }
- (void)setPlaysWithBackToGoal:(BOOL)val {
	if (preferredMoves & PPM_PLAYS_WITH_BACK_TO_GOAL) {
		if (!val) { preferredMoves = (preferredMoves ^ PPM_PLAYS_WITH_BACK_TO_GOAL); }
	}
	else { preferredMoves = (preferredMoves | PPM_PLAYS_WITH_BACK_TO_GOAL); }
}

- (BOOL)comesDeepToGetBall { if (preferredMoves & PPM_COMES_DEEP_TO_GET_BALL) { return TRUE; } return FALSE; }
- (void)setComesDeepToGetBall:(BOOL)val {
	if (preferredMoves & PPM_COMES_DEEP_TO_GET_BALL) {
		if (!val) { preferredMoves = (preferredMoves ^ PPM_COMES_DEEP_TO_GET_BALL); }
	}
	else { preferredMoves = (preferredMoves | PPM_COMES_DEEP_TO_GET_BALL); }
}

- (BOOL)likesToLobKeeper { if (preferredMoves & PPM_LIKES_TO_LOB_KEEPER) { return TRUE; } return FALSE; }
- (void)setLikesToLobKeeper:(BOOL)val {
	if (preferredMoves & PPM_LIKES_TO_LOB_KEEPER) {
		if (!val) { preferredMoves = (preferredMoves ^ PPM_LIKES_TO_LOB_KEEPER); }
	}
	else { preferredMoves = (preferredMoves | PPM_LIKES_TO_LOB_KEEPER); }
}

- (BOOL)looksForPassRatherThanAttemptingToScore { if (preferredMoves & PPM_LOOKS_FOR_PASS_RATHER_THAN_ATTEMPTING_TO_SCORE) { return TRUE; } return FALSE; }
- (void)setLooksForPassRatherThanAttemptingToScore:(BOOL)val {
	if (preferredMoves & PPM_LOOKS_FOR_PASS_RATHER_THAN_ATTEMPTING_TO_SCORE) {
		if (!val) { preferredMoves = (preferredMoves ^ PPM_LOOKS_FOR_PASS_RATHER_THAN_ATTEMPTING_TO_SCORE); }
	}
	else { preferredMoves = (preferredMoves | PPM_LOOKS_FOR_PASS_RATHER_THAN_ATTEMPTING_TO_SCORE); }
}

- (BOOL)playsNoThroughBalls { if (preferredMoves & PPM_PLAYS_NO_THROUGH_BALLS) { return TRUE; } return FALSE; }
- (void)setPlaysNoThroughBalls:(BOOL)val {
	if (preferredMoves & PPM_PLAYS_NO_THROUGH_BALLS) {
		if (!val) { preferredMoves = (preferredMoves ^ PPM_PLAYS_NO_THROUGH_BALLS); }
	}
	else { preferredMoves = (preferredMoves | PPM_PLAYS_NO_THROUGH_BALLS); }
}

- (BOOL)stopsPlay { if (preferredMoves & PPM_STOPS_PLAY) { return TRUE; } return FALSE; }
- (void)setStopsPlay:(BOOL)val {
	if (preferredMoves & PPM_STOPS_PLAY) {
		if (!val) { preferredMoves = (preferredMoves ^ PPM_STOPS_PLAY); }
	}
	else { preferredMoves = (preferredMoves | PPM_STOPS_PLAY); }
}

- (BOOL)dwellsOnBall { if (preferredMoves & PPM_DWELLS_ON_BALL) { return TRUE; } return FALSE; }
- (void)setDwellsOnBall:(BOOL)val {
	if (preferredMoves & PPM_DWELLS_ON_BALL) {
		if (!val) { preferredMoves = (preferredMoves ^ PPM_DWELLS_ON_BALL); }
	}
	else { preferredMoves = (preferredMoves | PPM_DWELLS_ON_BALL); }
}

- (BOOL)arrivesLateInOppositionArea { if (preferredMoves & PPM_ARRIVES_LATE_IN_OPPOSITION_AREA) { return TRUE; } return FALSE; }
- (void)setArrivesLateInOppositionArea:(BOOL)val {
	if (preferredMoves & PPM_ARRIVES_LATE_IN_OPPOSITION_AREA) {
		if (!val) { preferredMoves = (preferredMoves ^ PPM_ARRIVES_LATE_IN_OPPOSITION_AREA); }
	}
	else { preferredMoves = (preferredMoves | PPM_ARRIVES_LATE_IN_OPPOSITION_AREA); }
}

- (BOOL)triesToPlayWayOutOfTrouble { if (preferredMoves & PPM_TRIES_TO_PLAY_WAY_OUT_OF_TROUBLE) { return TRUE; } return FALSE; }
- (void)setTriesToPlayWayOutOfTrouble:(BOOL)val {
	if (preferredMoves & PPM_TRIES_TO_PLAY_WAY_OUT_OF_TROUBLE) {
		if (!val) { preferredMoves = (preferredMoves ^ PPM_TRIES_TO_PLAY_WAY_OUT_OF_TROUBLE); }
	}
	else { preferredMoves = (preferredMoves | PPM_TRIES_TO_PLAY_WAY_OUT_OF_TROUBLE); }
}

- (BOOL)staysBackAtAllTimes { if (preferredMoves & PPM_STAYS_BACK_AT_ALL_TIMES) { return TRUE; } return FALSE; }
- (void)setStaysBackAtAllTimes:(BOOL)val {
	if (preferredMoves & PPM_STAYS_BACK_AT_ALL_TIMES) {
		if (!val) { preferredMoves = (preferredMoves ^ PPM_STAYS_BACK_AT_ALL_TIMES); }
	}
	else { preferredMoves = (preferredMoves | PPM_STAYS_BACK_AT_ALL_TIMES); }
}

- (BOOL)avoidsUsingWeakerFoot { if (preferredMoves & PPM_AVOIDS_USING_WEAKER_FOOT) { return TRUE; } return FALSE; }
- (void)setAvoidsUsingWeakerFoot:(BOOL)val {
	if (preferredMoves & PPM_AVOIDS_USING_WEAKER_FOOT) {
		if (!val) { preferredMoves = (preferredMoves ^ PPM_AVOIDS_USING_WEAKER_FOOT); }
	}
	else { preferredMoves = (preferredMoves | PPM_AVOIDS_USING_WEAKER_FOOT); }
}

- (BOOL)triesLongRangeFreeKicks { if (preferredMoves & PPM_TRIES_LONG_RANGE_FREE_KICKS) { return TRUE; } return FALSE; }
- (void)setTriesLongRangeFreeKicks:(BOOL)val {
	if (preferredMoves & PPM_TRIES_LONG_RANGE_FREE_KICKS) {
		if (!val) { preferredMoves = (preferredMoves ^ PPM_TRIES_LONG_RANGE_FREE_KICKS); }
	}
	else { preferredMoves = (preferredMoves | PPM_TRIES_LONG_RANGE_FREE_KICKS); }
}

- (BOOL)divesIntoTackles { if (preferredMoves & PPM_DIVES_INTO_TACKLES) { return TRUE; } return FALSE; }
- (void)setDivesIntoTackles:(BOOL)val {
	if (preferredMoves & PPM_DIVES_INTO_TACKLES) {
		if (!val) { preferredMoves = (preferredMoves ^ PPM_DIVES_INTO_TACKLES); }
	}
	else { preferredMoves = (preferredMoves | PPM_DIVES_INTO_TACKLES); }
}

- (BOOL)doesNotDiveIntoTackles { if (preferredMoves & PPM_DOES_NOT_DIVE_INTO_TACKLES) { return TRUE; } return FALSE; }
- (void)setDoesNotDiveIntoTackles:(BOOL)val {
	if (preferredMoves & PPM_DOES_NOT_DIVE_INTO_TACKLES) {
		if (!val) { preferredMoves = (preferredMoves ^ PPM_DOES_NOT_DIVE_INTO_TACKLES); }
	}
	else { preferredMoves = (preferredMoves | PPM_DOES_NOT_DIVE_INTO_TACKLES); }
}

- (BOOL)cutsInside { if (preferredMoves & PPM_CUTS_INSIDE) { return TRUE; } return FALSE; }
- (void)setCutsInside:(BOOL)val {
	if (preferredMoves & PPM_CUTS_INSIDE) {
		if (!val) { preferredMoves = (preferredMoves ^ PPM_CUTS_INSIDE); }
	}
	else { preferredMoves = (preferredMoves | PPM_CUTS_INSIDE); }
}

- (BOOL)hugsLine { if (preferredMoves & PPM_HUGS_LINE) { return TRUE; } return FALSE; }
- (void)setHugsLine:(BOOL)val {
	if (preferredMoves & PPM_HUGS_LINE) {
		if (!val) { preferredMoves = (preferredMoves ^ PPM_HUGS_LINE); }
	}
	else { preferredMoves = (preferredMoves | PPM_HUGS_LINE); }
}

- (BOOL)triesFirstTimeShots { if (preferredMoves & PPM_TRIES_FIRST_TIME_SHOTS) { return TRUE; } return FALSE; }
- (void)setTriesFirstTimeShots:(BOOL)val {
	if (preferredMoves & PPM_TRIES_FIRST_TIME_SHOTS) {
		if (!val) { preferredMoves = (preferredMoves ^ PPM_TRIES_FIRST_TIME_SHOTS); }
	}
	else { preferredMoves = (preferredMoves | PPM_TRIES_FIRST_TIME_SHOTS); }
}

- (BOOL)hitsFreeKicksWithPower { if (preferredMoves & PPM_HITS_FREE_KICKS_WITH_POWER) { return TRUE; } return FALSE; }
- (void)setHitsFreeKicksWithPower:(BOOL)val {
	if (preferredMoves & PPM_HITS_FREE_KICKS_WITH_POWER) {
		if (!val) { preferredMoves = (preferredMoves ^ PPM_HITS_FREE_KICKS_WITH_POWER); }
	}
	else { preferredMoves = (preferredMoves | PPM_HITS_FREE_KICKS_WITH_POWER); }
}

- (BOOL)possessesLongFlatThrow { if (preferredMoves & PPM_POSSESSES_LONG_FLAT_THROW) { return TRUE; } return FALSE; }
- (void)setPossessesLongFlatThrow:(BOOL)val {
	if (preferredMoves & PPM_POSSESSES_LONG_FLAT_THROW) {
		if (!val) { preferredMoves = (preferredMoves ^ PPM_POSSESSES_LONG_FLAT_THROW); }
	}
	else { preferredMoves = (preferredMoves | PPM_POSSESSES_LONG_FLAT_THROW); }
}

- (BOOL)runsWithBallOften { if (preferredMoves & PPM_RUNS_WITH_BALL_OFTEN) { return TRUE; } return FALSE; }
- (void)setRunsWithBallOften:(BOOL)val {
	if (preferredMoves & PPM_RUNS_WITH_BALL_OFTEN) {
		if (!val) { preferredMoves = (preferredMoves ^ PPM_RUNS_WITH_BALL_OFTEN); }
	}
	else { preferredMoves = (preferredMoves | PPM_RUNS_WITH_BALL_OFTEN); }
}

- (BOOL)runsWithBallRarely { if (preferredMoves & PPM_RUNS_WITH_BALL_RARELY) { return TRUE; } return FALSE; }
- (void)setRunsWithBallRarely:(BOOL)val {
	if (preferredMoves & PPM_RUNS_WITH_BALL_RARELY) {
		if (!val) { preferredMoves = (preferredMoves ^ PPM_RUNS_WITH_BALL_RARELY); }
	}
	else { preferredMoves = (preferredMoves | PPM_RUNS_WITH_BALL_RARELY); }
}

- (int)conditionPercent { return (condition / 100); }
- (int)fitnessPercent { return (fitness / 100); }

- (NSString *)heightString { return [NSString stringWithFormat:@"%d cm",height]; }
- (NSString *)weightString { return [NSString stringWithFormat:@"%d kg",weight]; }

@end
