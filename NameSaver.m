//
//  NameSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/18.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "NameSaver.h"
#import "FMString.h"

@implementation NameSaver

+ (void)saveName:(Name *)object toData:(NSMutableData *)data
{
	char cbuffer;
	short sbuffer;
	int ibuffer;
	
	cbuffer = [object databaseClass];
	[data appendBytes:&cbuffer length:1];
	[FMString saveString:[object name] toData:data];
	sbuffer = [object count];
	[data appendBytes:&sbuffer length:2];
	cbuffer = [object unknownChar];
	[data appendBytes:&cbuffer length:1];
	ibuffer = [object nationID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object rowID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object UID];
	[data appendBytes:&ibuffer length:4];
}

@end
