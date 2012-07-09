//
//  PersonStats.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/04.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PersonStats.h"


@implementation PersonStats

@synthesize databaseClass, adaptability, ambition, loyalty, pressure, 
professionalism, sportsmanship, temperament, controversy, rowID, UID;

- (IBAction)maxStats
{
	[self setAdaptability:20];
	[self setAmbition:20];
	[self setControversy:1];
	[self setLoyalty:20];
	[self setPressure:20];
	[self setProfessionalism:20];
	[self setSportsmanship:20];
	[self setTemperament:20];
}

@end
