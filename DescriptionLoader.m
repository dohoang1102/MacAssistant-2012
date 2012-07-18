//
//  DescriptionLoader.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/04.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "DescriptionLoader.h"


@implementation Loader (DescriptionLoader)

+ (Description *)readDescriptionFromData:(NSData *)data atOffset:(unsigned int *)byteOffset
{
	char cbuffer;
	int ibuffer;
	
	unsigned int offset = *byteOffset;
	
	Description *object = [[Description alloc] init];
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setDatabaseClass:cbuffer];
	
	// ???
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar1:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar2:cbuffer];
	
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setRowID:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 8; // FM 2012 Double ID
	[object setUID:ibuffer];
	
	*byteOffset = offset;
	
	return object;
}

@end
