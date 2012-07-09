//
//  Unknown8Loader.h
//  FM10SX
//
//  Created by Amy Kettlewell on 10/01/07.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Unknown8.h"

@interface Unknown8Loader : NSObject {
	
}

+ (Unknown8 *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset;

@end
