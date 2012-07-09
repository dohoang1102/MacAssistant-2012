//
//  FMFArchiver.h
//  FM10SX
//
//  Created by Amy Kettlewell on 10/08/05.
//  Copyright 2010 littleblue. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface FMFArchiver : NSObject {

}

+ (void)extractFMF:(NSString *)path;
+ (void)parseFMFDirectory:(NSData *)decompressedData atOffset:(unsigned int *)offset path:(NSString *)path fromFile:(NSString *)filePath withData:(NSData *)fileData isCompressed:(BOOL)compressed;

@end
