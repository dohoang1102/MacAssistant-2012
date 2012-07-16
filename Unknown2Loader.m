//
//  Unknown2Loader.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/27.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Unknown2Loader.h"
#import "FMDateLoader.h"
#import "FMString.h"

@implementation Unknown2Loader

+ (Unknown2 *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset
{
	char cbuffer;
	int ibuffer;
	
	unsigned int offset = *byteOffset;
	
	Unknown2 *object = [[Unknown2 alloc] init];
	
	[object setFirstName:[FMString readFromData:data atOffset:&offset]];
	[object setSurname:[FMString readFromData:data atOffset:&offset]];
	[object setCommonName:[FMString readFromData:data atOffset:&offset]];
	
	// dob?
	[object setUnknownDate:[FMDateLoader readFromData:data atOffset:&offset]];
	
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setUnknownInt1:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setUnknownInt2:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setUnknownInt3:ibuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar1:cbuffer];
	//[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	//[object setUnknownChar2:cbuffer];
	
	[object setBusinessName:[FMString readFromData:data atOffset:&offset]];
	
	*byteOffset = offset;
	
	return object;
}

@end
