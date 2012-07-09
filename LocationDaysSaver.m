//
//  LocationDaysSaver.m
//  FM11SX
//
//  Created by Amy Kettlewell on 10/11/27.
//  Copyright 2010 littleblue. All rights reserved.
//

#import "LocationDaysSaver.h"


@implementation LocationDaysSaver

+ (void)saveDays:(LocationDays *)object toData:(NSMutableData *)data
{
	BOOL bbuffer;
	short sbuffer;
	int ibuffer;
	
	bbuffer = [object between15And21Only];
	[data appendBytes:&bbuffer length:1];
	sbuffer = [object days];
	[data appendBytes:&sbuffer length:2];
	ibuffer = [object teamID];
	[data appendBytes:&ibuffer length:4];
}

@end
