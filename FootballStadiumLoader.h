//
//  StadiumLoader.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/03.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Loader.h"
#import "Stadium.h"

@interface Loader (FootballStadiumLoader)

+ (Stadium *)readStadiumFromData:(NSData *)data atOffset:(unsigned int *)byteOffset;

@end
