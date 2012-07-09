//
//  Unknown2Loader.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/27.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Unknown2.h"

@interface Unknown2Loader : NSObject {

}

+ (Unknown2 *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset;

@end
