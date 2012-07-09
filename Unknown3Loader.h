//
//  Unknown3Loader.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/31.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Unknown3.h"

@interface Unknown3Loader : NSObject {
	
}

+ (Unknown3 *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset;

@end
