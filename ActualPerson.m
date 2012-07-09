//
//  ActualPerson.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/20.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ActualPerson.h"

@implementation ActualPerson

@synthesize ethnicity, hairColour, skinTone, hasRelationships, firstNameID, surnameID, 
commonNameID, nationID, personStatsID, cityOfBirthID, dateOfBirth, relationships, nicknames,
fullName, flags, unknownDate1, unknownData1, unknowns1, locationDays;

- (BOOL)male { 
	if (flags & APF_FEMALE) { return FALSE; } 
	
	return TRUE; 
}

- (BOOL)female { 
	if (flags & APF_FEMALE) { return TRUE; } 
	
	return FALSE; 
}
- (void)setFemale:(BOOL)val {
	if (flags & APF_FEMALE) {
		if (!val) { flags = (flags ^ APF_FEMALE); }
	}
	else { flags = (flags | APF_FEMALE); }
}

- (NSArray *)ethnicityStrings
{
	NSArray *strings = [NSArray arrayWithObjects:
						NSLocalizedString(@"Northern European", @"ethnicity"),
						NSLocalizedString(@"Mediterranean Hispanic", @"ethnicity"),
						NSLocalizedString(@"North African / Middle-Eastern", @"ethnicity"),
						NSLocalizedString(@"African / Caribbean", @"ethnicity"),
						NSLocalizedString(@"Asian", @"ethnicity"),
						NSLocalizedString(@"South-East Asian", @"ethnicity"),
						NSLocalizedString(@"Pacific Islander", @"ethnicity"),
						NSLocalizedString(@"Native American", @"ethnicity"),
						NSLocalizedString(@"Native Australian", @"ethnicity"),
						NSLocalizedString(@"Mixed Race (Black/White)", @"ethnicity"),
						nil];
	return strings;
}

- (NSArray *)hairColourStrings
{
	NSArray *strings = [NSArray arrayWithObjects:
						NSLocalizedString(@"Unknown", @"hair colour"),
						NSLocalizedString(@"Blonde", @"hair colour"),
						NSLocalizedString(@"Light Brown", @"hair colour"),
						NSLocalizedString(@"Dark Brown", @"hair colour"),
						NSLocalizedString(@"Red", @"hair colour"),
						NSLocalizedString(@"Black", @"hair colour"),
						NSLocalizedString(@"Grey", @"hair colour"),
						NSLocalizedString(@"Bald", @"hair colour"),
						nil];
	return strings;
}

- (NSArray *)skinToneStrings
{
	NSArray *strings = [NSArray arrayWithObjects:
						NSLocalizedString(@"Skin Tone 1",nil),
						NSLocalizedString(@"Skin Tone 2",nil),
						NSLocalizedString(@"Skin Tone 3",nil),
						NSLocalizedString(@"Skin Tone 4",nil),
						NSLocalizedString(@"Skin Tone 5",nil),
						NSLocalizedString(@"Skin Tone 6",nil),
						NSLocalizedString(@"Skin Tone 7",nil),
						NSLocalizedString(@"Skin Tone 8",nil),
						NSLocalizedString(@"Skin Tone 9",nil),
						NSLocalizedString(@"Skin Tone 10",nil),
						NSLocalizedString(@"Skin Tone 11",nil),
						NSLocalizedString(@"Skin Tone 12",nil),
						NSLocalizedString(@"Skin Tone 13",nil),
						NSLocalizedString(@"Skin Tone 14",nil),
						NSLocalizedString(@"Skin Tone 15",nil),
						NSLocalizedString(@"Skin Tone 16",nil),
						NSLocalizedString(@"Skin Tone 17",nil),
						NSLocalizedString(@"Skin Tone 18",nil),
						NSLocalizedString(@"Skin Tone 19",nil),
						NSLocalizedString(@"Skin Tone 20",nil),
						nil];
	return strings;
}

- (BOOL)isRegen 
{
	if (flags & APF_REGEN) { return TRUE; } 
	
	return FALSE;
}

@end
