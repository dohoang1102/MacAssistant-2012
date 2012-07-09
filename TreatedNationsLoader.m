//
//  TreatedNationsLoader.m
//  FM11SX
//
//  Created by Amy Kettlewell on 10/11/18.
//  Copyright 2010 littleblue. All rights reserved.
//

#import "TreatedNationsLoader.h"

@implementation TreatedNationsLoader

+ (TreatedNations *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset
{
	int ibuffer;
	
	unsigned int offset = *byteOffset;
	
	TreatedNations *object = [[TreatedNations alloc] init];
	
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setNationID:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setContinentID:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setExcludedNationID:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setRegionID:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setAgreementID:ibuffer];
	
	*byteOffset = offset;
	
	return object;
}

@end
