//
//  AlternativeKitLoader.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/14.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "AlternativeKitLoader.h"
#import "ColourLoader.h"

@implementation AlternativeKitLoader

+ (id)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset
{
	char cbuffer;
	short sbuffer;
	int ibuffer;
	
	unsigned int offset = *byteOffset;
	
	AlternativeKit *object = [[AlternativeKit alloc] init];
	
	id colour = [ColourLoader readColourFromData:data atOffset:&offset extended:YES];
	if ([[colour className] isEqualToString:@"Colour"]) {
		[object setColour:colour];
	}
	else { return [NSString stringWithFormat:@"Colour - %@",colour]; }
	
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
	
	*byteOffset = offset;
	
	return object;
}

@end
