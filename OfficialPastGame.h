//
//  OfficialPastGame.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/22.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "FMDate.h"

@interface OfficialPastGame : NSObject {
	char yellowCards, redCards, rating, homePenalties, awayPenalties, homeGoals, awayGoals, unknownChar1;
	int competitionID, homeTeamID, awayTeamID;
	FMDate *date;
}

@property(assign,readwrite) char yellowCards, redCards, rating, homePenalties, awayPenalties, homeGoals, awayGoals,
unknownChar1;
@property(assign,readwrite) int competitionID, homeTeamID, awayTeamID;
@property(assign,readwrite) FMDate *date;

@end
