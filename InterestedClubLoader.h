//
//  InterestedClubLoader.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/20.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "InterestedClub.h"

@interface InterestedClubLoader : NSObject {

}

+ (InterestedClub *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset;

@end
