//
//  Unknown6Loader.h
//  FM10SX
//
//  Created by Amy Kettlewell on 10/01/07.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Unknown6.h"

@interface Unknown6Loader : NSObject {

}

+ (Unknown6 *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset;

@end
