//
//  FixtureBlock.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/17.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "FMDate.h"

@interface FixtureBlock : NSObject {
	char type, actualCompetitionType;
	short fixtureBlockID;
	FMDate *startDate, *endDate;
}

@property(assign,readwrite) char type, actualCompetitionType;
@property(assign,readwrite) short fixtureBlockID;
@property(assign,readwrite) FMDate *startDate, *endDate;

@end
