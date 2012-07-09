//
//  TransferPreference.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/16.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface TransferPreference : NSObject {
	int nationID;
	char rating, scoutingKnowledge;
}

@property(readwrite,assign) int nationID;
@property(readwrite,assign) char rating, scoutingKnowledge;

@end
