//
//  ColourSaver.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/14.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Colour.h"

@interface ColourSaver : NSObject {

}

+ (void)saveColour:(Colour *)object toData:(NSMutableData *)data extended:(BOOL)extended;

@end
