//
//  LocationDays.h
//  FM11SX
//
//  Created by Amy Kettlewell on 10/11/15.
//  Copyright 2010 littleblue. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface LocationDays : NSObject {
	short days;
	int teamID;
	BOOL between15And21Only;
}

@property(readwrite,assign) short days;
@property(readwrite,assign) int teamID;
@property(readwrite,assign) BOOL between15And21Only;

@end
