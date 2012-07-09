//
//  AlternativeKit.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/14.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Colour.h"

// kit numbers
#define AKN_HOME_KIT	0
#define AKN_AWAY_KIT	1
#define AKN_THIRD_KIT	2

// kit type
#define AKT_SHIRT	1
#define AKT_ICON	2
#define AKT_TEXT	3
#define AKT_SHORTS	4
#define AKT_SOCKS	5

@interface AlternativeKit : NSObject {
	BOOL outfieldKit;
	char kitNumber, type, alternativeKitNumber;
	short year;
	int competitionUID;
	Colour *colour;
}

@property(assign,readwrite) Colour *colour;
@property(assign,readwrite) BOOL outfieldKit;
@property(assign,readwrite) char kitNumber, type, alternativeKitNumber;
@property(assign,readwrite) short year;
@property(assign,readwrite) int competitionUID;

- (NSArray *)kitNumberStrings;
- (NSArray *)typeStrings;

@end
