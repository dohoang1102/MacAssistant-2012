//
//  BookingCountLoader.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/21.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "BookingCountLoader.h"


@implementation BookingCountLoader

+ (BookingCount *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset
{
	char cbuffer;
	short sbuffer;
	
	unsigned int offset = *byteOffset;
	
	BookingCount *object = [[BookingCount alloc] init];
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setType:cbuffer];
	
	if ([object type]==PBC_BASE_TYPE) {
		[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
		[object setDisciplineRulesIndex:sbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setYellowCards:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setRedCards:cbuffer];
	}
	else if ([object type]==PBC_POINTS_TYPE) {
		[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
		[object setPoints:sbuffer];
		[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
		[object setDisciplineRulesIndex:sbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setYellowCards:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setRedCards:cbuffer];
	}
	else if ([object type]==PBC_LAST_10_GAMES_TYPE) {
		[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
		[object setLast10Games:sbuffer];
		[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
		[object setDisciplineRulesIndex:sbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setYellowCards:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setRedCards:cbuffer];
	}
	else if ([object type]==PBC_LAST_3_SEASONS_TYPE) {
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setSeason1:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setSeason2:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setSeason3:cbuffer];
		[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
		[object setPoints:sbuffer];
		[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
		[object setDisciplineRulesIndex:sbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setYellowCards:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setRedCards:cbuffer];
	}
	else if ([object type]==PBC_LAST_5_GAMES_TYPE) {
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setLast5Games:cbuffer];
		[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
		[object setDisciplineRulesIndex:sbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setYellowCards:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setRedCards:cbuffer];
	}
	else {
		NSAlert *alert = [NSAlert alertWithMessageText:@"Invalid Booking Count Type" defaultButton:@"OK" alternateButton:nil 
										   otherButton:nil informativeTextWithFormat:@"Unknown BookingCount Type - %d at offset %d",[object type],offset];
		[alert runModal];
	}
	
	*byteOffset = offset;
	
	return object;
}

@end
