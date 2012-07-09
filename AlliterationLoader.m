//
//  AlliterationLoader.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/24.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "AlliterationLoader.h"

@implementation Loader (AlliterationLoader)

+ (id)readAlliterationFromData:(NSData *)data atOffset:(unsigned int *)byteOffset
{
	Alliteration *object = [[Alliteration alloc] init];
	
	[object setName:[FMString readFromData:data atOffset:byteOffset]];
	
	return object;
}

@end
