//
//  PersonStats.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/04.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface PersonStats : NSObject {
	char databaseClass, adaptability, ambition, loyalty, pressure, professionalism;
	char sportsmanship, temperament, controversy;
	int rowID, UID;
}

@property(assign,readwrite) char databaseClass, adaptability, ambition, loyalty, pressure, 
professionalism, sportsmanship, temperament, controversy;
@property(assign,readwrite) int rowID, UID;

- (IBAction)maxStats;

@end
