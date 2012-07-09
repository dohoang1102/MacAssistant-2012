//
//  PlayerStatsLoader.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/04.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Loader.h"
#import "PlayerStats.h"

@interface Loader (PlayerStatsLoader)

+ (PlayerStats *)readPlayerStatsFromData:(NSData *)data atOffset:(unsigned int *)byteOffset;

@end
