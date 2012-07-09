//
//  IDPC.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/26.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "FMDate.h"

@interface IDPC : NSObject {
	char unknownChar1;
	unsigned char playerCount;
	FMDate *date;
}

@property(assign,readwrite) FMDate *date;
@property(assign,readwrite) unsigned char playerCount;
@property(assign,readwrite) char unknownChar1;

@end
