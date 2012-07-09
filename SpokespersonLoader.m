//
//  SpokespersonLoader.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/22.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "SpokespersonLoader.h"

@implementation SpokespersonLoader

+ (Spokesperson *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset
{
	int ibuffer;
	
	unsigned int offset = *byteOffset;
	
	Spokesperson *object = [[Spokesperson alloc] init];
	
	// ???
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setUnknownInt1:ibuffer];
	
	*byteOffset = offset;
	
	return object;
}

@end
