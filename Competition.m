//
//  Competition.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/30.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Competition.h"
#import "GeneralInfo.h"
#import "Continent.h"
#import "Nation.h"
#import "Database.h"

@implementation Competition

@synthesize minPitchLength, minPitchWidth, maxPitchLength, maxPitchWidth, level,
reputation, databaseClass, rowID, UID, continentID, nationID,
northBoundaryCityID, southBoundaryCityID, eastBoundaryCityID, westBoundaryCityID,
name, shortName, threeLetterName, nationalReputation, averageClubReputationAtStart,
leagueBodyClubID, lastHistoryID, historyIndexID, averageClubCashAtStart, colour, rules,
nameGender, shortNameGender, nameType, hasInfos, unknownChar1, unknownChar2, unknownChar3, 
unknownChar4, unknowns, type, flags, unknownChar5, unknownChar6, unknownChar7,
unknownChar8, unknownChar9, unknownChar10, unknownShort1, controller;

- (BOOL)usesSquadNumbers { 
	if (flags & CF_USES_SQUAD_NUMBERS) { return TRUE; } 
	return FALSE; 
}
- (void)setUsesSquadNumbers:(BOOL)val {
	if (flags & CF_USES_SQUAD_NUMBERS) {
		if (!val) { flags = (flags ^ CF_USES_SQUAD_NUMBERS); }
	}
	else { flags = (flags | CF_USES_SQUAD_NUMBERS); }
}
- (BOOL)isExtinct { 
	if (flags & CF_IS_EXTINCT) { return TRUE; } 
	return FALSE; 
}
- (void)setIsExtinct:(BOOL)val {
	if (flags & CF_IS_EXTINCT) {
		if (!val) { flags = (flags ^ CF_IS_EXTINCT); }
	}
	else { flags = (flags | CF_IS_EXTINCT); }
}

- (NSArray *)typeStrings
{
	NSArray *strings = [NSArray arrayWithObjects:
						NSLocalizedString(@"Domestic Top Division", @"competition type"),
						NSLocalizedString(@"Domestic Division", @"competition type"),
						NSLocalizedString(@"Main Cup", @"competition type"),
						NSLocalizedString(@"League Cup", @"competition type"),
						NSLocalizedString(@"Domestic Cup", @"competition type"),
						NSLocalizedString(@"Super Cup", @"competition type"),
						NSLocalizedString(@"International Finals", @"competition type"),
						NSLocalizedString(@"International Qualifiers", @"competition type"),
						NSLocalizedString(@"Reserve Division", @"competition type"),
						NSLocalizedString(@"Club Friendly", @"competition type"),
						NSLocalizedString(@"Main Continental International Finals", @"competition type"),
						NSLocalizedString(@"Main Continental International Quaifiers", @"competition type"),
						NSLocalizedString(@"Club Finals", @"competition type"),
						NSLocalizedString(@"Friendly", @"competition type"),
						NSLocalizedString(@"Domestic Other Division", @"competition type"),
						NSLocalizedString(@"U21 International Finals", @"competition type"),
						NSLocalizedString(@"U21 International Qualifiers", @"competition type"),
						NSLocalizedString(@"U19 International Finals", @"competition type"),
						NSLocalizedString(@"U19 International Qualifiers", @"competition type"),
						NSLocalizedString(@"U23 International Finals", @"competition type"),
						NSLocalizedString(@"U23 International Qualifiers", @"competition type"),
						NSLocalizedString(@"Club Champions Cup", @"competition type"),
						NSLocalizedString(@"Cup Winners Cup", @"competition type"),
						NSLocalizedString(@"Reserve Cup", @"competition type"),
						NSLocalizedString(@"International Friendly", @"competition type"),
						NSLocalizedString(@"U20 International Finals", @"competition type"),
						NSLocalizedString(@"All Stars Cup", @"competition type"),
						NSLocalizedString(@"U20 International Qualifiers", @"competition type"),
						NSLocalizedString(@"Inactive Competition", @"competition type"),
						NSLocalizedString(@"Inactive Other Division", @"competition type"),
						nil];
	return strings;
}

- (NSString *)nationString
{
	if (nationID>-1) { return [[[[[controller database] nations] objectAtIndex:nationID] teamContainer] name]; }
	return @"---";
}
- (NSString *)continentString
{
	if (continentID>-1) { return [[[[controller database] continents] objectAtIndex:continentID] name]; }
	return @"---";
}

@end
