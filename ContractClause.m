//
//  ContractClause.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/20.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ContractClause.h"


@implementation ContractClause

@synthesize fee, type, info;

- (NSArray *)typeStrings
{
	NSArray *strings = [NSArray arrayWithObjects:
						NSLocalizedString(@"Minimum Fee Release",@"contract clause"),
						NSLocalizedString(@"Relegation Release",@"contract clause"),
						NSLocalizedString(@"Non-Promotion Release",@"contract clause"),
						NSLocalizedString(@"Yearly Wage Rise (%)",@"contract clause"),
						NSLocalizedString(@"Promotion Wage Increase (%)",@"contract clause"),
						NSLocalizedString(@"Relegation Wage Decrease (%)",@"contract clause"),
						NSLocalizedString(@"Manager/Coach Job Release",@"contract clause"),
						NSLocalizedString(@"Unknown Type - 7",@"contract clause"),
						NSLocalizedString(@"Sell On Fee (%)",@"contract clause"),
						NSLocalizedString(@"Sell On Fee Profit (%)",@"contract clause"),
						NSLocalizedString(@"Seasonal Landmark Goal Bonus",@"contract clause"),
						NSLocalizedString(@"One Year Extension After League Games (Final Season)",@"contract clause"),
						NSLocalizedString(@"Match Highest Earner",@"contract clause"),
						NSLocalizedString(@"Wage After Reaching Club Career League Games",@"contract clause"),
						NSLocalizedString(@"Top Division Promotion Wage Rise (%)",@"contract clause"),
						NSLocalizedString(@"Top Division Relegation Wage Drop (%)",@"contract clause"),
						NSLocalizedString(@"Minimum Fee Release (Foreign Clubs)",@"contract clause"),
						NSLocalizedString(@"Minimum Fee Release (Higher Division Clubs)",@"contract clause"),
						nil];
	return strings;
}

@end
