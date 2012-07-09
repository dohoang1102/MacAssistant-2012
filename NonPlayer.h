//
//  NonPlayer.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/20.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NonPlayer : NSObject {
	char preferredFormation, preferredFormation2, attackingFormation, defensiveFormation,
	unknownChar1, unknownChar2, unknownChar3;
	BOOL hasScoutingKnowledges, hasTendencies, unknownBool1, unknownBool2;
	short homeReputation, currentReputation, worldReputation, currentAbility, potentialAbility;
	int nonPlayingStatsID;
	NSData *unknownData1, *unknownData2, *unknownData3;
	NSMutableArray *scoutingKnowledges, *tendencies;
}

@property(assign,readwrite) char preferredFormation, preferredFormation2, attackingFormation, defensiveFormation,
unknownChar1, unknownChar2, unknownChar3;
@property(assign,readwrite) BOOL hasScoutingKnowledges, hasTendencies, unknownBool1, unknownBool2;
@property(assign,readwrite) short homeReputation, currentReputation, worldReputation, currentAbility, potentialAbility;
@property(assign,readwrite) int nonPlayingStatsID;
@property(copy,readwrite) NSMutableArray *scoutingKnowledges, *tendencies;
@property(readwrite,copy) NSData *unknownData1, *unknownData2, *unknownData3;

@end
