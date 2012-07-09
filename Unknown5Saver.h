//
//  Unknown5Saver.h
//  FM10SX
//
//  Created by Amy Kettlewell on 10/01/15.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Unknown5.h"

@interface Unknown5Saver : NSObject {

}

+ (void)saveUnknown:(Unknown5 *)object toData:(NSMutableData *)data;

@end
