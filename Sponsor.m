//
//  Sponsor.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/24.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Sponsor.h"

@implementation Sponsor

@synthesize databaseClass, nameGender, businessNameGender, businessType, name, businessName,
rowID, UID;

- (NSArray *)typeStrings
{
	NSArray *strings = [NSArray arrayWithObjects:
						NSLocalizedString(@"Local", @"sponsor business type"),
						NSLocalizedString(@"Regional", @"sponsor business type"),
						NSLocalizedString(@"National", @"sponsor business type"),
						NSLocalizedString(@"International", @"sponsor business type"),
						nil];
	return strings;
}

@end
