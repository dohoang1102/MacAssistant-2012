//
//  Journalist.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/22.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Journalist : NSObject {
	char unknownChar1;
	int media, favouriteClubID;
	
	NSData *unknownData1;
}

@property(assign,readwrite) char unknownChar1;
@property(assign,readwrite) int media, favouriteClubID;
@property(readwrite,copy) NSData *unknownData1;

@end
