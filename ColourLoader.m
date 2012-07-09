//
//  ColourLoader.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/25.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ColourLoader.h"

@implementation ColourLoader

+ (id)readColourFromData:(NSData *)data atOffset:(unsigned int *)byteOffset extended:(BOOL)extended
{
	unsigned short sbuffer;
	char cbuffer;
	int ibuffer;
	
	unsigned int offset = *byteOffset;
	
	Colour *object = [[Colour alloc] init];
	
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setForeground:sbuffer];
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setBackground:sbuffer];
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setTrim:sbuffer];
	if (extended) {
		[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
		[object setNumber:sbuffer];
		[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
		[object setNumberTrim:sbuffer];
	}
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setKitStyle:cbuffer];
	if ([object kitStyle]>KS_MAX) { 
		return [NSString stringWithFormat:@"Invalid kit style - %d",[object kitStyle]]; 
	}
	if (extended) {
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setKitNumber:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setOutfieldKit:cbuffer];
		[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
		[object setYear:sbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setType:cbuffer];
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setCompetitionUID:ibuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setAlternativeKitNumber:cbuffer];
	}
	
	*byteOffset = offset;
	
	return object;
}

@end
