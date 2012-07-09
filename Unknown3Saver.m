//
//  Unknown3Saver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/31.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Unknown3Saver.h"
#import "FMDateSaver.h"

@implementation Unknown3Saver

+ (void)saveUnknown:(Unknown3 *)object toData:(NSMutableData *)data
{
	char cbuffer;
	short sbuffer;
	int ibuffer;
	
	ibuffer = [object teamID];
	[data appendBytes:&ibuffer length:4];
	sbuffer = [object year];
	[data appendBytes:&sbuffer length:2];
	cbuffer = [object unknownChar1];
	[data appendBytes:&cbuffer length:1];
}

@end
