//
//  TransferPreferenceLoader.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/16.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TransferPreferenceLoader.h"

@implementation TransferPreferenceLoader

+ (TransferPreference *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset
{
	char cbuffer;
	int ibuffer;
	
	unsigned int offset = *byteOffset;
	
	TransferPreference *object = [[TransferPreference alloc] init];
	
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setNationID:ibuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setRating:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setScoutingKnowledge:cbuffer];
    // FM2012 NEW
    offset += 1; // Minimum Age
    offset += 1; // Maximum Age
	
	*byteOffset = offset;
	
	return object;
}

@end
