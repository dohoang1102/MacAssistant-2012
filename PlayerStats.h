//
//  PlayerStats.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/04.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface PlayerStats : NSObject {
	char databaseClass, goalkeeper, sweeper, defender, defensiveMidfielder, midfielder, attackingMidfielder,
		 forward, wingBack, freeRole, rightSide, leftSide, central, leftDefender, centralDefender, rightDefender,
		 centralDefensiveMidfielder, leftMidfielder, centralMidfielder, rightMidfielder, leftAttackingMidfielder,
		 centralAttackingMidfielder, rightAttackingMidfielder, centreForward, leftWingBack, rightWingBack, crossing,
		 dribbling, finishing, heading, longShots, marking, offTheBall, passing, penalties, tackling, creativity,
		 handling, aerialAbility, commandOfArea, communication, kicking, throwing, anticipation, decisions, oneOnOnes,
		 positioning, reflexes, firstTouch, technique, leftFoot, rightFoot, flair, corners, teamwork, workRate,
		 longThrows, eccentricity, rushingOut, tendencyToPunch, acceleration, freeKicks, strength, stamina, pace,
		 jumping, influence, dirtiness, balance, bravery, consistency, aggression, agility, importantMatches,
		 injuryProneness, versatility, naturalFitness, determination, composure, concentration, unknownChar1;
	int rowID, UID;
}

@property(assign,readwrite) char databaseClass, goalkeeper, sweeper, defender, defensiveMidfielder, midfielder, attackingMidfielder,
forward, wingBack, freeRole, rightSide, leftSide, central, leftDefender, centralDefender, rightDefender,
centralDefensiveMidfielder, leftMidfielder, centralMidfielder, rightMidfielder, leftAttackingMidfielder,
centralAttackingMidfielder, rightAttackingMidfielder, centreForward, leftWingBack, rightWingBack, crossing,
dribbling, finishing, heading, longShots, marking, offTheBall, passing, penalties, tackling, creativity,
handling, aerialAbility, commandOfArea, communication, kicking, throwing, anticipation, decisions, oneOnOnes,
positioning, reflexes, firstTouch, technique, leftFoot, rightFoot, flair, corners, teamwork, workRate,
longThrows, eccentricity, rushingOut, tendencyToPunch, acceleration, freeKicks, strength, stamina, pace,
jumping, influence, dirtiness, balance, bravery, consistency, aggression, agility, importantMatches,
injuryProneness, versatility, naturalFitness, determination, composure, concentration, unknownChar1;
@property(assign,readwrite) int rowID, UID;

- (IBAction)maxStats;

- (NSString *)footString;

- (NSImage *)previewbg;
- (int)previewStat1;
- (int)previewStat2;
- (int)previewStat3;
- (int)previewStat4;
- (int)previewStat7;
- (int)previewStat8;
- (int)previewStat9;
- (int)previewStat10;
- (int)previewStat11;
- (int)previewStat12;
- (int)previewStat13;
- (int)previewStat14;

@end
