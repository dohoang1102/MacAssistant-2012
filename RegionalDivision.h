//
//  RegionalDivision.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/30.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface RegionalDivision : NSObject {
	char level;
	unsigned int divisionID;
}

@property(assign,readwrite) char level;
@property(assign,readwrite) unsigned int divisionID;

@end
