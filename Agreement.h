//
//  Agreement.h
//  FM10SX
//
//  Created by Amy Kettlewell on 10/11/14.
//  Copyright 2010 littleblue. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Agreement : NSObject {
	char databaseClass;
	int rowID, UID;
	NSString *name, *shortName, *alternativeName, *alternativeShortName;
}

@property(assign,readwrite) char databaseClass;
@property(assign,readwrite) int rowID, UID;
@property(copy,readwrite) NSString *name, *shortName, *alternativeName, *alternativeShortName;

@end
