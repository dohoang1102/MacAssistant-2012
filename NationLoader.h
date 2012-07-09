//
//  NationLoader.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/16.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Loader.h"
#import "Nation.h"

@interface Loader (NationLoader)

+ (id)readNationFromData:(NSData *)data atOffset:(unsigned int *)byteOffset version:(short)version;

@end
