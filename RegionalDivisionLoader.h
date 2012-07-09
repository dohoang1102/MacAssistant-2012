//
//  RegionalDivisionLoader.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/25.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "RegionalDivision.h"

@interface RegionalDivisionLoader : NSObject {

}

+ (RegionalDivision *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset;

@end
