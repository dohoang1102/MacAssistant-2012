//
//  IDPCLoader.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/25.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "IDPCLoader.h"
#import "FMDateLoader.h"

@implementation IDPCLoader

+ (IDPC *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset
{
	char cbuffer;
	
	unsigned int offset = *byteOffset;
	
	IDPC *object = [[IDPC alloc] init];
	
	[object setDate:[FMDateLoader readFromData:data atOffset:&offset]];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setPlayerCount:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar1:cbuffer];
	
	*byteOffset = offset;
	
	return object;
}

@end
