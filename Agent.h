//
//  Agent.h
//  FM11SX
//
//  Created by Amy Kettlewell on 10/11/15.
//  Copyright 2010 littleblue. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "FMDate.h"

// scope
#define AGS_NATIONAL	0
#define AGS_REGIONAL	1
#define AGS_CONTINENTAL	2
#define AGS_WORLDWIDE	3

@interface Agent : NSObject {
	char scope, patience, agentFeeDemands, willingnessToToutPlayers, unknownChar1;
	int basedNationID;
	NSMutableArray *clients;
	FMDate *unknownDate1;
}

@property(assign,readwrite) char scope, patience, agentFeeDemands, willingnessToToutPlayers,
unknownChar1;
@property(assign,readwrite) int basedNationID;
@property(readwrite,assign) FMDate *unknownDate1;
@property(copy,readwrite) NSMutableArray *clients;

- (NSArray *)scopeStrings;

@end
