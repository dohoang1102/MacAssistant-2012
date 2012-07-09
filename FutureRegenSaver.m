//
//  FutureRegenSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 10/01/15.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "FutureRegenSaver.h"
#import "FMString.h"

@implementation FutureRegenSaver

+ (void)saveRegen:(FutureRegen *)object toData:(NSMutableData *)data
{
	char cbuffer;
	int ibuffer;
	
	[FMString saveString:[object firstName] toData:data];
	[FMString saveString:[object surname] toData:data];
	[FMString saveString:[object commonName] toData:data];
	
	cbuffer = [object unknownChar];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object birthDay];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object birthMonth];
	[data appendBytes:&cbuffer length:1];
	ibuffer = [object favouriteClub];
	[data appendBytes:&ibuffer length:4];
	cbuffer = [object age];
	[data appendBytes:&cbuffer length:1];
	
	[data appendData:[object unknownData1]];
}

@end
