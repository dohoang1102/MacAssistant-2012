//
//  ContractClauseLoader.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/20.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ContractClauseLoader.h"

@implementation ContractClauseLoader

+ (ContractClause *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset
{
	char cbuffer;
	int ibuffer;
	
	unsigned int offset = *byteOffset;
	
	ContractClause *object = [[ContractClause alloc] init];
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setType:cbuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setFee:ibuffer];
	
	// info - eg number of games before bonus
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setInfo:cbuffer];
	
	*byteOffset = offset;
	
	return object;
}

@end
