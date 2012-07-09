//
//  Unknown5.h
//  FM10SX
//
//  Created by Amy Kettlewell on 10/01/07.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Unknown5 : NSObject {
	char unknownChar1, unknownChar2, unknownChar3, unknownChar4;
	int unknownInt;
}

@property(assign,readwrite) char unknownChar1, unknownChar2, unknownChar3, unknownChar4;
@property(assign,readwrite) int unknownInt;

@end
