//
//  LocationDaysLoader.m
//  FM11SX
//
//  Created by Amy Kettlewell on 10/11/15.
//  Copyright 2010 littleblue. All rights reserved.
//

#import "LocationDaysLoader.h"

@implementation LocationDaysLoader

+ (LocationDays *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset
{
	BOOL bbuffer;
	short sbuffer;
	int ibuffer;
	
	unsigned int offset = *byteOffset;
	
	LocationDays *object = [[LocationDays alloc] init];
	
	[data getBytes:&bbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setBetween15And21Only:bbuffer];
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setDays:sbuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setTeamID:ibuffer];
	
	*byteOffset = offset;
	
	return object;
}

@end
