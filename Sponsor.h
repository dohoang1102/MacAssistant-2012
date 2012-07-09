//
//  Sponsor.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/24.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

// business types
#define BT_LOCAL			0
#define BT_REGIONAL			1
#define BT_NATIONAL			2
#define BT_INTERNATIONAL	3

@interface Sponsor : NSObject {
	char databaseClass, nameGender, businessNameGender, businessType;
	int rowID, UID;
	
	NSString *name, *businessName;
}

@property(assign,readwrite) char databaseClass, nameGender, businessNameGender, businessType;
@property(assign,readwrite) int rowID, UID;
@property(copy,readwrite) NSString *name, *businessName;

- (NSArray *)typeStrings;

@end
