//
//  City.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/24.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

// inhabitants
#define CII_NOT_SET				0
#define CII_0_1000				1
#define CII_1001_2500			2
#define CII_2501_5000			3
#define CII_5001_10000			4
#define CII_10001_25000			5
#define CII_25001_50000			6
#define CII_50001_100000		7
#define CII_100001_250000		8
#define CII_250001_500000		9
#define CII_500001_1000000		10
#define CII_1000001_2500000		11
#define CII_2500001_5000000		12
#define CII_5000001_10000000	13
#define CII_10000001_20000000	14
#define CII_20000001_OR_OVER	15

#define CII_MAX					15


@interface City : NSObject {
	char databaseClass, nameGender, attraction, citizensNameGender, inhabitants;
	char unknownChar1;
	short altitude;
	int nationID, weatherID, spokenLanguageID, localAreaID, rowID, UID;
	float latitude, longitude;
	
	NSString *name, *citizensName;
}

@property (assign,readwrite) char databaseClass, nameGender, attraction, citizensNameGender, 
inhabitants, unknownChar1;
@property (assign,readwrite) short altitude;
@property (assign,readwrite) int nationID, weatherID, spokenLanguageID, localAreaID, rowID, UID;
@property (assign,readwrite) float latitude, longitude;
@property (copy,readwrite) NSString *name, *citizensName;

- (NSArray *)inhabitantsStrings;

@end
