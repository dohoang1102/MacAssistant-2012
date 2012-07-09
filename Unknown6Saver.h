//
//  Unknown6Saver.h
//  FM10SX
//
//  Created by Amy Kettlewell on 10/01/15.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Unknown6.h"

@interface Unknown6Saver : NSObject {

}

+ (void)saveUnknown:(Unknown6 *)object toData:(NSMutableData *)data;

@end
