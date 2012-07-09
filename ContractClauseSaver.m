//
//  ContractClauseSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 10/07/25.
//  Copyright 2010 littleblue. All rights reserved.
//

#import "ContractClauseSaver.h"


@implementation ContractClauseSaver

+ (void)saveClause:(ContractClause *)object toData:(NSMutableData *)data
{
	char cbuffer;
	int ibuffer;
	
	cbuffer = [object type];
	[data appendBytes:&cbuffer length:1];
	ibuffer = [object fee];
	[data appendBytes:&ibuffer length:4];
	cbuffer = [object info];
	[data appendBytes:&cbuffer length:1];
}

@end
