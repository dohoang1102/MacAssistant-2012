//
//  LocalArea.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/04.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "LocalArea.h"


@implementation LocalArea

@synthesize rowID, UID, databaseClass, nationID, languageID, population, name,
shortName, unknownChar1, unknownChar2, unknownChar3, unknownChar4, unknownChar5, unknownChar6, 
unknownChar7, unknownChar8, unknownChar9, unknownChar10, unknownChar11;

- (id)init
{
	[super init];
	
	name = @"---";
	shortName = @"---";
	
	return self;
}

@end
