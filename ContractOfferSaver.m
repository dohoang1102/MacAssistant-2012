//
//  ContractOfferSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 10/07/25.
//  Copyright 2010 littleblue. All rights reserved.
//

#import "ContractOfferSaver.h"
#import "FMDateSaver.h"
#import "ContractSaver.h"

@implementation ContractOfferSaver

+ (void)saveContractOffer:(ContractOffer *)object toData:(NSMutableData *)data
{
	char cbuffer;
	int ibuffer;
	
	cbuffer = [object type];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object decision];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object workPermitState];
	[data appendBytes:&cbuffer length:1];
	ibuffer = [object transferOfferIndex];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object weeklyWageFromOldClub];
	[data appendBytes:&ibuffer length:4];
	[ContractSaver saveContract:[object contract] toData:data type:[object type] offer:YES];
	[data appendData:[object unknownData1]];
	[FMDateSaver saveDate:[object unknownDate1] toData:data];
	[data appendData:[object unknownData2]];
}

@end
