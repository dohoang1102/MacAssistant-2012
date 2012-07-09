//
//  Unknown1.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/23.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Unknown1 : NSObject {
	char unknownChar1, unknownChar2;
	int unknownInt;
}

@property(readwrite,assign) char unknownChar1, unknownChar2;
@property(readwrite,assign) int unknownInt;

@end
