//
//  InterestedClub.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/20.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "FMDate.h"

@interface InterestedClub : NSObject {
	int clubID;
	FMDate *interestedSinceDate;
}

@property(assign,readwrite) int clubID;
@property(assign,readwrite) FMDate *interestedSinceDate;

@end
