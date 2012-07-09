//
//  ClubFinance.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/25.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ClubFinance.h"


@implementation ClubFinance

@synthesize type, seasonTransferBudget, remainingTransferBudget, sugarDaddy,
averageMatchTicketPrice, averageSeasonTicketPrice, balance, annualStadiumRental,
sugarDaddyIncreasesStartingFinances, lastBudgetIncreaseDate, lastSeasonUpdateDate,
pastRecords, pastRevenueRecords, transferIncomePercentage, thisMonth, lastMonth, 
otherOut, loanRepayments, leagueFines, groundMaintenance, playerWages, staffWages,
dividendsOut, bonuses, signingOnFees, tax, matchDayExpenses, gateReceipts, otherIn,
prizeMoney, seasonTickets, interest, investments, TVRevenue, merchandising,
sponsorship, matchDayIncome, currentMaximumWage, weeklyWageTotal, playersSold, 
playersBought, estimatedWeeklyMerchandise, weeklyWageBudget, lastYear, thisYear,
stateOfEmergency, excessiveWages, isFullFinance, isValidFinance,
unknownInt1, unknownInt2, unknownInt3, unknownInt4, unknownInt5, unknownInt6, 
unknownInt7, unknownInt8, unknownInt9, unknownInt10, unknownInt11, unknownInt12, 
unknownInt13, unknownInt14, unknownInt15, unknownInt16, unknownChar31,
unknownChar1, unknownChar2, unknownChar3, unknownChar4, unknownChar5, unknownChar6, 
unknownChar7, unknownChar8, unknownChar9, unknownChar10, unknownChar11, unknownChar12, 
unknownChar13, unknownChar14, unknownChar15, unknownChar16, unknownChar17, unknownChar18, 
unknownChar19, unknownChar20, unknownChar21, unknownChar22, unknownChar23, unknownChar24, 
unknownChar25, unknownChar26, unknownChar27, unknownChar28, unknownChar29, unknownChar30,
unknownDate1, transferEmbargoStartDate, transferEmbargoEndDate, transferEmbargoAppealDate, unknownDate5, unknownFloat1,
unknownFloat2, unknownFloat3, unknownChar32, unknownChar33, unknownChar34, unknownChar35, unknownChar36,
unknownChar37, unknownChar38, unknownChar39, unknownDate2;

- (BOOL)isFullFinance 
{
	if (type==FT_FULL_TYPE) { return TRUE; }
	return FALSE;
}

- (BOOL)isValidFinance 
{
	if (type!=FT_INVALID_TYPE) { return TRUE; }
	return FALSE;
}

- (NSArray *)sugarDaddyStrings
{
	NSArray *strings = [NSArray arrayWithObjects:
						NSLocalizedString(@"None", @"sugar daddy type"),
						NSLocalizedString(@"Foreground", @"sugar daddy type"),
						NSLocalizedString(@"Backround", @"sugar daddy type"),
						NSLocalizedString(@"Underwriter", @"sugar daddy type"),
						nil];
	return strings;
}

- (NSArray *)stateOfEmergencyStrings
{
	NSArray *strings = [NSArray arrayWithObjects:
						NSLocalizedString(@"OK", @"club finance state"),
						NSLocalizedString(@"Bankrupt", @"club finance state"),
						NSLocalizedString(@"Insecure", @"club finance state"),
						nil];
	return strings;
}

@end
