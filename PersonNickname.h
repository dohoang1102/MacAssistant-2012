//
//  PersonNickname.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/20.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface PersonNickname : NSObject {
	int nicknamerID;
	NSString *nickname;
}

@property(assign,readwrite) int nicknamerID;
@property(copy,readwrite) NSString *nickname;

@end
