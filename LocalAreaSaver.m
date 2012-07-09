//
//  LocalAreaSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 10/01/15.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "LocalAreaSaver.h"

@implementation LocalAreaSaver

+ (void)saveArea:(LocalArea *)object toData:(NSMutableData *)data
{
	char cbuffer;
	int ibuffer;
	
	cbuffer = [object databaseClass];
	[data appendBytes:&cbuffer length:1];
	ibuffer = [object nationID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object languageID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object population];
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
	cbuffer = [object unknownChar9];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object unknownChar10];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object unknownChar11];
	[data appendBytes:&cbuffer length:1];
	
	ibuffer = [object rowID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object UID];
	[data appendBytes:&ibuffer length:4];
}

@end
