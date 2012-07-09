//
//  FixtureLoader.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/24.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Fixture.h"

@interface FixtureLoader : NSObject {

}

+ (Fixture *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset;

@end
