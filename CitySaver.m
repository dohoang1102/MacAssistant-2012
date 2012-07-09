//
//  CitySaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/14.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "CitySaver.h"
#import "FMString.h"

@implementation CitySaver

+ (void)saveCity:(City *)object toData:(NSMutableData *)data
{
	char cbuffer;
	short sbuffer;
	float fbuffer;
	int ibuffer;
	
	cbuffer = [object databaseClass];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object nameGender];
	[data appendBytes:&cbuffer length:1];
	fbuffer = [object latitude];
	[data appendBytes:&fbuffer length:4];
	fbuffer = [object longitude];
	[data appendBytes:&fbuffer length:4];
	cbuffer = [object attraction];
	[data appendBytes:&cbuffer length:1];
	ibuffer = [object nationID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object weatherID];
	[data appendBytes:&ibuffer length:4];
	[FMString saveString:[object citizensName] toData:data];
	cbuffer = [object citizensNameGender];
	[data appendBytes:&cbuffer length:1];
	sbuffer = [object altitude];
	[data appendBytes:&sbuffer length:2];
	cbuffer = [object inhabitants];
	[data appendBytes:&cbuffer length:1];
	ibuffer = [object spokenLanguageID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object localAreaID];
	[data appendBytes:&ibuffer length:4];
	cbuffer = [object unknownChar1];
	[data appendBytes:&cbuffer length:1];
	ibuffer = [object rowID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object UID];
	[data appendBytes:&ibuffer length:4];
}

@end
