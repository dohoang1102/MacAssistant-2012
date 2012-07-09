//
//  RetiredPersonLoader.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/22.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "RetiredPersonLoader.h"
#import "FMString.h"

@implementation RetiredPersonLoader

+ (RetiredPerson *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset
{
	char cbuffer;
	
	unsigned int offset = *byteOffset;
	
	RetiredPerson *object = [[RetiredPerson alloc] init];
	
	[object setFirstName:[FMString readFromData:data atOffset:&offset]];
	[object setSurname:[FMString readFromData:data atOffset:&offset]];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setJob:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar1:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar2:cbuffer];
	
	
	*byteOffset = offset;
	
	return object;
}

@end
