//
//  Currency.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/31.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Currency.h"


@implementation Currency

@synthesize exchangeRate, approxExchangeRate, veryApproxExchangeRate, rowID, UID,
name, shortName, symbol, threeLetterName, databaseClass;

- (id)init
{
	[super init];
	
	name = @"---";
	shortName = @"---";
	threeLetterName = @"---";
	symbol = @"---";
	
	return self;
}

@end
