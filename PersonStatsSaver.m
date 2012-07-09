//
//  PersonStatsSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 10/07/26.
//  Copyright 2010 littleblue. All rights reserved.
//

#import "PersonStatsSaver.h"

@implementation PersonStatsSaver

+ (void)saveStats:(PersonStats *)object toData:(NSMutableData *)data
{
	char cbuffer;
	int ibuffer;
	
	cbuffer = [object databaseClass];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object adaptability];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object ambition];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object loyalty];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object pressure];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object professionalism];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object sportsmanship];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object temperament];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object controversy];
	[data appendBytes:&cbuffer length:1];
	ibuffer = [object rowID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object UID];
	[data appendBytes:&ibuffer length:4];
}

@end
