//
//  Unknown1Loader.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/23.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Unknown1.h"

@interface Unknown1Loader : NSObject {

}

+ (Unknown1 *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset;

@end
