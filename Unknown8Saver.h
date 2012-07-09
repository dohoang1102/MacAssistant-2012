//
//  Unknown8Saver.h
//  FM10SX
//
//  Created by Amy Kettlewell on 10/01/15.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Unknown8.h"

@interface Unknown8Saver : NSObject {
	
}

+ (void)saveUnknown:(Unknown8 *)object toData:(NSMutableData *)data;

@end
