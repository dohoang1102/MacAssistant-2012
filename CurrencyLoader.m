//
//  CurrencyLoader.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/31.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "CurrencyLoader.h"
#import "FMString.h"

@implementation Loader (CurrencyLoader)

+ (Currency *)readCurrencyFromData:(NSData *)data atOffset:(unsigned int *)byteOffset
{
	char cbuffer;
	float fbuffer;
	int ibuffer;
	
	unsigned int offset = *byteOffset;
	
	Currency *object = [[Currency alloc] init];
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setDatabaseClass:cbuffer];
	[object setName:[FMString readFromData:data atOffset:&offset]];
	[object setShortName:[FMString readFromData:data atOffset:&offset]];
	[object setThreeLetterName:[FMString readFromData:data atOffset:&offset]];
	[object setSymbol:[FMString readFromData:data atOffset:&offset]];
	[data getBytes:&fbuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setExchangeRate:fbuffer];
	[data getBytes:&fbuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setApproxExchangeRate:fbuffer];
	[data getBytes:&fbuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setVeryApproxExchangeRate:fbuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setRowID:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setUID:ibuffer];
	
	*byteOffset = offset;
	
	return object;
}

@end
