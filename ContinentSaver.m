//
//  ContinentSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/18.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ContinentSaver.h"
#import "GeneralInfoSaver.h"

@implementation ContinentSaver

+ (void)saveContinent:(Continent *)object toData:(NSMutableData *)data
{
	BOOL bbuffer;
	char cbuffer;
	float fbuffer;
	int ibuffer;
	
	cbuffer = [object databaseClass];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object nameGender];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object federationNameGender];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object shortFederationNameGender];
	[data appendBytes:&cbuffer length:1];
	fbuffer = [object regionalStrength];
	[data appendBytes:&fbuffer length:4];
	cbuffer = [object unknownChar1];
	[data appendBytes:&cbuffer length:1];
	
	bbuffer = [object hasInfos];
	[data appendBytes:&bbuffer length:1];
	if ([object hasInfos]) {
		ibuffer = [[object infos] count];
		[data appendBytes:&ibuffer length:4];
		for (int i = 0; i<[[object infos] count]; i++) {
			[GeneralInfoSaver saveInfo:[[object infos] objectAtIndex:i] toData:data saveInfo:NO];
		}
	}
	
	ibuffer = [object rowID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object UID];
	[data appendBytes:&ibuffer length:4];
}

@end
