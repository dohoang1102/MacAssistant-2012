//
//  AlternativeKitSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/23.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "AlternativeKitSaver.h"
#import "ColourSaver.h"

@implementation AlternativeKitSaver

+ (void)saveKit:(AlternativeKit *)object toData:(NSMutableData *)data
{
	short sbuffer;
	char cbuffer;
	BOOL bbuffer;
	int ibuffer;
	
	[ColourSaver saveColour:[object colour] toData:data extended:YES];
	cbuffer = [object kitNumber];
	[data appendBytes:&cbuffer length:1];
	bbuffer = [object outfieldKit];
	[data appendBytes:&bbuffer length:1];
	sbuffer = [object year];
	[data appendBytes:&sbuffer length:2];
	cbuffer = [object type];
	[data appendBytes:&cbuffer length:1];
	ibuffer = [object competitionUID];
	[data appendBytes:&ibuffer length:4];
	cbuffer = [object alternativeKitNumber];
	[data appendBytes:&cbuffer length:1];
}

@end
