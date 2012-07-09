//
//  Unknown5Loader.h
//  FM10SX
//
//  Created by Amy Kettlewell on 10/01/07.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Unknown5.h"

@interface Unknown5Loader : NSObject {

}

+ (Unknown5 *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset;

@end
