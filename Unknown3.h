//
//  Unknown3.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/31.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface Unknown3 : NSObject {
	char unknownChar1;
	short year;
	int teamID;
}

@property(assign,readwrite) char unknownChar1;
@property(assign,readwrite) short year;
@property(assign,readwrite) int teamID;

@end