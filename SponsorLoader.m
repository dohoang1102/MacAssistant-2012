//
//  SponsorLoader.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/24.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "SponsorLoader.h"


@implementation Loader (SponsorLoader)

+ (Sponsor *)readSponsorFromData:(NSData *)data atOffset:(unsigned int *)byteOffset
{
	char cbuffer;
	int ibuffer;
	
	unsigned int offset = *byteOffset;
	
	Sponsor *object = [[Sponsor alloc] init];
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setDatabaseClass:cbuffer];
	[object setName:[FMString readFromData:data atOffset:&offset]];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setNameGender:cbuffer];
	[object setBusinessName:[FMString readFromData:data atOffset:&offset]];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setBusinessNameGender:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setBusinessType:cbuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setRowID:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 8; // FM 2012 Double ID
	[object setUID:ibuffer];
	
	*byteOffset = offset;
	
	return object;
}

@end
