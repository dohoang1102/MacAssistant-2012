//
//  MatchForm.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/21.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "MatchForm.h"

@implementation MatchForm

@synthesize goals, conceded, shots, shotsOnTarget, assists, runsPastOpponent, foulsMade, foulsAgainst,
offsides, yellowCards, redCards, minuteOnAsASub, minuteSubstituted, minuteInjured, minuteSentOff,
rating, passesAttempted, passesCompleted, keyPasses, tacklesAttempted, tacklesWon, keyTackles,
headersAttempted, headersWon, keyHeaders, interceptions, condition, hasStats, positionMask, date,
oppositionID, unknownData1, unknownChar1, unknownChar2, unknownChar3, unknownChar4;

- (NSString *)info {
	if (minuteInjured>0) { return [NSString stringWithFormat:@"inj %d",minuteInjured]; }
	if (minuteSubstituted>0) { return [NSString stringWithFormat:@"sub %d",minuteSubstituted]; }
	if (minuteOnAsASub>0) { return [NSString stringWithFormat:@"on %d",minuteOnAsASub]; }
	if (minuteSentOff>0) { return [NSString stringWithFormat:@"off %d",minuteSentOff]; }
	
	return @"";
}

@end
