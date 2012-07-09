//
//  PlayerSaver.h
//  FM10SX
//
//  Created by Amy Kettlewell on 10/07/25.
//  Copyright 2010 littleblue. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Player.h"

@interface PlayerSaver : NSObject {

}

+ (void)savePlayer:(Player *)object toData:(NSMutableData *)data version:(short)version;

@end
