//
//  PlayerLoader.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/01.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Player.h"

@interface PlayerLoader : NSObject {

}

+ (Player *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset version:(short)version;

@end
