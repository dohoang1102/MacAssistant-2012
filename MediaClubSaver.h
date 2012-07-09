//
//  MediaClubSaver.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/31.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MediaClub.h"

@interface MediaClubSaver : NSObject {

}

+ (void)saveClub:(MediaClub *)object toData:(NSMutableData *)data;

@end
