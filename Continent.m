//
//  Continent.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/31.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Continent.h"

@implementation Continent

@synthesize databaseClass, nameGender, federationNameGender, shortFederationNameGender,
regionalStrength, continentSelected, rowID, UID, name, threeLetterName, continentialityName, 
federationName, federationShortName, infos, hasInfos, unknownChar1;

- (id)init
{
	[super init];
	
	name = @"---";
	threeLetterName = @"---";
	continentialityName = @"---";
	federationName = @"---";
	federationShortName = @"---";
	
	return self;
}

@end
