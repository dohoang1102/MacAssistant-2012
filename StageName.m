//
//  StageName.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/04.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "StageName.h"


@implementation StageName

@synthesize rowID, UID, nameGender, databaseClass, name, shortName, pluralName;

- (id)init
{
	[super init];
	
	name = @"---";
	shortName = @"---";
	pluralName = @"---";
	
	return self;
}

@end
