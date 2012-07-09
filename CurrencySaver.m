//
//  CurrencySaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/18.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "CurrencySaver.h"
#import "FMString.h"

@implementation CurrencySaver

+ (void)saveCurrency:(Currency *)object toData:(NSMutableData *)data
{
	char cbuffer;
	float fbuffer;
	int ibuffer;
	
	cbuffer = [object databaseClass];
	[data appendBytes:&cbuffer length:1];
	[FMString saveString:[object name] toData:data];
	[FMString saveString:[object shortName] toData:data];
	[FMString saveString:[object threeLetterName] toData:data];
	[FMString saveString:[object symbol] toData:data];
	fbuffer = [object exchangeRate];
	[data appendBytes:&fbuffer length:4];
	fbuffer = [object approxExchangeRate];
	[data appendBytes:&fbuffer length:4];
	fbuffer = [object veryApproxExchangeRate];
	[data appendBytes:&fbuffer length:4];
	ibuffer = [object rowID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object UID];
	[data appendBytes:&ibuffer length:4];
}

@end
