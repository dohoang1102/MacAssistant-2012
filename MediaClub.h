//
//  MediaClub.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/31.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface MediaClub : NSObject {
	int clubID;
	NSString *URL;
}

@property(assign,readwrite) int clubID;
@property(assign,readwrite) NSString *URL;

@end
