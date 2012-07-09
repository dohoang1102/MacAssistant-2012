//
//  Media.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/29.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Media.h"

@implementation Media

@synthesize databaseClass, nameGender, period, scope, style, fake,
cityID, localAreaID, continentID, rowID, UID, lastPublishedDate,
competitions, nations, clubs, linkedMedia, name, URL, types,
journalists;

- (NSArray *)styleStrings
{
	NSArray *strings = [NSArray arrayWithObjects:
						NSLocalizedString(@"Not Set", @"general 'not set' option"),
						NSLocalizedString(@"Tabloid", @"media style"),
						NSLocalizedString(@"Broadsheet", @"media style"),
						nil];
	return strings;
}

- (NSArray *)scopeStrings
{
	NSArray *strings = [NSArray arrayWithObjects:
						NSLocalizedString(@"Invalid", @"general 'invalid' option"),
						NSLocalizedString(@"Club", @"media scope"),
						NSLocalizedString(@"Local", @"media scope"),
						NSLocalizedString(@"Regional", @"media scope"),
						NSLocalizedString(@"National", @"media scope"),
						NSLocalizedString(@"Continental", @"media scope"),
						NSLocalizedString(@"Worldwide", @"media scope"),
						NSLocalizedString(@"Competition", @"media scope"),
						nil];
	return strings;
}

- (NSArray *)periodStrings
{
	NSArray *strings = [NSArray arrayWithObjects:
						NSLocalizedString(@"Invalid", @"general 'invalid' option"),
						NSLocalizedString(@"Anytime", @"media period"),
						NSLocalizedString(@"Weekday Morning", @"media period"),
						NSLocalizedString(@"Sunday",nil),
						NSLocalizedString(@"Weekly", @"media period"),
						NSLocalizedString(@"Monthly", @"media period"),
						NSLocalizedString(@"Bi-Monthly", @"media period"),
						NSLocalizedString(@"Quarterly", @"media period"),
						NSLocalizedString(@"Yearly", @"media period"),
						NSLocalizedString(@"Weekday Evening", @"media period"),
						NSLocalizedString(@"Monday",nil),
						NSLocalizedString(@"Tuesday",nil),
						NSLocalizedString(@"Wednesday",nil),
						NSLocalizedString(@"Thursday",nil),
						NSLocalizedString(@"Friday",nil),
						NSLocalizedString(@"Saturday",nil),
						nil];
	return strings;
}

- (NSArray *)typeStrings
{
	NSArray *strings = [NSArray arrayWithObjects:
						NSLocalizedString(@"Not Set", @"general 'not set' option"),
						NSLocalizedString(@"Newspaper", @"media type"),
						NSLocalizedString(@"Magazine", @"media type"),
						NSLocalizedString(@"Fanzine", @"media type"),
						NSLocalizedString(@"Radio", @"media type"),
						NSLocalizedString(@"TV", @"media type"),
						NSLocalizedString(@"Website", @"media type"),
						NSLocalizedString(@"Bookmaker", @"media type"),
						NSLocalizedString(@"Injury Sponsor", @"media type"),
						NSLocalizedString(@"Kit Sponsor", @"media type"),
						nil];
	return strings;
}

@end
