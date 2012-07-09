//
//  TeamContainerLoader.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/25.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "TeamContainer.h"

@interface TeamContainerLoader : NSObject {

}

+ (id)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset;

@end
