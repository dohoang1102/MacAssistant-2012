//
//  Injury.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/31.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Injury.h"


@implementation Injury

@synthesize databaseClass, category, inactiveRatio, matchInjuryPercentage, cause,
ageRule, season, seriousness, goalkeeperPercentage, centralDefenderPercentage,
treatmentFlags, minimumDays, extraDays, recurring, contagious, rowID, UID,
occurrenceRatio, name, sentenceName, nameGender, sentenceNameGender;

- (id)init
{
	[super init];
	
	name = @"---";
	sentenceName = @"---";

	return self;
}

- (NSArray *)ageRuleStrings
{
	NSArray *strings = [NSArray arrayWithObjects:
						NSLocalizedString(@"Invalid", @"general 'invalid' option"),
						NSLocalizedString(@"Over 28", @"injury age rule"),
						NSLocalizedString(@"Any", @"general 'any' option"),
						nil];
	return strings;
}

- (NSArray *)seasonStrings
{
	NSArray *strings = [NSArray arrayWithObjects:
						NSLocalizedString(@"Invalid", @"general 'invalid' option"),
						NSLocalizedString(@"Any", @"general 'any' option"),
						NSLocalizedString(@"Summer", @"injury season"),
						NSLocalizedString(@"Winter", @"injury season"),
						nil];
	return strings;
}

- (NSArray *)seriousnessStrings
{
	NSArray *strings = [NSArray arrayWithObjects:
						NSLocalizedString(@"Invalid", @"general 'invalid' option"),
						NSLocalizedString(@"Potentially Career Threatening", @"injury seriousness"),
						NSLocalizedString(@"Serious Injury", @"injury seriousness"),
						NSLocalizedString(@"Moderate Injury", @"injury seriousness"),
						NSLocalizedString(@"Minor Injury", @"injury seriousness"),
						NSLocalizedString(@"Walking Wounded", @"injury seriousness"),
						nil];
	return strings;
}

- (NSArray *)causeStrings
{
	NSArray *strings = [NSArray arrayWithObjects:
						NSLocalizedString(@"Invalid", @"general 'invalid' option"),
						NSLocalizedString(@"Impact With Player", @"injury cause"),
						NSLocalizedString(@"Fall Impact", @"injury cause"),
						NSLocalizedString(@"Lifting Weights", @"injury cause"),
						NSLocalizedString(@"Turning Sharply", @"injury cause"),
						NSLocalizedString(@"Sprinting", @"injury cause"),
						NSLocalizedString(@"Jumping", @"injury cause"),
						NSLocalizedString(@"Wear And Tear", @"injury cause"),
						NSLocalizedString(@"Kicking Ball", @"injury cause"),
						NSLocalizedString(@"Catching Ball", @"injury cause"),
						nil];
	return strings;
}

- (NSArray *)categoryStrings
{
	NSArray *strings = [NSArray arrayWithObjects:
						NSLocalizedString(@"Internal", @"injury category"),
						NSLocalizedString(@"Foot", @"injury category"),
						NSLocalizedString(@"Shin", @"injury category"),
						NSLocalizedString(@"Knee", @"injury category"),
						NSLocalizedString(@"Thigh", @"injury category"),
						NSLocalizedString(@"Groin", @"injury category"),
						NSLocalizedString(@"Upper Body", @"injury category"),
						NSLocalizedString(@"Hand", @"injury category"),
						NSLocalizedString(@"Arm", @"injury category"),
						NSLocalizedString(@"Shoulder", @"injury category"),
						NSLocalizedString(@"Neck", @"injury category"),
						NSLocalizedString(@"Head", @"injury category"),
						NSLocalizedString(@"Rehabilitation", @"injury category"),
						nil];
	return strings;
}

- (BOOL)isolationTreatment { 
	if (treatmentFlags & ITF_ISOLATION) { return TRUE; } 
	return FALSE; 
}
- (void)setIsolationTreatment:(BOOL)val {
	if (treatmentFlags & ITF_ISOLATION) {
		if (!val) { treatmentFlags = (treatmentFlags ^ ITF_ISOLATION); }
	}
	else { treatmentFlags = (treatmentFlags | ITF_ISOLATION); }
}

- (BOOL)injectionTreatment { 
	if (treatmentFlags & ITF_INJECTION) { return TRUE; } 
	return FALSE; 
}
- (void)setInjectionTreatment:(BOOL)val {
	if (treatmentFlags & ITF_INJECTION) {
		if (!val) { treatmentFlags = (treatmentFlags ^ ITF_INJECTION); }
	}
	else { treatmentFlags = (treatmentFlags | ITF_INJECTION); }
}

- (BOOL)physioTreatment { 
	if (treatmentFlags & ITF_PHYSIO) { return TRUE; } 
	return FALSE; 
}
- (void)setPhysioTreatment:(BOOL)val {
	if (treatmentFlags & ITF_PHYSIO) {
		if (!val) { treatmentFlags = (treatmentFlags ^ ITF_PHYSIO); }
	}
	else { treatmentFlags = (treatmentFlags | ITF_PHYSIO); }
}

- (BOOL)specialistTreatment { 
	if (treatmentFlags & ITF_SPECIALIST) { return TRUE; } 
	return FALSE; 
}
- (void)setSpecialistTreatment:(BOOL)val {
	if (treatmentFlags & ITF_SPECIALIST) {
		if (!val) { treatmentFlags = (treatmentFlags ^ ITF_SPECIALIST); }
	}
	else { treatmentFlags = (treatmentFlags | ITF_SPECIALIST); }
}

@end
