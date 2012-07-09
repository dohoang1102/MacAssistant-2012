//
//  LocalAreaLoader.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/04.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "LocalArea.h"
#import "Loader.h"

@interface Loader (LocalAreaLoader)

+ (LocalArea *)readLocalAreaFromData:(NSData *)data atOffset:(unsigned int *)byteOffset;

@end
