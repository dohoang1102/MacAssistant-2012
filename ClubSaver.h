//
//  ClubSaver.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/23.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Club.h"

@interface ClubSaver : NSObject {
	
}

+ (void)saveClub:(Club *)object toData:(NSMutableData *)data version:(short)version;

@end
