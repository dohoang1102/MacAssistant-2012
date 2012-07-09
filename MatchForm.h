//
//  MatchForm.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/21.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "FMDate.h"

@interface MatchForm : NSObject {
	char goals, conceded, shots, shotsOnTarget, assists, runsPastOpponent, foulsMade, foulsAgainst,
	offsides, yellowCards, redCards, minuteOnAsASub, minuteSubstituted, minuteInjured, minuteSentOff,
	rating, passesAttempted, passesCompleted, keyPasses, tacklesAttempted, tacklesWon, keyTackles,
	headersAttempted, headersWon, keyHeaders, interceptions, condition, unknownChar1, unknownChar2, 
	unknownChar3, unknownChar4;
	BOOL hasStats;
	short positionMask;
	int oppositionID;
	FMDate *date;
	NSData *unknownData1;
}

@property(assign,readwrite) char goals, conceded, shots, shotsOnTarget, assists, runsPastOpponent, foulsMade, foulsAgainst,
offsides, yellowCards, redCards, minuteOnAsASub, minuteSubstituted, minuteInjured, minuteSentOff,
rating, passesAttempted, passesCompleted, keyPasses, tacklesAttempted, tacklesWon, keyTackles,
headersAttempted, headersWon, keyHeaders, interceptions, condition, unknownChar1, unknownChar2, 
unknownChar3, unknownChar4;
@property(assign,readwrite) BOOL hasStats;
@property(assign,readwrite) short positionMask;
@property(assign,readwrite) int oppositionID;
@property(assign,readwrite) FMDate *date;
@property(readwrite,copy) NSData *unknownData1;

- (NSString *)info;

@end
