//
//  ClubSponsor.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/26.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ClubSponsor.h"


@implementation ClubSponsor

@synthesize startDate, endDate, cash, type, name, fixedValue, renewIncome, unknownChar1, 
unknownChar2, unknownChar3;

- (NSArray *)typeStrings
{
	NSArray *strings = [NSArray arrayWithObjects:
						NSLocalizedString(@"Invalid", @"general 'invalid' option"),
						NSLocalizedString(@"Main Kit Sponsor", @"club sponsor type"),
						NSLocalizedString(@"Government Council Grant", @"club sponsor type"),
						NSLocalizedString(@"Stadium Sponsor", @"club sponsor type"),
						NSLocalizedString(@"General Sponsor", @"club sponsor type"),
						NSLocalizedString(@"Individual TV Deal", @"club sponsor type"),
						NSLocalizedString(@"Other Income", @"club sponsor type"),
						NSLocalizedString(@"Club Membership", @"club sponsor type"),
						NSLocalizedString(@"Additional Kit Sponsor", @"club sponsor type"),
						nil];
	return strings;
}

@end
