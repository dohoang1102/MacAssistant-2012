//
//  Unknown1Saver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/23.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Unknown1Saver.h"

@implementation Unknown1Saver

+ (void)saveUnknown:(Unknown1 *)object toData:(NSMutableData *)data
{
	char cbuffer;
	int ibuffer;
	
	cbuffer = [object unknownChar1];
	[data appendBytes:&cbuffer length:1];
	ibuffer = [object unknownInt];
	[data appendBytes:&ibuffer length:4];
	cbuffer = [object unknownChar2];
	[data appendBytes:&cbuffer length:1];
}

@end
