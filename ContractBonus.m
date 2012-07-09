//
//  ContractBonus.m
//  FM11SX
//
//  Created by Amy Kettlewell on 10/11/15.
//  Copyright 2010 littleblue. All rights reserved.
//

#import "ContractBonus.h"

@implementation ContractBonus

@synthesize type, fee;

- (NSArray *)typeStrings
{
	NSArray *strings = [NSArray arrayWithObjects:
						NSLocalizedString(@"Appearance Fee",@"contract bonus type"),
						NSLocalizedString(@"Goal Bonus",@"contract bonus type"),
						NSLocalizedString(@"Clean Sheet Bonus",@"contract bonus type"),
						NSLocalizedString(@"Team Of The Year Bonus (Division)",@"contract bonus type"),
						nil];
	return strings;
}

@end
