//
//  TeamContainer.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/26.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Controller.h"

@interface TeamContainer : NSObject {
	char teamContainerType, nameGender, shortNameGender;
	char attacking, depth, directness, flamboyancy, flexibility, freeRoles, marking,
		 offside, pressing, sittingBack, tempo, useOfPlaymaker, width, preferredFormation,
		 preferredFormation2, defensiveFormation, attackingFormation;
	
	Controller *controller;
	NSString *name, *shortName, *nickname;
	NSMutableArray	*colours, *teams, *relationships, *alternativeStadiums, *alternateKits, *unknowns1, 
	*unknowns2, *unknowns3, *unknowns4, *transferInfos;
}

@property(assign,readwrite) Controller *controller;
@property(assign,readwrite) char teamContainerType, nameGender, shortNameGender,
attacking, depth, directness, flamboyancy, flexibility, freeRoles, marking, 
offside, pressing, sittingBack, tempo, useOfPlaymaker, width, preferredFormation, 
preferredFormation2, defensiveFormation, attackingFormation;
@property(copy,readwrite) NSString *name, *shortName, *nickname;
@property(copy,readwrite) NSMutableArray *colours, *teams, *relationships, 
*alternativeStadiums, *alternateKits, *unknowns1, *unknowns2, *unknowns3, *unknowns4, 
*transferInfos;

- (NSArray *)teamObjects;

- (NSImage *)defaultTitleBG;
- (NSColor *)bgColour;
- (NSColor *)textColour;
- (NSColor *)trimColour;

@end
