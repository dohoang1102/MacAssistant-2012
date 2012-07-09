//
//  PlayerStatsSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 10/07/26.
//  Copyright 2010 littleblue. All rights reserved.
//

#import "PlayerStatsSaver.h"

@implementation PlayerStatsSaver

+ (void)saveStats:(PlayerStats *)object toData:(NSMutableData *)data
{
	char cbuffer;
	int ibuffer;
	
	cbuffer = [object databaseClass];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object goalkeeper];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object sweeper];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object defender];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object defensiveMidfielder];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object midfielder];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object attackingMidfielder];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object forward];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object wingBack];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object freeRole];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object rightSide];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object leftSide];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object central];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object leftDefender];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object centralDefender];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object rightDefender];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object centralDefensiveMidfielder];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object leftMidfielder];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object centralMidfielder];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object rightMidfielder];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object leftAttackingMidfielder];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object centralAttackingMidfielder];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object rightAttackingMidfielder];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object centreForward];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object leftWingBack];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object rightWingBack];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object crossing];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object dribbling];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object finishing];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object heading];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object longShots];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object marking];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object offTheBall];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object passing];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object penalties];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object tackling];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object creativity];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object handling];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object aerialAbility];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object commandOfArea];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object communication];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object kicking];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object throwing];
	[data appendBytes:&cbuffer length:1];
	
	cbuffer = [object unknownChar1];
	[data appendBytes:&cbuffer length:1];
	
	cbuffer = [object anticipation];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object decisions];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object oneOnOnes];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object positioning];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object reflexes];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object firstTouch];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object technique];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object leftFoot];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object rightFoot];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object flair];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object corners];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object teamwork];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object workRate];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object longThrows];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object eccentricity];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object rushingOut];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object tendencyToPunch];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object acceleration];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object freeKicks];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object strength];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object stamina];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object pace];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object jumping];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object influence];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object dirtiness];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object balance];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object bravery];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object consistency];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object aggression];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object agility];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object importantMatches];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object injuryProneness];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object versatility];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object naturalFitness];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object determination];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object composure];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object concentration];
	[data appendBytes:&cbuffer length:1];
	ibuffer = [object rowID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object UID];
	[data appendBytes:&ibuffer length:4];
}

@end
