//
//  DerbyLoader.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/04.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Derby.h"
#import "Loader.h"

@interface Loader (DerbyLoader)

+ (Derby *)readDerbyFromData:(NSData *)data atOffset:(unsigned int *)byteOffset;

@end
