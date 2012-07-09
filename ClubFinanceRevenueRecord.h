//
//  ClubFinanceRevenueRecord.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/14.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface ClubFinanceRevenueRecord : NSObject {
	int profitLoss, seasonTransferBudget, remainingTransferBudget, totalWageBudget, currentWageTotal;
}

@property(readwrite,assign) int profitLoss, seasonTransferBudget, remainingTransferBudget, totalWageBudget, currentWageTotal;

@end
