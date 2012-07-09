//
//  ClubFinanceSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/23.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ClubFinanceSaver.h"
#import "ClubFinanceRecordSaver.h"
#import "ClubFinanceRevenueRecordSaver.h"
#import "FMDateSaver.h"
#import "GameVersions.h"

@implementation ClubFinanceSaver

+ (void)saveFinance:(ClubFinance *)object toData:(NSMutableData *)data version:(short)version
{
	BOOL bbuffer;
	char cbuffer;
	float fbuffer;
	int ibuffer;
	
	cbuffer = [object type];
	[data appendBytes:&cbuffer length:1];
	
	if ([object type]==FT_FULL_TYPE) {
		ibuffer = [object seasonTransferBudget];
		[data appendBytes:&ibuffer length:4];
		ibuffer = [object remainingTransferBudget];
		[data appendBytes:&ibuffer length:4];
		
		// expenditure
		ibuffer = [object otherOut];
		[data appendBytes:&ibuffer length:4];
		ibuffer = [object loanRepayments];
		[data appendBytes:&ibuffer length:4];
		ibuffer = [object leagueFines];
		[data appendBytes:&ibuffer length:4];
		ibuffer = [object groundMaintenance];
		[data appendBytes:&ibuffer length:4];
		ibuffer = [object playerWages];
		[data appendBytes:&ibuffer length:4];
		ibuffer = [object staffWages];
		[data appendBytes:&ibuffer length:4];
		ibuffer = [object dividendsOut];
		[data appendBytes:&ibuffer length:4];
		ibuffer = [object bonuses];
		[data appendBytes:&ibuffer length:4];
		ibuffer = [object signingOnFees];
		[data appendBytes:&ibuffer length:4];
		ibuffer = [object tax];
		[data appendBytes:&ibuffer length:4];
		ibuffer = [object matchDayExpenses];
		[data appendBytes:&ibuffer length:4];
		
		// income
		ibuffer = [object gateReceipts];
		[data appendBytes:&ibuffer length:4];
		ibuffer = [object otherIn];
		[data appendBytes:&ibuffer length:4];
		ibuffer = [object prizeMoney];
		[data appendBytes:&ibuffer length:4];
		ibuffer = [object seasonTickets];
		[data appendBytes:&ibuffer length:4];
		ibuffer = [object interest];
		[data appendBytes:&ibuffer length:4];
		ibuffer = [object investments];
		[data appendBytes:&ibuffer length:4];
		ibuffer = [object TVRevenue];
		[data appendBytes:&ibuffer length:4];
		ibuffer = [object merchandising];
		[data appendBytes:&ibuffer length:4];
		ibuffer = [object sponsorship];
		[data appendBytes:&ibuffer length:4];
		ibuffer = [object matchDayIncome];
		[data appendBytes:&ibuffer length:4];
		
		cbuffer = [object excessiveWages];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object stateOfEmergency];
		[data appendBytes:&cbuffer length:1];
		ibuffer = [object currentMaximumWage];
		[data appendBytes:&ibuffer length:4];
		ibuffer = [object weeklyWageTotal];
		[data appendBytes:&ibuffer length:4];
		ibuffer = [object unknownInt1];
		[data appendBytes:&ibuffer length:4];
		ibuffer = [object unknownInt2];
		[data appendBytes:&ibuffer length:4];
		ibuffer = [object unknownInt3];
		[data appendBytes:&ibuffer length:4];
		
		[FMDateSaver saveDate:[object unknownDate2] toData:data];
		
		ibuffer = [object playersSold];
		[data appendBytes:&ibuffer length:4];
		ibuffer = [object playersBought];
		[data appendBytes:&ibuffer length:4];
		ibuffer = [object estimatedWeeklyMerchandise];
		[data appendBytes:&ibuffer length:4];
		ibuffer = [object weeklyWageBudget];
		[data appendBytes:&ibuffer length:4];
		[ClubFinanceRecordSaver saveRecord:[object thisMonth] toData:data];
		[ClubFinanceRecordSaver saveRecord:[object lastMonth] toData:data];
		[ClubFinanceRecordSaver saveRecord:[object lastYear] toData:data];
		[ClubFinanceRecordSaver saveRecord:[object thisYear] toData:data];
		
		ibuffer = [object unknownInt4];
		[data appendBytes:&ibuffer length:4];
		ibuffer = [object unknownInt5];
		[data appendBytes:&ibuffer length:4];
		ibuffer = [object unknownInt6];
		[data appendBytes:&ibuffer length:4];
		ibuffer = [object unknownInt7];
		[data appendBytes:&ibuffer length:4];
		cbuffer = [object unknownChar3];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar4];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar5];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar6];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar7];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar8];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar9];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar10];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar11];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar12];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar13];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar14];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar15];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar16];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar17];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar32];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar33];
		
		[data appendBytes:&cbuffer length:1];
		ibuffer = [object transferIncomePercentage];
		[data appendBytes:&ibuffer length:4];
		cbuffer = [object unknownChar1];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar2];
		[data appendBytes:&cbuffer length:1];
		
		[FMDateSaver saveDate:[object lastBudgetIncreaseDate] toData:data];
		[FMDateSaver saveDate:[object lastSeasonUpdateDate] toData:data];
		
		ibuffer = [object unknownInt8];
		[data appendBytes:&ibuffer length:4];
		
		cbuffer = [[object pastRecords] count];
		[data appendBytes:&cbuffer length:1];
		for (int i = 0; i<[[object pastRecords] count]; i++) {
			[ClubFinanceRecordSaver saveRecord:[[object pastRecords] objectAtIndex:i] toData:data];
		}
		cbuffer = [[object pastRevenueRecords] count];
		[data appendBytes:&cbuffer length:1];
		for (int i = 0; i<[[object pastRevenueRecords] count]; i++) {
			[ClubFinanceRevenueRecordSaver saveRecord:[[object pastRevenueRecords] objectAtIndex:i] toData:data];
		}
		
		[FMDateSaver saveDate:[object unknownDate1] toData:data];
		
		cbuffer = [object unknownChar18];
		[data appendBytes:&cbuffer length:1];
		ibuffer = [object unknownInt9];
		[data appendBytes:&ibuffer length:4];
		ibuffer = [object unknownInt10];
		[data appendBytes:&ibuffer length:4];
		ibuffer = [object unknownInt11];
		[data appendBytes:&ibuffer length:4];
		ibuffer = [object unknownInt12];
		[data appendBytes:&ibuffer length:4];
		ibuffer = [object unknownInt13];
		[data appendBytes:&ibuffer length:4];
		ibuffer = [object unknownInt14];
		[data appendBytes:&ibuffer length:4];
		ibuffer = [object unknownInt15];
		[data appendBytes:&ibuffer length:4];
		cbuffer = [object unknownChar19];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar34];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar35];
		[data appendBytes:&cbuffer length:1];
	}
	
	if ([object type]!=FT_INVALID_TYPE) {
		ibuffer = [object balance];
		[data appendBytes:&ibuffer length:4];
		cbuffer = [object sugarDaddy];
		[data appendBytes:&cbuffer length:1];
		bbuffer = [object sugarDaddyIncreasesStartingFinances];
		[data appendBytes:&bbuffer length:1];
		cbuffer = [object unknownChar30];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar31];
		[data appendBytes:&cbuffer length:1];
		[FMDateSaver saveDate:[object transferEmbargoStartDate] toData:data];
		[FMDateSaver saveDate:[object transferEmbargoEndDate] toData:data];
		[FMDateSaver saveDate:[object transferEmbargoAppealDate] toData:data];
		
		ibuffer = [object unknownInt16];
		[data appendBytes:&ibuffer length:4];
		[FMDateSaver saveDate:[object unknownDate5] toData:data];
		ibuffer = [object annualStadiumRental];
		[data appendBytes:&ibuffer length:4];
		cbuffer = [object unknownChar20];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar21];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar22];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar23];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar24];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar25];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar26];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar27];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar28];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar29];
		[data appendBytes:&cbuffer length:1];
		fbuffer = [object averageMatchTicketPrice];
		[data appendBytes:&fbuffer length:4];
		fbuffer = [object averageSeasonTicketPrice];
		[data appendBytes:&fbuffer length:4];
		fbuffer = [object unknownFloat1];
		[data appendBytes:&fbuffer length:4];
		fbuffer = [object unknownFloat2];
		[data appendBytes:&fbuffer length:4];
		fbuffer = [object unknownFloat3];
		[data appendBytes:&fbuffer length:4];
		
		cbuffer = [object unknownChar36];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar37];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar38];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar39];
		[data appendBytes:&cbuffer length:1];
		
	}
}

@end
