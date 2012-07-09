//
//  MediaSaver.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/31.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Media.h"

@interface MediaSaver : NSObject {

}

+ (void)saveMedia:(Media *)object toData:(NSMutableData *)data;

@end
