//
//  VirtualPlayerSaver.h
//  FM10SX
//
//  Created by Amy Kettlewell on 10/07/25.
//  Copyright 2010 littleblue. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "VirtualPlayer.h"

@interface VirtualPlayerSaver : NSObject {

}

+ (void)savePlayer:(VirtualPlayer *)object toData:(NSMutableData *)data;

@end
