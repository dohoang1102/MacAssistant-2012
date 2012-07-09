//
//  StaffLoader.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/20.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Staff.h"

@interface StaffLoader : NSObject {

}

+ (Staff *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset version:(short)version;

@end
