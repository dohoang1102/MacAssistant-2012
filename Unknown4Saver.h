//
//  Unknown4Saver.h
//  FM10SX
//
//  Created by Amy Kettlewell on 10/01/07.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Unknown4.h"

@interface Unknown4Saver : NSObject {

}

+ (void)saveUnknown:(Unknown4 *)object toData:(NSMutableData *)data;

@end
