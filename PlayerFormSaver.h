//
//  PlayerFormSaver.h
//  FM10SX
//
//  Created by Amy Kettlewell on 10/07/26.
//  Copyright 2010 littleblue. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "PlayerForm.h"

@interface PlayerFormSaver : NSObject {

}

+ (void)savePlayerForm:(PlayerForm *)object toData:(NSMutableData *)data;

@end
