//
//  Unknown1Saver.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/23.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Unknown1.h"

@interface Unknown1Saver : NSObject {

}

+ (void)saveUnknown:(Unknown1 *)object toData:(NSMutableData *)data;

@end
