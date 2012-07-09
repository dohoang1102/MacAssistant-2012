//
//  Stadium.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/29.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "FMDate.h"

// pitch type
#define STT_GRASS				1
#define STT_SYNTHETIC_NEW_SOFT	2
#define STT_SYNTHETIC_OLD_HARD	3
#define STT_GRAVEL_CLAY_SAND	4
#define STT_GRAVEL				5
#define STT_CLAY				6
#define STT_SAND				7

// state
#define STS_VERY_GOOD	1
#define STS_GOOD		2
#define STS_AVERAGE		3
#define STS_POOR		4
#define STS_VERY_POOR	5

// deterioration rate
#define SDR_SLOW	1
#define SDR_MEDIUM	2
#define SDR_FAST	3

// used by national team values
#define SNT_NO_MATCHES		0
#define SNT_ALL_MATCHES		1
#define SNT_MAJOR_MATCHES	2
#define SNT_MEDIUM_MATCHES	3
#define SNT_MINOR_MATCHES	4

// stadium flags
#define SF_COVERED						0x01
#define SF_UNDER_SOIL_HEATING			0x02
#define SF_NOT_IN_USE					0x04			// stadium cannot be used at all currently
#define SF_WILL_SOON_BE_NOT_IN_USE		0x08			// stadium will soon be not in use at all
#define SF_STADIUM_NAME_SAVED_LOCALLY	0x10

#define SF_MAX							0x1F

@interface Stadium : NSObject {
	char databaseClass, decay, pitchType, state, usedByU21NationalTeam, usedByNationalTeam, nameGender,
	pitchRecoveryRate, pitchDeteriorationRate;
	unsigned char flags;
	short pitchLength, pitchWidth, minPitchLength, minPitchWidth, maxPitchLength, maxPitchWidth,
	pitchCondition;
	float latitude, longitude;
	int ownerID, capacity, seatingCapacity, expansionCapacity, usedCapacity;
	int allSeaterCompetitionCapacity, rowID, UID, cityID, nearbyStadiumID;
	BOOL extinct;
	FMDate *buildDate, *unknownDate1, *pitchLastRelaidDate, *pitchRelayRequiredDate;
	NSData *unknownData1, *unknownData2;
	NSString *name;
}

@property(assign,readwrite) char databaseClass, decay, pitchType, state, usedByU21NationalTeam, usedByNationalTeam,
nameGender, pitchRecoveryRate, pitchDeteriorationRate;
@property(assign,readwrite) unsigned char flags;
@property(assign,readwrite) short pitchLength, pitchWidth, minPitchLength, minPitchWidth, maxPitchLength, maxPitchWidth, 
pitchCondition;
@property(assign,readwrite) int ownerID, capacity, seatingCapacity, expansionCapacity, usedCapacity, 
allSeaterCompetitionCapacity, rowID, UID, nearbyStadiumID, cityID;
@property(assign,readwrite) float latitude, longitude;
@property(assign,readwrite) BOOL extinct;
@property(assign,readwrite) FMDate *buildDate, *unknownDate1, *pitchLastRelaidDate, *pitchRelayRequiredDate;
@property(readwrite,copy) NSData *unknownData1, *unknownData2;
@property(copy,readwrite) NSString *name;

- (NSArray *)usedByNationalTeamStrings;
- (NSArray *)pitchTypeStrings;
- (NSArray *)stateStrings;
- (NSArray *)pitchDeteriorationRateStrings;

@end
