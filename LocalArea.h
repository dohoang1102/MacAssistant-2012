//
//  LocalArea.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/04.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface LocalArea : NSObject {
	char databaseClass, unknownChar1, unknownChar2, unknownChar3, unknownChar4, unknownChar5, unknownChar6,
	unknownChar7, unknownChar8, unknownChar9, unknownChar10, unknownChar11;
	
	int rowID, UID, nationID, languageID, population;
	
	NSString *name, *shortName;
}

@property(assign,readwrite) char databaseClass, unknownChar1, unknownChar2, unknownChar3, unknownChar4, 
unknownChar5, unknownChar6, unknownChar7, unknownChar8, unknownChar9, unknownChar10, unknownChar11;
@property(assign,readwrite) int rowID, UID, nationID, languageID, population;
@property(copy,readwrite) NSString *name, *shortName;

@end
