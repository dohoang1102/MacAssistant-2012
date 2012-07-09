//
//  PersonNicknameLoader.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/20.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "PersonNickname.h"

@interface PersonNicknameLoader : NSObject {

}

+ (PersonNickname *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset;

@end
