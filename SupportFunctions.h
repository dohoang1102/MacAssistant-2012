//
//  SupportFunctions.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/23.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface SupportFunctions : NSObject {

}

+ (NSString *)readCStringFromData:(NSData *)data atOffset:(unsigned int *)byteOffset length:(int)length;
+ (void)saveCString:(NSString *)str toData:(NSMutableData *)data;

+ (void)showErrorWindow:(NSString *)title withInfo:(NSString *)info;
+ (NSString *)reverseString:(NSString *)str;

@end
