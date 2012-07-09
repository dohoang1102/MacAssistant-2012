//
//  VirtualPlayer.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/22.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface VirtualPlayer : NSObject {
	unsigned int unknownInt1;
	NSData *unknownData1;
}

@property(assign,readwrite) unsigned int unknownInt1;
@property(readwrite,copy) NSData *unknownData1;

@end
