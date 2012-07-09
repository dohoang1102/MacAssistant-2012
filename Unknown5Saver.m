//
//  Unknown5Saver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 10/01/15.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Unknown5Saver.h"

@implementation Unknown5Saver

+ (void)saveUnknown:(Unknown5 *)object toData:(NSMutableData *)data
{
	char cbuffer;
	int ibuffer;
	
	ibuffer = [object unknownInt];
	[data appendBytes:&ibuffer length:4];
	cbuffer = [object unknownChar1];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object unknownChar2];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object unknownChar3];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object unknownChar4];
	[data appendBytes:&cbuffer length:1];
}

@end
