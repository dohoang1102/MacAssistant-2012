//
//  RegionLoader.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/28.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Loader.h"

@interface Loader (RegionLoader)

+ (Region *)readRegionFromData:(NSData *)data atOffset:(unsigned int *)byteOffset;

@end
