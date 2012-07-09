//
//  PlayerForm.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/21.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Controller.h"

@interface PlayerForm : NSObject {
	int teamID;
	Controller *controller;
	NSMutableArray *matchForms;
}

@property(assign,readwrite) int teamID;
@property(assign,readwrite) Controller *controller;
@property(copy,readwrite) NSMutableArray *matchForms;

@end
