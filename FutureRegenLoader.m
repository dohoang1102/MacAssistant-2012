//
//  FutureRegenLoader.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/16.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "FutureRegenLoader.h"
#import "FMString.h"

@implementation FutureRegenLoader


+ (FutureRegen *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset
{
	char cbuffer;
	int ibuffer;
	
	unsigned int offset = *byteOffset;
	
	FutureRegen *object = [[FutureRegen alloc] init];
	
	[object setFirstName:[FMString readFromData:data atOffset:&offset]];
	[object setSurname:[FMString readFromData:data atOffset:&offset]];
	[object setCommonName:[FMString readFromData:data atOffset:&offset]];
	
	// ???
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar:cbuffer];
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setBirthDay:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setBirthMonth:cbuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setFavouriteClub:ibuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setAge:cbuffer];
	
	// ???
	[object setUnknownData1:[data subdataWithRange:NSMakeRange(offset, 14)]]; 
	offset += 14;
	
	*byteOffset = offset;
	
	return object;
}

@end
