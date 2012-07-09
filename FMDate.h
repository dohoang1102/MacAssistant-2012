//
//  FMDate.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/24.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface FMDate : NSObject {
	unsigned short day, year;
	NSDate *date;
}

@property(assign,readwrite) unsigned short day, year;
@property(copy,readwrite) NSDate *date;

@end
