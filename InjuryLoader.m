//
//  InjuryLoader.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/31.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "InjuryLoader.h"


@implementation Loader (InjuryLoader)

+ (Injury *)readInjuryFromData:(NSData *)data atOffset:(unsigned int *)byteOffset
{
	char cbuffer;
	short sbuffer;
	float fbuffer;
	int ibuffer;
	
	unsigned int offset = *byteOffset;
	
	Injury *object = [[Injury alloc] init];
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setDatabaseClass:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setCategory:cbuffer];
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setMinimumDays:sbuffer];
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setExtraDays:sbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setInactiveRatio:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setRecurring:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setNameGender:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setSentenceNameGender:cbuffer];
	[data getBytes:&fbuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setOccurrenceRatio:fbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setMatchInjuryPercentage:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setCause:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setAgeRule:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setSeason:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setContagious:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setSeriousness:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setGoalkeeperPercentage:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setCentralDefenderPercentage:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setTreatmentFlags:cbuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setRowID:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 8; // FM 2012 Double ID
	[object setUID:ibuffer];
	
	*byteOffset = offset;
	
	return object;
}

@end
