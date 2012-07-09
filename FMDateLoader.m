//
//  FMDateLoader.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/11.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "FMDateLoader.h"

@implementation FMDateLoader

+ (FMDate *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset
{
	short sbuffer;
	
	unsigned int offset = *byteOffset;
	
	FMDate *object = [[FMDate alloc] init];
	
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setDay:sbuffer];
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setYear:sbuffer];
	
	*byteOffset = offset;
	
	return object;
}

@end
