//
//  Unknown7Saver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 10/01/15.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Unknown7Saver.h"


@implementation Unknown7Saver

+ (void)saveUnknown:(Unknown7 *)object toData:(NSMutableData *)data
{
	char cbuffer;
	int ibuffer;
	
	cbuffer = [object databaseClass];
	[data appendBytes:&cbuffer length:1];
	
	[data appendData:[object unknownData]];
	
	ibuffer = [object rowID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object UID];
	[data appendBytes:&ibuffer length:4];
}

@end
