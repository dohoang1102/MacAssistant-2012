//
//  Unknown2Saver.h
//  FM10SX
//
//  Created by Amy Kettlewell on 10/01/15.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Unknown2.h"

@interface Unknown2Saver : NSObject {

}

+ (void)saveUnknown:(Unknown2 *)object toData:(NSMutableData *)data;

@end
