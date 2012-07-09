//
//  ClubDebtLoader.m
//  FM10SX
//
//  Created by Amy Kettlewell on 10/10/17.
//  Copyright 2010 littleblue. All rights reserved.
//

#import "ClubDebtLoader.h"
#import "FMDateLoader.h"

@implementation Loader (ClubDebtLoader)

+ (ClubDebt *)readDebtFromData:(NSData *)data atOffset:(unsigned int *)byteOffset
{
	char cbuffer;
	float fbuffer;
	int ibuffer;
	
	unsigned int offset = *byteOffset;
	
	ClubDebt *object = [[ClubDebt alloc] init];
	
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setClubID:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setAmount:ibuffer];
	[data getBytes:&fbuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setInterestRate:fbuffer];
	[object setEndDate:[FMDateLoader readFromData:data atOffset:&offset]];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setSource:cbuffer];
	[object setStartDate:[FMDateLoader readFromData:data atOffset:&offset]];
	
	*byteOffset = offset;
	
	return object;
}

@end
