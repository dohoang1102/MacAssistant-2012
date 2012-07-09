//
//  NationSaver.h
//  FM10SX
//
//  Created by Amy Kettlewell on 10/01/05.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Nation.h"

@interface NationSaver : NSObject {

}

+ (void)saveNation:(Nation *)object toData:(NSMutableData *)data;

@end
