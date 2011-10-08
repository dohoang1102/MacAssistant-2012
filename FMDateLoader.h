//
//  FMDateLoader.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/11.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "FMDate.h"

@interface FMDateLoader : NSObject {

}

+ (FMDate *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset;

@end
