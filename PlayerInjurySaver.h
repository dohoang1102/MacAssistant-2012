//
//  PlayerInjurySaver.h
//  FM10SX
//
//  Created by Amy Kettlewell on 10/07/25.
//  Copyright 2010 littleblue. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "PlayerInjury.h"

@interface PlayerInjurySaver : NSObject {

}

+ (void)saveInjury:(PlayerInjury *)object toData:(NSMutableData *)data;

@end
