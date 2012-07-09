//
//  ShortlistedPersonLoader.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/25.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "FMDateLoader.h"
#import "ShortlistedPersonLoader.h"

@implementation ShortlistedPersonLoader

+ (ShortlistedPerson *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset
{
	int ibuffer;
	
	unsigned int offset = *byteOffset;
	
	ShortlistedPerson *object = [[ShortlistedPerson alloc] init];
	
	[object setFromDate:[FMDateLoader readFromData:data atOffset:&offset]];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setPersonID:ibuffer];
	
	*byteOffset = offset;
	
	return object;
}

@end
