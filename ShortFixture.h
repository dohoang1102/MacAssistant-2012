//
//  ShortFixture.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/21.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "FMDateLoader.h"

@interface ShortFixture : NSObject {
	char venue, homeGoals, awayGoals;
	int competitionID, competitionNameID, stageNameID, subStageNameID, extraStageNameID, homeTeamID,
	awayTeamID, matchStatsIndex;
	BOOL hasName;
	FMDate *date;
}

@property(assign,readwrite) char venue, homeGoals, awayGoals;
@property(assign,readwrite) int competitionID, competitionNameID, stageNameID, subStageNameID, extraStageNameID, homeTeamID,
awayTeamID, matchStatsIndex;
@property(assign,readwrite) BOOL hasName;
@property(assign,readwrite) FMDate *date;

@end
