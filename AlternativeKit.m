//
//  AlternativeKit.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/14.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "AlternativeKit.h"

@implementation AlternativeKit

@synthesize kitNumber, type, alternativeKitNumber, year, competitionUID, outfieldKit, colour;

- (NSArray *)kitNumberStrings
{
	NSArray *strings = [NSArray arrayWithObjects:
						NSLocalizedString(@"Home", @"kit type"),
						NSLocalizedString(@"Away", @"kit type"),
						NSLocalizedString(@"Third", @"kit type"),
						nil];
	return strings;
}

- (NSArray *)typeStrings
{
	NSArray *strings = [NSArray arrayWithObjects:
						NSLocalizedString(@"Invalid", @"general 'invalid' option"),
						NSLocalizedString(@"Shirt", @"kit type"),
						NSLocalizedString(@"Icon", @"kit type"),
						NSLocalizedString(@"Text", @"kit type"),
						NSLocalizedString(@"Shorts", @"kit type"),
						NSLocalizedString(@"Socks", @"kit type"),
						nil];
	return strings;
}

@end
