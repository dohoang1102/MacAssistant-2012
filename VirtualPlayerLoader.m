//
//  VirtualPlayerLoader.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/22.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "VirtualPlayerLoader.h"

@implementation VirtualPlayerLoader

+ (VirtualPlayer *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset
{
	unsigned int uibuffer;
	
	unsigned int offset = *byteOffset;
	
	VirtualPlayer *object = [[VirtualPlayer alloc] init];
	
	[data getBytes:&uibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setUnknownInt1:uibuffer];
	
	if (uibuffer & 0x80000000) { 
		[object setUnknownData1:[data subdataWithRange:NSMakeRange(offset, 19)]]; 
		offset += 19;
	}
	else { 
		[object setUnknownData1:[data subdataWithRange:NSMakeRange(offset, 7)]]; 
		offset += 7; 
	}
	
	*byteOffset = offset;
	
	return object;
}

@end
