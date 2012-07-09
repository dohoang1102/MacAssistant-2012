//
//  StaffTendencyLoader.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/26.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "StaffTendencyLoader.h"

@implementation StaffTendencyLoader

+ (StaffTendency *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset
{
	char cbuffer;
	
	unsigned int offset = *byteOffset;
	
	StaffTendency *object = [[StaffTendency alloc] init];
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setType:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setLevel:cbuffer];
	
	*byteOffset = offset;
	
	return object;
}

@end
