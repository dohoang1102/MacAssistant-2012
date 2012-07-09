//
//  SponsorSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 10/01/15.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SponsorSaver.h"
#import "FMString.h"

@implementation SponsorSaver

+ (void)saveSponsor:(Sponsor *)object toData:(NSMutableData *)data
{
	char cbuffer;
	int ibuffer;
	
	cbuffer = [object databaseClass];
	[data appendBytes:&cbuffer length:1];
	[FMString saveString:[object name] toData:data];
	cbuffer = [object nameGender];
	[data appendBytes:&cbuffer length:1];
	[FMString saveString:[object businessName] toData:data];
	cbuffer = [object businessNameGender];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object businessType];
	[data appendBytes:&cbuffer length:1];
	ibuffer = [object rowID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object UID];
	[data appendBytes:&ibuffer length:4];
}

@end
