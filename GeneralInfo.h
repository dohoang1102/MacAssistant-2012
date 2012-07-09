//
//  GeneralInfo.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/31.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Fixture.h"
#import "FMDate.h"

// competition infos
#define CMP_LEVEL				@"lvel"
#define CMP_TYPE				@"epyt"
#define CMP_SORTING_RULES		@"tros"
#define CMP_FIXTURE_PRIORITY	@"oirp"

// fixture priorities
#define CMPFP_LEAGUE_LOW		@"league_low"

// sort types
#define CMPS_GOAL_DIFFERENCE	@"goal_difference"
#define CMPS_GOALS_FOR			@"goals_for"
#define CMPS_OWN_MATCH			@"own_match"
#define CMPS_GAMES_WON			@"games_won"


@interface GeneralInfo : NSObject {
	char type, charValue, unknownChar1, unknownChar2, unknownChar3, unknownChar4, unknownChar5, 
	unknownChar6, unknownChar7, unknownChar8;
	int	intValue;
	Fixture *unknownFixture1;
	FMDate *dateValue;
	NSData *unknownData1;
	NSString *stringValue, *name;
	NSMutableArray *infos;
}

@property(assign,readwrite) char type, charValue, unknownChar1, unknownChar2, unknownChar3, 
unknownChar4, unknownChar5, unknownChar6, unknownChar7, unknownChar8;
@property(assign,readwrite) int intValue;
@property(assign, readwrite) FMDate *dateValue;
@property(assign, readwrite) Fixture *unknownFixture1;
@property(copy, readwrite) NSData *unknownData1;
@property(copy, readwrite) NSString *stringValue, *name;
@property(copy, readwrite) NSMutableArray *infos;

- (NSString *)value;

@end
