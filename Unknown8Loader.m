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
	unsigned int offset = *byteOffset;
	
	Unknown8 *object = [[Unknown8 alloc] init];
	
	[object setUnknownData1:[data subdataWithRange:NSMakeRange(offset, 10)]]; offset += 10;
	
	*byteOffset = offset;
	
	return object;
}

@end
