//
//  ContractBonusLoader.m
//  FM11SX
//
//  Created by Amy Kettlewell on 10/11/15.
//  Copyright 2010 littleblue. All rights reserved.
//

#import "ContractBonusLoader.h"

@implementation ContractBonusLoader

+ (ContractBonus *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset
{
	char cbuffer;
	int ibuffer;
	
	unsigned int offset = *byteOffset;
	
	ContractBonus *object = [[ContractBonus alloc] init];
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setType:cbuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setFee:ibuffer];
	
	if (cbuffer>CBT_MAX) { NSLog(@"CBT: %d - fee: %i",cbuffer, ibuffer); }
	
	*byteOffset = offset;
	
	return object;
}

@end
