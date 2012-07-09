//
//  PlayerStatsSaver.h
//  FM10SX
//
//  Created by Amy Kettlewell on 10/07/26.
//  Copyright 2010 littleblue. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "PlayerStats.h"

@interface PlayerStatsSaver : NSObject {

}

+ (void)saveStats:(PlayerStats *)object toData:(NSMutableData *)data;

@end
