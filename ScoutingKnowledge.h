//
//  ScoutingKnowledge.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/30.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "FMDate.h"

@interface ScoutingKnowledge : NSObject {
	int nationID, sourceStaffID, sourceClubID, sourcePlayerID;
	char percentComplete, unknownChar1;
	FMDate *date;
}

@property(assign,readwrite) char percentComplete, unknownChar1;
@property(assign,readwrite) int nationID, sourceStaffID, sourceClubID, sourcePlayerID;
@property(assign,readwrite) FMDate *date;

@end
