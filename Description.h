//
//  Description.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/04.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Description : NSObject {
	char databaseClass, unknownChar1, unknownChar2;
	int rowID, UID;
	NSMutableArray *names;
}

@property(assign,readwrite) char databaseClass, unknownChar1, unknownChar2;
@property(assign,readwrite) int rowID, UID;
@property(assign,readwrite) NSMutableArray *names;

@end
