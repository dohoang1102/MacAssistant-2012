//
//  ContractBonusSaver.m
//  FM11SX
//
//  Created by Amy Kettlewell on 10/11/27.
//  Copyright 2010 littleblue. All rights reserved.
//

#import "ContractBonusSaver.h"


@implementation ContractBonusSaver

+ (void)saveBonus:(ContractBonus *)object toData:(NSMutableData *)data
{
	char cbuffer;
	int ibuffer;
	
	cbuffer = [object type];
	[data appendBytes:&cbuffer length:1];
	ibuffer = [object fee];
	[data appendBytes:&ibuffer length:4];
}

@end
