//
//  SponsorLoader.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/24.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Loader.h"

@interface Loader (SponsorLoader)

+ (Sponsor *)readSponsorFromData:(NSData *)data atOffset:(unsigned int *)byteOffset;

@end
