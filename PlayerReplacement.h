//
//  PlayerReplacement.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/17.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface PlayerReplacement : NSObject {
	int oldPlayerID, newPlayerID;
	BOOL confirmed;
}

@property(assign,readwrite) int oldPlayerID, newPlayerID;
@property(assign,readwrite) BOOL confirmed;

@end
