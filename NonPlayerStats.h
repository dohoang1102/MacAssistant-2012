//
//  NonPlayerStats.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/04.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface NonPlayerStats : NSObject {
	char databaseClass, attacking, business, coachingTechnique, directness, levelOfDiscipline,
		 freeRoles, interference, marking, offside, patience, pressing, resources, workingWithYoungsters,
		 determination, buyingPlayers, mindGames, sittingBack, useOfPlaymaker, useOfSubs, depth,
		 flamboyancy, flexibility, hardnessOfTraining, squadRotation, tempo, width, coachingOutfieldPlayers,
		 coachingGoalkeepers, judgingPlayerAbility, judgingPlayerPotential, manManagement, motivating,
		 physiotherapy, tacticalKnowledge, coachingAttacking, coachingDefending, coachingFitness,
		 coachingMental, coachingTechnical, coachingTactical, dirtinessAllowance;
	int rowID, UID;
}

@property(assign,readwrite) char databaseClass, attacking, business, coachingTechnique, directness, levelOfDiscipline,
freeRoles, interference, marking, offside, patience, pressing, resources, workingWithYoungsters,
determination, buyingPlayers, mindGames, sittingBack, useOfPlaymaker, useOfSubs, depth,
flamboyancy, flexibility, hardnessOfTraining, squadRotation, tempo, width, coachingOutfieldPlayers,
coachingGoalkeepers, judgingPlayerAbility, judgingPlayerPotential, manManagement, motivating,
physiotherapy, tacticalKnowledge, coachingAttacking, coachingDefending, coachingFitness,
coachingMental, coachingTechnical, coachingTactical, dirtinessAllowance;
@property(assign,readwrite) int rowID, UID;

- (IBAction)maxStats;

- (NSImage *)strengthRating;
- (NSImage *)aerobicsRating;
- (NSImage *)goalkeepingRating;
- (NSImage *)tacticsRating;
- (NSImage *)ballControlRating;
- (NSImage *)defendingRating;
- (NSImage *)attackingRating;
- (NSImage *)shootingRating;
- (NSImage *)setPiecesRating;

- (NSImage *)coachTotalToRating1:(int)total;
- (NSImage *)coachTotalToRating2:(int)total;
- (NSImage *)coachTotalToRating3:(int)total;

@end
