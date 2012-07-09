//
//  Official.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/21.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "FMDate.h"

@interface Official : NSObject {
	char allowingFlow, discipline, importantMatches, pressure, refereeing, runningLine, timekeeping;
	BOOL FIFAOfficial, continentalOfficial, assistantRefereeOnly;
	short currentAbility, potentialAbility, reputation;
	int cityID;
	FMDate *unknownDate1;
	NSMutableArray *competitionsAsReferee, *competitionsAsAssistant, *pastGames;
}

@property(readwrite,assign) char allowingFlow, discipline, importantMatches, pressure, refereeing, 
runningLine, timekeeping;
@property(readwrite,assign) BOOL FIFAOfficial, continentalOfficial, assistantRefereeOnly;
@property(readwrite,assign) short currentAbility, potentialAbility, reputation;
@property(readwrite,assign) int cityID;
@property(readwrite,assign) FMDate *unknownDate1;
@property(readwrite,copy) NSMutableArray *competitionsAsReferee, *competitionsAsAssistant, *pastGames;

@end
