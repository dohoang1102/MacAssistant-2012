//
//  Unknown4Saver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 10/01/07.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Unknown4Saver.h"


@implementation Unknown4Saver

+ (void)saveUnknown:(Unknown4 *)object toData:(NSMutableData *)data
{
	char cbuffer;
	short sbuffer;
	
	sbuffer = [object year];
	[data appendBytes:&sbuffer length:2];
	cbuffer = [object unknownChar1];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object unknownChar2];
	[data appendBytes:&cbuffer length:1];
}

@end
