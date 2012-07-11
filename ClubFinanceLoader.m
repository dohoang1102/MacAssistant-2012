//
//  ClubFinanceLoader.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/25.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ClubFinanceLoader.h"
#import "ClubFinanceRecordLoader.h"
#import "ClubFinanceRevenueRecordLoader.h"
#import "FMDateLoader.h"
#import "GameVersions.h"

@implementation ClubFinanceLoader

+ (ClubFinance *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset version:(short)version
{
	char cbuffer;
	int ibuffer;
	float fbuffer;
	
	unsigned int offset = *byteOffset;
    BOOL FmFirst = YES;
	
	ClubFinance *object = [[ClubFinance alloc] init];
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setType:cbuffer];
	
	if ([object type]==FT_FULL_TYPE) {
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setSeasonTransferBudget:ibuffer];
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setRemainingTransferBudget:ibuffer];
		
		// Expenditure
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setOtherOut:ibuffer];
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setLoanRepayments:ibuffer];
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setLeagueFines:ibuffer];
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setGroundMaintenance:ibuffer];
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setPlayerWages:ibuffer];
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setStaffWages:ibuffer];
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setDividendsOut:ibuffer];
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setBonuses:ibuffer];
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setSigningOnFees:ibuffer];
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setTax:ibuffer];
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setMatchDayExpenses:ibuffer];
		
		// Income
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setGateReceipts:ibuffer];
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setOtherIn:ibuffer];
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setPrizeMoney:ibuffer];
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setSeasonTickets:ibuffer];
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setInterest:ibuffer];
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setInvestments:ibuffer];
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setTVRevenue:ibuffer];
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setMerchandising:ibuffer];
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setSponsorship:ibuffer];
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setMatchDayIncome:ibuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setExcessiveWages:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setStateOfEmergency:cbuffer];
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setCurrentMaximumWage:ibuffer];
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setWeeklyWageTotal:ibuffer];
		
		// ???
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setUnknownInt1:ibuffer];
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setUnknownInt2:ibuffer];
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setUnknownInt3:ibuffer];
		
		// ???
		[object setUnknownDate2:[FMDateLoader readFromData:data atOffset:&offset]];
		
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setPlayersSold:ibuffer];
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setPlayersBought:ibuffer];
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setEstimatedWeeklyMerchandise:ibuffer];
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setWeeklyWageBudget:ibuffer];
		
		[object setThisMonth:[ClubFinanceRecordLoader readFromData:data atOffset:&offset]];
		[object setLastMonth:[ClubFinanceRecordLoader readFromData:data atOffset:&offset]];
		[object setLastYear:[ClubFinanceRecordLoader readFromData:data atOffset:&offset]];
		[object setThisYear:[ClubFinanceRecordLoader readFromData:data atOffset:&offset]];
		
		// ???
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setUnknownInt4:ibuffer];
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setUnknownInt5:ibuffer];
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setUnknownInt6:ibuffer];
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setUnknownInt7:ibuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar3:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar4:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar5:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar6:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar7:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar8:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar9:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar10:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar11:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar12:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar13:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar14:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar15:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar16:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar17:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar32:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar33:cbuffer];
		
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setTransferIncomePercentage:ibuffer];
		
		// ???
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar1:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar2:cbuffer];
		
		[object setLastBudgetIncreaseDate:[FMDateLoader readFromData:data atOffset:&offset]];
		[object setLastSeasonUpdateDate:[FMDateLoader readFromData:data atOffset:&offset]];
		
		// ???
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setUnknownInt8:ibuffer];
		
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		
		NSMutableArray *tempArray = [[NSMutableArray alloc] init];
		for (int i=0;i<cbuffer;i++) {
			[tempArray addObject:[ClubFinanceRecordLoader readFromData:data atOffset:&offset]];
		}
		[object setPastRecords:tempArray];
		[tempArray release];
		
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		tempArray = [[NSMutableArray alloc] init];
		for (int i=0;i<cbuffer;i++) {
			[tempArray addObject:[ClubFinanceRevenueRecordLoader readFromData:data atOffset:&offset]];
		}
		[object setPastRevenueRecords:tempArray];
		[tempArray release];
		
		// ???
		[object setUnknownDate1:[FMDateLoader readFromData:data atOffset:&offset]];
		
		// ???
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar18:cbuffer];
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setUnknownInt9:ibuffer];
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setUnknownInt10:ibuffer];
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setUnknownInt11:ibuffer];
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setUnknownInt12:ibuffer];
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setUnknownInt13:ibuffer];
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setUnknownInt14:ibuffer];
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setUnknownInt15:ibuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar19:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar34:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar35:cbuffer];
		
	}
	
	if ([object type]!=FT_INVALID_TYPE) {
        // FM 2012
        // ??? Jump 0x1 Bytes if current byte is 0x0
        [data getBytes:&cbuffer range:NSMakeRange(offset, 1)];
        if (cbuffer == 0) {
            FmFirst = NO;
            offset += 1;
        }
        
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setBalance:ibuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setSugarDaddy:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setSugarDaddyIncreasesStartingFinances:cbuffer];
		
		// ??? 
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar30:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar31:cbuffer];
        
		[object setTransferEmbargoStartDate:[FMDateLoader readFromData:data atOffset:&offset]];
		[object setTransferEmbargoEndDate:[FMDateLoader readFromData:data atOffset:&offset]];
		[object setTransferEmbargoAppealDate:[FMDateLoader readFromData:data atOffset:&offset]];
		
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setUnknownInt16:ibuffer];
		[object setUnknownDate5:[FMDateLoader readFromData:data atOffset:&offset]];
		
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setAnnualStadiumRental:ibuffer];
		
		// ??? 
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar20:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar21:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar22:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar23:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar24:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar25:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar26:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar27:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar28:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar29:cbuffer];
		
		[data getBytes:&fbuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setAverageMatchTicketPrice:fbuffer];
		[data getBytes:&fbuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setAverageSeasonTicketPrice:fbuffer];
		
		// ??? 
		[data getBytes:&fbuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setUnknownFloat1:fbuffer];
		[data getBytes:&fbuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setUnknownFloat2:fbuffer];
		[data getBytes:&fbuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setUnknownFloat3:fbuffer];
	
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar36:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar37:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar38:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar39:cbuffer];
		
        
        if (FmFirst) {
            [data getBytes:&cbuffer range:NSMakeRange(offset, 2)]; offset += 2;
            for (int i=0; i<cbuffer; i++) {
                offset += 4;
            }
        }
        else {
            offset += 1;
        }
	}
	
	*byteOffset = offset;
	
	return object;
}
@end
