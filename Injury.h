//
//  Injury.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/31.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

// category
#define IC_ANY				-1
#define IC_INTERNAL			0
#define IC_FOOT				1
#define IC_SHIN				2
#define IC_KNEE				3
#define IC_THIGH			4
#define IC_GROIN			5
#define IC_UPPER_BODY		6
#define IC_HAND				7
#define IC_ARM				8
#define IC_SHOULDER			9
#define IC_NECK				10
#define IC_HEAD				11
#define IC_REHABILITATION	12

// cause
#define ICA_INVALID				0
#define ICA_IMPACT_WITH_PLAYER	1
#define ICA_FALL_IMPACT			2
#define ICA_LIFTING_WEIGHTS		3
#define ICA_TURNING_SHARPLY		4
#define ICA_SPRINTING			5
#define ICA_JUMPING				6
#define ICA_WEAR_AND_TEAR		7
#define ICA_KICKING_BALL		8
#define ICA_CATCHING_BALL		9

// seriousness
#define IS_INVALID							0
#define IS_POTENTIALLY_CAREER_THREATENING	1
#define IS_SERIOUS_INJURY					2
#define IS_MODERATE_INJURY					3
#define IS_MINOR_INJURY						4
#define IS_WALKING_WOUNDED					5

// age rule
#define IAR_OVER_28	1
#define IAR_ANY		2

// season
#define ISE_ANY		1
#define ISE_SUMMER	2
#define ISE_WINTER	3

// treatment flags
#define ITF_PHYSIO		0x01
#define ITF_SPECIALIST	0x02
#define ITF_INJECTION	0x04
#define ITF_ISOLATION	0x08

@interface Injury : NSObject {
	char databaseClass, category, inactiveRatio, matchInjuryPercentage, cause;
	char ageRule, season, seriousness, goalkeeperPercentage, centralDefenderPercentage;
	char nameGender, sentenceNameGender;
	unsigned char treatmentFlags;
	short minimumDays, extraDays;
	BOOL recurring, contagious;
	int rowID, UID;
	float occurrenceRatio;
	
	NSString *name, *sentenceName;
}

@property(assign,readwrite) char databaseClass, category, inactiveRatio, matchInjuryPercentage, cause,
ageRule, season, seriousness, goalkeeperPercentage, centralDefenderPercentage, nameGender, sentenceNameGender;
@property(assign,readwrite) unsigned char treatmentFlags;
@property(assign,readwrite) short minimumDays, extraDays;
@property(assign,readwrite) BOOL recurring, contagious;
@property(assign,readwrite) int rowID, UID;
@property(assign,readwrite) float occurrenceRatio;
@property(copy,readwrite) NSString *name, *sentenceName;

- (BOOL)isolationTreatment;
- (BOOL)injectionTreatment;
- (BOOL)physioTreatment;
- (BOOL)specialistTreatment;

- (NSArray *)categoryStrings;
- (NSArray *)causeStrings;
- (NSArray *)seriousnessStrings;
- (NSArray *)seasonStrings;
- (NSArray *)ageRuleStrings;

@end
