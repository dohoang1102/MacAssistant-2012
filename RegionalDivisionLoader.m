//
//  RegionalDivisionLoader.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/25.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "RegionalDivisionLoader.h"

@implementation RegionalDivisionLoader

+ (RegionalDivision *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset
{
	char cbuffer;
	int ibuffer;
	
	unsigned int offset = *byteOffset;
	
	RegionalDivision *object = [[RegionalDivision alloc] init];
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setLevel:cbuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setDivisionID:ibuffer];
    
    // Skip 4 bytes
    offset += 4;
	
	*byteOffset = offset;
	
	return object;
}

@end
