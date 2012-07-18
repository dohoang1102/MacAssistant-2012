//
//  Unknown8Loader.m
//  FM10SX
//
//  Created by Amy Kettlewell on 10/01/07.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Unknown8Loader.h"

@implementation Unknown8Loader

+ (Unknown8 *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset
{
    char cbuffer;
    int ibuffer;
	unsigned int offset = *byteOffset;
	
	Unknown8 *object = [[Unknown8 alloc] init];
	
    // FM 2012 WTF?
    offset += 1;
    [data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
    for (int i=0; i<cbuffer; i++) {
        offset += 48;
    }
    
    offset += 3;
    
    [data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
    for (int i=0; i<cbuffer; i++) {
        offset += 48;
    }
    
    offset += 99;
    
    [data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
    for (int i=0; i<ibuffer; i++) {
        offset += 18;
    }
    
    [data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
    for (int i=0; i<ibuffer; i++) {
        offset += 18;
    }
    
    
    // 8 last bytes
    offset += 8;
	
	*byteOffset = offset;
	
	return object;
}

@end
