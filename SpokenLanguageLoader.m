//
//  SpokenLanguageLoader.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/17.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "SpokenLanguageLoader.h"


@implementation SpokenLanguageLoader

+ (SpokenLanguage *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset
{
	char cbuffer;
	int ibuffer;
	
	unsigned int offset = *byteOffset;
	
	SpokenLanguage *object = [[SpokenLanguage alloc] init];
	
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setLanguageID:ibuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setSpeakersPercentage:cbuffer];
	
	*byteOffset = offset;
	
	return object;
}

@end
