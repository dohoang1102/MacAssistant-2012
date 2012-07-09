//
//  Unknown7Saver.h
//  FM10SX
//
//  Created by Amy Kettlewell on 10/01/15.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Unknown7.h"

@interface Unknown7Saver : NSObject {

}

+ (void)saveUnknown:(Unknown7 *)object toData:(NSMutableData *)data;

@end
