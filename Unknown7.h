//
//  Unknown7.h
//  FM10SX
//
//  Created by Amy Kettlewell on 10/01/15.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Unknown7 : NSObject {
	char databaseClass;
	int rowID, UID;
	NSData *unknownData;
}

@property(assign,readwrite) char databaseClass;
@property(assign,readwrite) int rowID, UID;
@property(copy,readwrite) NSData *unknownData;

@end
