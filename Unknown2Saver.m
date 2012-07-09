//
//  Unknown2Saver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 10/01/15.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Unknown2Saver.h"
#import "FMString.h"
#import "FMDateSaver.h"

@implementation Unknown2Saver

+ (void)saveUnknown:(Unknown2 *)object toData:(NSMutableData *)data
{
	char cbuffer;
	int ibuffer;
	
	[FMString saveString:[object firstName] toData:data];
	[FMString saveString:[object surname] toData:data];
	[FMString saveString:[object commonName] toData:data];
	[FMDateSaver saveDate:[object unknownDate] toData:data];
	
	ibuffer = [object unknownInt1];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object unknownInt2];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object unknownInt3];
	[data appendBytes:&ibuffer length:4];
	cbuffer = [object unknownChar1];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object unknownChar2];
	[data appendBytes:&cbuffer length:1];
	[FMString saveString:[object businessName] toData:data];
}

@end
