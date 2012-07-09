//
//  NonPlayerStats.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/04.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "NonPlayerStats.h"


@implementation NonPlayerStats

@synthesize rowID, UID, databaseClass, attacking, business, coachingTechnique, directness, levelOfDiscipline,
freeRoles, interference, marking, offside, patience, pressing, resources, workingWithYoungsters,
determination, buyingPlayers, mindGames, sittingBack, useOfPlaymaker, useOfSubs, depth,
flamboyancy, flexibility, hardnessOfTraining, squadRotation, tempo, width, coachingOutfieldPlayers,
coachingGoalkeepers, judgingPlayerAbility, judgingPlayerPotential, manManagement, motivating,
physiotherapy, tacticalKnowledge, coachingAttacking, coachingDefending, coachingFitness,
coachingMental, coachingTechnical, coachingTactical, dirtinessAllowance;

- (IBAction)maxStats
{
	
	[self setCoachingAttacking:100];
	[self setCoachingDefending:100];
	[self setCoachingFitness:100];
	[self setCoachingGoalkeepers:100];
	[self setManManagement:100];
	[self setCoachingMental:100];
	[self setCoachingOutfieldPlayers:100];
	[self setCoachingTactical:100];
	[self setCoachingTechnical:100];
	[self setWorkingWithYoungsters:100];
	[self setCoachingTechnique:20];
	[self setDetermination:100];
	[self setJudgingPlayerAbility:100];
	[self setJudgingPlayerPotential:100];
	[self setMotivating:100];
	[self setPhysiotherapy:100];
	[self setTacticalKnowledge:100];
	[self setBusiness:20];
	[self setBuyingPlayers:20];
	[self setHardnessOfTraining:10];
	[self setInterference:20];
	[self setLevelOfDiscipline:20];
	[self setMindGames:20];
	[self setPatience:20];
	[self setResources:20];
}

- (NSImage *)coachTotalToRating1:(int)total
{
	if (total>269) { return [NSImage imageNamed:@"10star.png"]; }
	else if (total>239) { return [NSImage imageNamed:@"9star.png"]; }
	else if (total>209) { return [NSImage imageNamed:@"8star.png"]; }
	else if (total>179) { return [NSImage imageNamed:@"7star.png"]; }
	else if (total>149) { return [NSImage imageNamed:@"6star.png"]; }
	else if (total>119) { return [NSImage imageNamed:@"5star.png"]; }
	else if (total>89) { return [NSImage imageNamed:@"4star.png"]; }
	else if (total>59) { return [NSImage imageNamed:@"3star.png"]; }
	else if (total>29) { return [NSImage imageNamed:@"2star.png"]; }
	else { return [NSImage imageNamed:@"1star.png"]; }
}

- (NSImage *)coachTotalToRating2:(int)total
{
	if (total>359) { return [NSImage imageNamed:@"10star.png"]; }
	else if (total>319) { return [NSImage imageNamed:@"9star.png"]; }
	else if (total>279) { return [NSImage imageNamed:@"8star.png"]; }
	else if (total>239) { return [NSImage imageNamed:@"7star.png"]; }
	else if (total>199) { return [NSImage imageNamed:@"6star.png"]; }
	else if (total>159) { return [NSImage imageNamed:@"5star.png"]; }
	else if (total>119) { return [NSImage imageNamed:@"4star.png"]; }
	else if (total>79) { return [NSImage imageNamed:@"3star.png"]; }
	else if (total>39) { return [NSImage imageNamed:@"2star.png"]; }
	else { return [NSImage imageNamed:@"1star.png"]; }
}

- (NSImage *)coachTotalToRating3:(int)total
{
	if (total>89) { return [NSImage imageNamed:@"10star.png"]; }
	else if (total>79) { return [NSImage imageNamed:@"9star.png"]; }
	else if (total>69) { return [NSImage imageNamed:@"8star.png"]; }
	else if (total>59) { return [NSImage imageNamed:@"7star.png"]; }
	else if (total>49) { return [NSImage imageNamed:@"6star.png"]; }
	else if (total>39) { return [NSImage imageNamed:@"5star.png"]; }
	else if (total>29) { return [NSImage imageNamed:@"4star.png"]; }
	else if (total>19) { return [NSImage imageNamed:@"3star.png"]; }
	else if (total>9) { return [NSImage imageNamed:@"2star.png"]; }
	else { return [NSImage imageNamed:@"1star.png"]; }
}

- (NSImage *)strengthRating
{
	int DDM = (determination / 5) + (levelOfDiscipline / 5) + (motivating / 5);
	int rating = (DDM * 2) + ((coachingFitness / 5) * 9);
	
	return [self coachTotalToRating1:rating];
}
- (NSImage *)aerobicsRating
{
	int DDM = (determination / 5) + (levelOfDiscipline / 5) + (motivating / 5);
	int rating = (DDM * 2) + ((coachingFitness / 5) * 9);
	
	return [self coachTotalToRating1:rating];
}
- (NSImage *)goalkeepingRating
{
	int DDM = (determination / 5) + (levelOfDiscipline / 5) + (motivating / 5);
	int rating = DDM + ((coachingGoalkeepers / 5) * 2);
	
	return [self coachTotalToRating3:rating];
}
- (NSImage *)tacticsRating
{
	int DDM = (determination / 5) + (levelOfDiscipline / 5) + (motivating / 5);
	int rating = DDM + ((coachingTactical / 5) * 2);
	
	return [self coachTotalToRating3:rating];
}
- (NSImage *)ballControlRating
{
	int DDM = (determination / 5) + (levelOfDiscipline / 5) + (motivating / 5);
	int rating = (DDM * 2) + ((coachingTechnical / 5) * 6) + ((coachingMental / 5) * 3);
	
	return [self coachTotalToRating1:rating];
}

- (NSImage *)defendingRating
{
	int DDM = (determination / 5) + (levelOfDiscipline / 5) + (motivating / 5);
	int rating = ((coachingDefending / 5) * 8) + (((coachingTactical / 5) + DDM) * 3);
	
	return [self coachTotalToRating2:rating];
}
- (NSImage *)attackingRating
{
	int DDM = (determination / 5) + (levelOfDiscipline / 5) + (motivating / 5);
	int rating = (DDM * 2) + ((coachingAttacking / 5) * 6) + ((coachingTactical / 5) * 3);
	
	return [self coachTotalToRating1:rating];
}
- (NSImage *)shootingRating
{
	int DDM = (determination / 5) + (levelOfDiscipline / 5) + (motivating / 5);
	int rating = (DDM * 2) + ((coachingTechnical / 5) * 6) + ((coachingAttacking / 5) * 3);
	
	return [self coachTotalToRating1:rating];
}
- (NSImage *)setPiecesRating
{
	int DDM = (determination / 5) + (levelOfDiscipline / 5) + (motivating / 5);
	int rating = (DDM * 2) + (((coachingAttacking / 5) + (coachingMental / 5) + (coachingTechnical / 5)) * 3);
	
	return [self coachTotalToRating1:rating];
}

@end
