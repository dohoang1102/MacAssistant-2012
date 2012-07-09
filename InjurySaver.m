//
//  InjurySaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/31.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "InjurySaver.h"

@implementation InjurySaver

+ (void)saveInjury:(Injury *)object toData:(NSMutableData *)data
{
	char cbuffer;
	unsigned char ucbuffer;
	short sbuffer;
	float fbuffer;
	BOOL bbuffer;
	int ibuffer;
	
	cbuffer = [object databaseClass];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object category];
	[data appendBytes:&cbuffer length:1];
	sbuffer = [object minimumDays];
	[data appendBytes:&sbuffer length:2];
	sbuffer = [object extraDays];
	[data appendBytes:&sbuffer length:2];
	cbuffer = [object inactiveRatio];
	[data appendBytes:&cbuffer length:1];
	bbuffer = [object recurring];
	[data appendBytes:&bbuffer length:1];
	cbuffer = [object nameGender];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object sentenceNameGender];
	[data appendBytes:&cbuffer length:1];
	fbuffer = [object occurrenceRatio];
	[data appendBytes:&fbuffer length:4];
	cbuffer = [object matchInjuryPercentage];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object cause];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object ageRule];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object season];
	[data appendBytes:&cbuffer length:1];
	bbuffer = [object contagious];
	[data appendBytes:&bbuffer length:1];
	cbuffer = [object seriousness];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object goalkeeperPercentage];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object centralDefenderPercentage];
	[data appendBytes:&cbuffer length:1];
	ucbuffer = [object treatmentFlags];
	[data appendBytes:&ucbuffer length:1];
	ibuffer = [object rowID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object UID];
	[data appendBytes:&ibuffer length:4];
}

@end
