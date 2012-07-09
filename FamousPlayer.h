//
//  FamousPlayer.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/29.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

// height
#define FPH_SMALL	1
#define FPH_MEDIUM	2
#define FPH_TALL	3

@interface FamousPlayer : NSObject {
	char unknownChar1, unknownChar2, unknownChar3, unknownChar4, unknownChar5, 
	unknownChar6, unknownChar7, unknownChar8;
	int personID;
}

@property(assign,readwrite) char unknownChar1, unknownChar2, unknownChar3, unknownChar4, 
unknownChar5, unknownChar6, unknownChar7, unknownChar8;
@property(assign,readwrite) int personID;

@end
