//
//  ClubFinance.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/25.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ClubFinanceRecord.h"
#import "FMDate.h"

// finance types
#define FT_BASE_TYPE	0
#define FT_FULL_TYPE	1
#define FT_INVALID_TYPE	2

// sugar daddy
#define CSD_NONE			0
#define CSD_FOREGROUND		1
#define CSD_BACKGROUND		2
#define CSD_UNDERWRITER		3

// States of emergency
#define SOE_OKAY           0
#define SOE_BANKRUPT       1
#define SOE_INSECURE       2

@interface ClubFinance : NSObject {
	char type, sugarDaddy, stateOfEmergency, excessiveWages;
	char unknownChar1, unknownChar2, unknownChar3, unknownChar4, unknownChar5, unknownChar6, 
	unknownChar7, unknownChar8, unknownChar9, unknownChar10, unknownChar11, unknownChar12, 
	unknownChar13, unknownChar14, unknownChar15, unknownChar16, unknownChar17, unknownChar18, 
	unknownChar19, unknownChar20, unknownChar21, unknownChar22, unknownChar23, unknownChar24, 
	unknownChar25, unknownChar26, unknownChar27, unknownChar28, unknownChar29, unknownChar30,
	unknownChar31, unknownChar32, unknownChar33, unknownChar34, unknownChar35, unknownChar36,
	unknownChar37, unknownChar38, unknownChar39;
	BOOL sugarDaddyIncreasesStartingFinances, isValidFinance;
	BOOL isFullFinance;
	int seasonTransferBudget, remainingTransferBudget, balance, annualStadiumRental;
	int transferIncomePercentage;
	int otherOut, loanRepayments, leagueFines, groundMaintenance, playerWages, staffWages,
		dividendsOut, bonuses, signingOnFees, tax, matchDayExpenses, gateReceipts, otherIn,
		prizeMoney, seasonTickets, interest, investments, TVRevenue, merchandising,
		sponsorship, matchDayIncome, currentMaximumWage, weeklyWageTotal, playersSold, 
		playersBought, estimatedWeeklyMerchandise, weeklyWageBudget;
	int unknownInt1, unknownInt2, unknownInt3, unknownInt4, unknownInt5, unknownInt6, 
	unknownInt7, unknownInt8, unknownInt9, unknownInt10, unknownInt11, unknownInt12, 
	unknownInt13, unknownInt14, unknownInt15, unknownInt16;
	
	float averageMatchTicketPrice, averageSeasonTicketPrice;
	float unknownFloat1, unknownFloat2, unknownFloat3;
	ClubFinanceRecord *thisMonth, *lastMonth, *lastYear, *thisYear;
	
	FMDate *lastBudgetIncreaseDate, *lastSeasonUpdateDate, *unknownDate1, *transferEmbargoStartDate, 
	*transferEmbargoEndDate, *transferEmbargoAppealDate, *unknownDate5, *unknownDate2;
	NSMutableArray *pastRecords, *pastRevenueRecords;
}

@property(assign,readwrite) char type, sugarDaddy, stateOfEmergency, excessiveWages,
unknownChar1, unknownChar2, unknownChar3, unknownChar4, unknownChar5, unknownChar6, 
unknownChar7, unknownChar8, unknownChar9, unknownChar10, unknownChar11, unknownChar12, 
unknownChar13, unknownChar14, unknownChar15, unknownChar16, unknownChar17, unknownChar18, 
unknownChar19, unknownChar20, unknownChar21, unknownChar22, unknownChar23, unknownChar24, 
unknownChar25, unknownChar26, unknownChar27, unknownChar28, unknownChar29, unknownChar30,
unknownChar31, unknownChar32, unknownChar33, unknownChar34, unknownChar35, unknownChar36,
unknownChar37, unknownChar38, unknownChar39;
@property(assign,readwrite) int seasonTransferBudget, remainingTransferBudget,
balance, annualStadiumRental, transferIncomePercentage,
otherOut, loanRepayments, leagueFines, groundMaintenance, playerWages, staffWages,
dividendsOut, bonuses, signingOnFees, tax, matchDayExpenses, gateReceipts, otherIn,
prizeMoney, seasonTickets, interest, investments, TVRevenue, merchandising,
sponsorship, matchDayIncome, currentMaximumWage, weeklyWageTotal, playersSold, 
playersBought, estimatedWeeklyMerchandise, weeklyWageBudget,
unknownInt1, unknownInt2, unknownInt3, unknownInt4, unknownInt5, unknownInt6, 
unknownInt7, unknownInt8, unknownInt9, unknownInt10, unknownInt11, unknownInt12, 
unknownInt13, unknownInt14, unknownInt15, unknownInt16;
@property(assign,readwrite) BOOL sugarDaddyIncreasesStartingFinances;
@property(nonatomic, assign, readwrite) BOOL isFullFinance, isValidFinance;
@property(assign,readwrite) float averageMatchTicketPrice, averageSeasonTicketPrice,
unknownFloat1, unknownFloat2, unknownFloat3;
@property(assign,readwrite) FMDate *lastBudgetIncreaseDate, *lastSeasonUpdateDate, *unknownDate2,
*unknownDate1, *transferEmbargoStartDate, *transferEmbargoEndDate, *transferEmbargoAppealDate, *unknownDate5;
@property(copy,readwrite) NSMutableArray *pastRecords, *pastRevenueRecords;
@property(assign,readwrite) ClubFinanceRecord *thisMonth, *lastMonth, *lastYear, *thisYear;

- (NSArray *)sugarDaddyStrings;
- (NSArray *)stateOfEmergencyStrings;

@end
