//
//  PlayerBanSaver.h
//  FM10SX
//
//  Created by Amy Kettlewell on 10/07/25.
//  Copyright 2010 littleblue. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "PlayerBan.h"

@interface PlayerBanSaver : NSObject {

}

+ (void)saveBan:(PlayerBan *)object toData:(NSMutableData *)data;

@end
