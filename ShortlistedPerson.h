//
//  ShortlistedPerson.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/30.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "FMDate.h"

@interface ShortlistedPerson : NSObject {
	FMDate *fromDate;
	int personID;
}

@property(assign,readwrite) int personID;
@property(assign,readwrite) FMDate *fromDate;

@end
