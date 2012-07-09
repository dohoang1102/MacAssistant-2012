//
//  ClubFinanceRecordSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/23.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ClubFinanceRecordSaver.h"

@implementation ClubFinanceRecordSaver

+ (void)saveRecord:(ClubFinanceRecord *)object toData:(NSMutableData *)data
{
	int ibuffer;
	
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
	ibuffer = [object playersBought];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object tax];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object matchDayExpenses];
	[data appendBytes:&ibuffer length:4];
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
	ibuffer = [object playersSold];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object sponsorship];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object matchDayIncome];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object fundRaising];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object unknownInt1];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object renewalSigningOnFees];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object grants];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object nonFootballCosts];
	[data appendBytes:&ibuffer length:4];
}

@end
