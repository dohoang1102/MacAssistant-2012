//
//  StadiumChange.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/04.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "StadiumChange.h"


@implementation StadiumChange

@synthesize rowID, UID, databaseClass, alternativeStadiumID, oldStadiumID, 
newStadiumID, teamID, newCapacity, leaveDate, moveInDate, oldStadium, 
alternativeStadium, theNewStadium, name, type, unknownData1;

- (id)init
{
	[super init];
	
	name = @"---";
	
	return self;
}

- (NSArray *)typeStrings
{
	NSArray *strings = [NSArray arrayWithObjects:
						NSLocalizedString(@"Invalid", @"general 'invalid' option"),
						NSLocalizedString(@"Stadium Change", @"stadium change type"),
						NSLocalizedString(@"Capacity Change", @"stadium change type"),
						nil];
	return strings;
}

@end
