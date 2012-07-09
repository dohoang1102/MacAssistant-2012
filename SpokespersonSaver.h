//
//  SpokespersonSaver.h
//  FM10SX
//
//  Created by Amy Kettlewell on 10/07/25.
//  Copyright 2010 littleblue. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Spokesperson.h"

@interface SpokespersonSaver : NSObject {

}

+ (void)saveSpokesperson:(Spokesperson *)object toData:(NSMutableData *)data;

@end
