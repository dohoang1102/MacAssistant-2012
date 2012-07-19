//
//  ContractOfferLoader.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/21.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ContractOfferLoader.h"
#import "ContractLoader.h"
#import "FMDateLoader.h"

@implementation ContractOfferLoader

+ (ContractOffer *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset version:(short)version
{
	char cbuffer;
	int ibuffer;
	
	unsigned int offset = *byteOffset;
	
	ContractOffer *object = [[ContractOffer alloc] init];
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setType:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setDecision:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setWorkPermitState:cbuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setTransferOfferIndex:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setWeeklyWageFromOldClub:ibuffer];
	[object setContract:[ContractLoader readFromData:data atOffset:&offset type:[object type] version:version]];
	
	// ???
	[object setUnknownData1:[data subdataWithRange:NSMakeRange(offset, 6)]]; 
	offset += 6;
	
	[object setUnknownDate1:[FMDateLoader readFromData:data atOffset:&offset]];
	
	// ???
	[object setUnknownData2:[data subdataWithRange:NSMakeRange(offset, 7)]]; 
	offset += 7;
	
	*byteOffset = offset;
	
	return object;
}

@end
