//
//  Contract.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/29.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Contract.h"

@implementation Contract

@synthesize type, status, job, teamContainerType, currentSquadStatus, perceivedSquadStatus,
transferStatus, happinessLevel, squadNumber, leavingOnBosman, leagueGamesPlayedSinceJoined,
appearanceBonus, goalBonus, cleanSheetBonus, personID, clubID, weeklyWage, happiness,
expiryDate, startDate, clauses, endDate, agreedPrice, gamesMissedInARow, gamesPlayedInARow,
clubChoiceFactor, transferOfferOptions, unknownChar1, unknownChar2, unknownChar3, unknownChar4, 
unknownChar5, unknownData1, unknownData2, unknownDate1, bonuses, unknownChar6, unknownChar7, 
unknownChar8, unknownInt1, unknownData3;

- (NSArray *)squadStatusStrings
{
	NSArray *strings = [NSArray arrayWithObjects:
						NSLocalizedString(@"Not Set", @"general 'not set' option"),
						NSLocalizedString(@"Key Player", @"squad status"),
						NSLocalizedString(@"First Team Regular", @"squad status"),
						NSLocalizedString(@"First Team Squad Rotation", @"squad status"),
						NSLocalizedString(@"Main Backup Player", @"squad status"),
						NSLocalizedString(@"Hot Prospect For The Future", @"squad status"),
						NSLocalizedString(@"Decent Youngster", @"squad status"),
						NSLocalizedString(@"Not Needed", @"squad status"),
						nil];
	return strings;
}

- (NSArray *)statusStrings
{
	NSArray *strings = [NSArray arrayWithObjects:
						NSLocalizedString(@"Part-Time", @"contract status"),
						NSLocalizedString(@"Full-Time", @"contract status"),
						NSLocalizedString(@"Amateur", @"contract status"),
						NSLocalizedString(@"Youth", @"contract status"),
						nil];
	return strings;
}

- (BOOL)transferListedByClub { return (transferStatus & TS_TRANSFER_LISTED_BY_CLUB); }
- (void)setTransferListedByClub:(BOOL)val {
	if (transferStatus & TS_TRANSFER_LISTED_BY_CLUB) {
		if (!val) { transferStatus = (transferStatus ^ TS_TRANSFER_LISTED_BY_CLUB); }
	}
	else { transferStatus = (transferStatus | TS_TRANSFER_LISTED_BY_CLUB); }
}

- (BOOL)listedForLoan { return (transferStatus & TS_LISTED_FOR_LOAN); }
- (void)setListedForLoan:(BOOL)val {
	if (transferStatus & TS_LISTED_FOR_LOAN) {
		if (!val) { transferStatus = (transferStatus ^ TS_LISTED_FOR_LOAN); }
	}
	else { transferStatus = (transferStatus | TS_LISTED_FOR_LOAN); }
}

- (BOOL)autoAskingPrice { return (transferStatus & TS_AUTO_ASKING_PRICE); }
- (void)setAutoAskingPrice:(BOOL)val {
	if (transferStatus & TS_AUTO_ASKING_PRICE) {
		if (!val) { transferStatus = (transferStatus ^ TS_AUTO_ASKING_PRICE); }
	}
	else { transferStatus = (transferStatus | TS_AUTO_ASKING_PRICE); }
}

- (BOOL)unavailableForLoan { return (transferStatus & TS_UNAVAILABLE_FOR_LOAN); }
- (void)setUnavailableForLoan:(BOOL)val {
	if (transferStatus & TS_UNAVAILABLE_FOR_LOAN) {
		if (!val) { transferStatus = (transferStatus ^ TS_UNAVAILABLE_FOR_LOAN); }
	}
	else { transferStatus = (transferStatus | TS_UNAVAILABLE_FOR_LOAN); }
}

- (BOOL)transferListedByRequest { return (transferStatus & TS_TRANSFER_LISTED_BY_REQUEST); }
- (void)setTransferListedByRequest:(BOOL)val {
	if (transferStatus & TS_TRANSFER_LISTED_BY_REQUEST) {
		if (!val) { transferStatus = (transferStatus ^ TS_TRANSFER_LISTED_BY_REQUEST); }
	}
	else { transferStatus = (transferStatus | TS_TRANSFER_LISTED_BY_REQUEST); }
}

- (BOOL)unavailable { return (transferStatus & TS_UNAVAILABLE); }
- (void)setUnavailable:(BOOL)val {
	if (transferStatus & TS_UNAVAILABLE) {
		if (!val) { transferStatus = (transferStatus ^ TS_UNAVAILABLE); }
	}
	else { transferStatus = (transferStatus | TS_UNAVAILABLE); }
}

- (BOOL)youthPlayerBeingReleased { return (transferStatus & TS_YOUTH_PLAYER_BEING_RELEASED); }
- (void)setYouthPlayerBeingReleased:(BOOL)val {
	if (transferStatus & TS_YOUTH_PLAYER_BEING_RELEASED) {
		if (!val) { transferStatus = (transferStatus ^ TS_YOUTH_PLAYER_BEING_RELEASED); }
	}
	else { transferStatus = (transferStatus | TS_YOUTH_PLAYER_BEING_RELEASED); }
}

- (BOOL)isLoanContract { if (type == CT_LOAN_CONTRACT) { return TRUE; } return FALSE; }
- (BOOL)isFullContract { if (type == CT_FULL_CONTRACT) { return TRUE; } return FALSE; }
- (BOOL)isYouthContract { if (status == COT_YOUTH) { return TRUE; } return FALSE; }

@end
