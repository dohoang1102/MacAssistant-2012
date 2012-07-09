//
//  ColourSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/14.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ColourSaver.h"

@implementation ColourSaver

+ (void)saveColour:(Colour *)object toData:(NSMutableData *)data extended:(BOOL)extended
{
	BOOL bbuffer;
	char cbuffer;
	short sbuffer;
	int ibuffer;
	
	sbuffer = [object foreground];
	[data appendBytes:&sbuffer length:2];
	sbuffer = [object background];
	[data appendBytes:&sbuffer length:2];
	sbuffer = [object trim];
	[data appendBytes:&sbuffer length:2];
	
	if (extended) {
		sbuffer = [object number];
		[data appendBytes:&sbuffer length:2];
		sbuffer = [object numberTrim];
		[data appendBytes:&sbuffer length:2];
	}
	cbuffer = [object kitStyle];
	[data appendBytes:&cbuffer length:1];
	
	if (extended) {
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
}

@end
