//
//  PersonLoader.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/01.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Person.h"
#import "Loader.h"

@interface Loader (PersonLoader)

+ (Person *)readPersonFromData:(NSData *)data atOffset:(unsigned int *)byteOffset version:(short)version;

@end
