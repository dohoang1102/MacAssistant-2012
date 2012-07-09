//
//  Unknown7Loader.h
//  FM10SX
//
//  Created by Amy Kettlewell on 10/01/15.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Loader.h"

@interface Loader (Unknown7Loader)

+ (Unknown7 *)readUnknown7FromData:(NSData *)data atOffset:(unsigned int *)byteOffset;

@end
