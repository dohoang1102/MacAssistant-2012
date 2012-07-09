//
//  Unknown4.h
//  FM10SX
//
//  Created by Amy Kettlewell on 10/01/07.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Unknown4 : NSObject {
	char unknownChar1, unknownChar2;
	short year;
}

@property(assign,readwrite) char unknownChar1, unknownChar2;
@property(assign,readwrite) short year;

@end
