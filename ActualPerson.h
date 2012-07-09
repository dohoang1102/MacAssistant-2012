//
//  ActualPerson.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/20.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "FMDate.h"

// ethinicity
#define PEE_UNKNOWN							-1
#define PEE_NORTHERN_EUROPEAN				0
#define PEE_MEDITERRANEAN_HISPANIC			1
#define PEE_NORTH_AFRICAN_MIDDLE_EASTERN	2
#define PEE_AFRICAN_CARIBBEAN				3
#define PEE_ASIAN							4
#define PEE_SOUTH_EAST_ASIAN				5
#define PEE_PACIFIC_ISLANDER				6
#define PEE_NATIVE_AMERICAN					7
#define PEE_NATIVE_AUSTRALIAN				8
#define PEE_MIXED_RACE_BLACK_WHITE			9

// hair colour
#define PHC_UNKNOWN		0
#define PHC_BLONDE		1
#define PHC_LIGHT_BROWN	2
#define PHC_DARK_BROWN	3
#define PHC_RED			4
#define PHC_BLACK		5
#define PHC_GREY		6
#define PHC_BALD		7

// skin tone
#define PEST_UNKNOWN		-1
#define PEST_SKIN_TONE_1	0
#define PEST_SKIN_TONE_2	1
#define PEST_SKIN_TONE_3	2
#define PEST_SKIN_TONE_4	3
#define PEST_SKIN_TONE_5	4
#define PEST_SKIN_TONE_6	5
#define PEST_SKIN_TONE_7	6
#define PEST_SKIN_TONE_8	7
#define PEST_SKIN_TONE_9	8
#define PEST_SKIN_TONE_10	9
#define PEST_SKIN_TONE_11	10
#define PEST_SKIN_TONE_12	11
#define PEST_SKIN_TONE_13	12
#define PEST_SKIN_TONE_14	13
#define PEST_SKIN_TONE_15	14
#define PEST_SKIN_TONE_16	15
#define PEST_SKIN_TONE_17	16
#define PEST_SKIN_TONE_18	17
#define PEST_SKIN_TONE_19	18
#define PEST_SKIN_TONE_20	19

// flags
#define	APF_FEMALE		0x00100000
#define	APF_REGEN		0x00000800

@interface ActualPerson : NSObject {
	char ethnicity, hairColour, skinTone;
	BOOL hasRelationships;
	int firstNameID, surnameID, commonNameID, nationID, personStatsID, cityOfBirthID;
	unsigned int flags;
	FMDate *dateOfBirth, *unknownDate1;
	NSData *unknownData1;
	NSMutableArray *relationships, *nicknames, *unknowns1, *locationDays;
	NSString *fullName;
}

- (NSArray *)skinToneStrings;
- (NSArray *)hairColourStrings;
- (NSArray *)ethnicityStrings;

@property(readwrite,assign) char ethnicity, hairColour, skinTone;
@property(readwrite,assign) unsigned int flags;
@property(readwrite,assign) BOOL hasRelationships;
@property(readwrite,assign) int firstNameID, surnameID, commonNameID, nationID, personStatsID, cityOfBirthID;
@property(readwrite,assign) FMDate *dateOfBirth, *unknownDate1;
@property(readwrite,copy) NSMutableArray *relationships, *nicknames, *unknowns1, *locationDays;
@property(readwrite,copy) NSData *unknownData1;
@property(readwrite,copy) NSString *fullName;

- (BOOL)isRegen;
- (BOOL)male;
- (BOOL)female;
- (void)setFemale:(BOOL)val;

@end
