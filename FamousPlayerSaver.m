//
//  FamousPlayerSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 10/01/15.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "FamousPlayerSaver.h"

@implementation FamousPlayerSaver

+ (void)savePlayer:(FamousPlayer *)object toData:(NSMutableData *)data
{
	char cbuffer;
	int ibuffer;
	
	ibuffer = [object personID];
	[data appendBytes:&ibuffer length:4];
	cbuffer = [object unknownChar1];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object unknownChar2];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object unknownChar3];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object unknownChar4];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object unknownChar5];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object unknownChar6];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object unknownChar7];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object unknownChar8];
	[data appendBytes:&cbuffer length:1];
}

@end
