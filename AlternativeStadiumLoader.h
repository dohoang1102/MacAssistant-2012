//
//  AlternativeStadiumLoader.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/14.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "AlternativeStadium.h"

@interface AlternativeStadiumLoader : NSObject {

}

+ (AlternativeStadium *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset;

@end
