//
//  TreatedNationsLoader.h
//  FM11SX
//
//  Created by Amy Kettlewell on 10/11/18.
//  Copyright 2010 littleblue. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "TreatedNations.h"

@interface TreatedNationsLoader : NSObject {

}

+ (TreatedNations *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset;

@end
