//
//  ClubLinkLoader.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/18.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Loader.h"

@interface Loader (ClubLinkLoader)

+ (ClubLink *)readClubLinkFromData:(NSData *)data atOffset:(unsigned int *)byteOffset;

@end
