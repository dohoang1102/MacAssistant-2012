//
//  Derby.h
//  FM10SX
//
//  Created by Amy Kettlewell on 10/11/14.
//  Copyright 2010 littleblue. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "FMDate.h"

@interface Derby : NSObject {
	char databaseClass, firstMatchTeam1Goals, firstMatchTeam2Goals, unknownChar1, unknownChar2, 
	unknownChar3, unknownChar4;
	unsigned char worldReputation, nationalReputation;
	int team1ID, team2ID, firstMatchCompetitionID, firstMatchStadiumID, firstMatchAttendance,
	team1TotalGamesWon, team1TotalGamesDrawn, team1TotalGamesLost, rowID, UID;
	FMDate *firstMatchDate;
	NSString *name, *shortName, *alternativeName, *alternativeShortName;
}

@property(assign,readwrite) char databaseClass, firstMatchTeam1Goals, firstMatchTeam2Goals,
unknownChar1, unknownChar2, unknownChar3, unknownChar4;
@property(assign,readwrite) unsigned char worldReputation, nationalReputation;
@property(assign,readwrite) int team1ID, team2ID, firstMatchCompetitionID, firstMatchStadiumID, firstMatchAttendance,
team1TotalGamesWon, team1TotalGamesDrawn, team1TotalGamesLost, rowID, UID;
@property(assign,readwrite) FMDate *firstMatchDate;
@property(copy,readwrite) NSString *name, *shortName, *alternativeName, *alternativeShortName;

@end
