//
//  Name.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/24.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface Name : NSObject {
	char databaseClass, unknownChar;
	short count;
	int nationID, rowID, UID;
	
	NSString *name;
}

@property(assign,readwrite) char databaseClass, unknownChar;
@property(assign,readwrite) short count;
@property(assign,readwrite) int nationID, rowID, UID;
@property(copy,readwrite) NSString *name;

@end
