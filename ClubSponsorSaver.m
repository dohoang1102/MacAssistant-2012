//
//  ClubSponsorSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/23.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ClubSponsorSaver.h"
#import "FMDateSaver.h"
#import "FMString.h"

@implementation ClubSponsorSaver

+ (void)saveSponsor:(ClubSponsor *)object toData:(NSMutableData *)data
{
	BOOL bbuffer;
	char cbuffer;
	int ibuffer;
	
	cbuffer = [object type];
	[data appendBytes:&cbuffer length:1];
	[FMDateSaver saveDate:[object startDate] toData:data];
	[FMDateSaver saveDate:[object endDate] toData:data];
	bbuffer = [object renewIncome];
	[data appendBytes:&bbuffer length:1];
	[FMString saveString:[object name] toData:data];
	ibuffer = [object cash];
	[data appendBytes:&ibuffer length:4];
	cbuffer = [object unknownChar1];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object unknownChar2];
	[data appendBytes:&cbuffer length:1];
	bbuffer = [object fixedValue];
	[data appendBytes:&bbuffer length:1];
	cbuffer = [object unknownChar3];
	[data appendBytes:&cbuffer length:1];
}

@end
