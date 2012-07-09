//
//  StageName.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/04.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface StageName : NSObject {
	char databaseClass, nameGender;
	int rowID, UID;
	
	NSString *name, *shortName, *pluralName;
}

@property(assign,readwrite) char databaseClass, nameGender;
@property(assign,readwrite) int rowID, UID;
@property(copy,readwrite) NSString *name, *shortName, *pluralName;

@end
