//
//  ClubSponsorLoader.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/25.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ClubSponsor.h"

@interface ClubSponsorLoader : NSObject {

}

+ (ClubSponsor *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset;

@end
