//
//  Region.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/28.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Region : NSObject {
	char databaseClass;
	int rowID, UID;
}

@property(assign,readwrite) char databaseClass;
@property(assign,readwrite) int rowID,UID;

@end
