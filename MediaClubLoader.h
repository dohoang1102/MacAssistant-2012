//
//  MediaClubLoader.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/31.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MediaClub.h"

@interface MediaClubLoader : NSObject {

}

+ (MediaClub *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset;

@end
