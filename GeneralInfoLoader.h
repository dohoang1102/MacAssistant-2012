//
//  GeneralInfoLoader.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/31.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "GeneralInfo.h"

@interface GeneralInfoLoader : NSObject {

}

+ (id)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset readInfo:(BOOL)readInfo;

@end
