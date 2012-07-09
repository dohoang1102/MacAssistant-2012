//
//  PersonNicknameSaver.h
//  FM10SX
//
//  Created by Amy Kettlewell on 10/07/25.
//  Copyright 2010 littleblue. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "PersonNickname.h"

@interface PersonNicknameSaver : NSObject {

}

+ (void)saveNickname:(PersonNickname *)object toData:(NSMutableData *)data;

@end
