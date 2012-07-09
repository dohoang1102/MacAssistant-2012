//
//  FMString.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/24.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface FMString : NSObject {

}

+ (NSString *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset;
+ (void)saveString:(NSString *)string toData:(NSMutableData *)data;

@end
