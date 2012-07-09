//
//  Unknown4Loader.m
//  FM10SX
//
//  Created by Amy Kettlewell on 10/01/07.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Unknown4Loader.h"

@implementation Unknown4Loader

+ (Unknown4 *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset
{
	char cbuffer;
	short sbuffer;
	
	unsigned int offset = *byteOffset;
	
	Unknown4 *object = [[Unknown4 alloc] init];
	
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setYear:sbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar1:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar2:cbuffer];
	
	*byteOffset = offset;
	
	return object;
}

@end
