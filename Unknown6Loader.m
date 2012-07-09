//
//  Unknown6Loader.m
//  FM10SX
//
//  Created by Amy Kettlewell on 10/01/07.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Unknown6Loader.h"

@implementation Unknown6Loader

+ (Unknown6 *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset
{
	unsigned int offset = *byteOffset;
	
	Unknown6 *object = [[Unknown6 alloc] init];
	
	[object setUnknownData1:[data subdataWithRange:NSMakeRange(offset, 38)]]; offset += 38;
	
	*byteOffset = offset;
	
	return object;
}

@end
