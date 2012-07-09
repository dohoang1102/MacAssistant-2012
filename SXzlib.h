//
//  SXzlib.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/23.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface NSData (NSDataExtension)

- (NSData *) zlibInflate;
- (NSData *) zlibDeflate;

@end
