//
//  PlayerFormLoader.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/21.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "PlayerForm.h"

@interface PlayerFormLoader : NSObject {

}

+ (PlayerForm *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset;

@end
