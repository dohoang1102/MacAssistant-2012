//
//  AlternativeStadium.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/14.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "FMDate.h"

@interface AlternativeStadium : NSObject {
	char unknownChar1, unknownChar2;
	int stadiumID, competitionID, clubID;
	FMDate *unknownDate1, *unknownDate2;
}

@property(assign,readwrite) int stadiumID, competitionID, clubID;
@property(assign,readwrite) char unknownChar1, unknownChar2;
@property(assign,readwrite) FMDate *unknownDate1, *unknownDate2;

@end
