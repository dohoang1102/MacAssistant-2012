//
//  ClubFinanceRevenueRecordSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/23.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ClubFinanceRevenueRecordSaver.h"

@implementation ClubFinanceRevenueRecordSaver

+ (void)saveRecord:(ClubFinanceRevenueRecord *)object toData:(NSMutableData *)data
{
	int ibuffer;
	
	ibuffer = [object profitLoss];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object seasonTransferBudget];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object remainingTransferBudget];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object totalWageBudget];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object currentWageTotal];
	[data appendBytes:&ibuffer length:4];
}

@end
