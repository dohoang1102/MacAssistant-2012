//
//  StaffTendencyLoader.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/26.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "StaffTendency.h"

@interface StaffTendencyLoader : NSObject {

}

+ (StaffTendency *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset;

@end
