//
//  ClubFinanceRevenueRecordLoader.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/14.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ClubFinanceRevenueRecordLoader.h"


@implementation ClubFinanceRevenueRecordLoader

+ (ClubFinanceRevenueRecord *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset
{
	int ibuffer;
	
	unsigned int offset = *byteOffset;
	
	ClubFinanceRevenueRecord *object = [[ClubFinanceRevenueRecord alloc] init];
	
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setProfitLoss:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setSeasonTransferBudget:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setRemainingTransferBudget:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setTotalWageBudget:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setCurrentWageTotal:ibuffer];
	
	*byteOffset = offset;
	
	return object;
}

@end
