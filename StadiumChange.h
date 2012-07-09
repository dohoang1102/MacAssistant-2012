//
//  StadiumChange.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/04.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Stadium.h"
#import "FMDate.h"

// types
#define SCT_STADIUM_CHANGE	1
#define SCT_CAPACITY_CHANGE	2

@interface StadiumChange : NSObject {
	char databaseClass, type;
	int rowID, UID, alternativeStadiumID, oldStadiumID, newStadiumID, teamID, newCapacity;
	FMDate *leaveDate, *moveInDate;
	NSData *unknownData1;
	NSString *name;
	Stadium *oldStadium, *alternativeStadium, *newStadium;
}

@property(assign,readwrite) int rowID, UID, alternativeStadiumID, oldStadiumID, 
newStadiumID, teamID, newCapacity;
@property(assign,readwrite) char databaseClass, type;
@property(assign,readwrite) Stadium *oldStadium, *alternativeStadium, *newStadium;
@property(copy,readwrite) NSString *name;
@property(readwrite,copy) NSData *unknownData1;
@property(assign,readwrite) FMDate *leaveDate, *moveInDate;

- (NSArray *)typeStrings;

@end
