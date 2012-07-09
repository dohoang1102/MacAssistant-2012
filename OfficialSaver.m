//
//  OfficialSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 10/07/25.
//  Copyright 2010 littleblue. All rights reserved.
//

#import "OfficialSaver.h"
#import "OfficialPastGameSaver.h"
#import "FMDateSaver.h"

@implementation OfficialSaver

+ (void)saveOfficial:(Official *)object toData:(NSMutableData *)data
{
	char cbuffer;
	short sbuffer;
	int ibuffer;
	BOOL bbuffer;
	
	ibuffer = [object cityID];
	[data appendBytes:&ibuffer length:4];
	sbuffer = [object currentAbility];
	[data appendBytes:&sbuffer length:2];
	sbuffer = [object potentialAbility];
	[data appendBytes:&sbuffer length:2];
	sbuffer = [object reputation];
	[data appendBytes:&sbuffer length:2];
	cbuffer = [object allowingFlow];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object discipline];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object importantMatches];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object pressure];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object refereeing];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object runningLine];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object timekeeping];
	[data appendBytes:&cbuffer length:1];
	bbuffer = [object FIFAOfficial];
	[data appendBytes:&bbuffer length:1];
	bbuffer = [object continentalOfficial];
	[data appendBytes:&bbuffer length:1];
	bbuffer = [object assistantRefereeOnly];
	[data appendBytes:&bbuffer length:1];
	
	cbuffer = [[object pastGames] count];
	[data appendBytes:&cbuffer length:1];
	for (int i = 0; i<[[object pastGames] count]; i++) {
		[OfficialPastGameSaver savePastGame:[[object pastGames] objectAtIndex:i] toData:data];
	}
	
	cbuffer = [[object competitionsAsReferee] count];
	[data appendBytes:&cbuffer length:1];
	for (int i = 0; i<[[object competitionsAsReferee] count]; i++) {
		ibuffer = [[[object competitionsAsReferee] objectAtIndex:i] intValue];
		[data appendBytes:&ibuffer length:4];
	}
	
	cbuffer = [[object competitionsAsAssistant] count];
	[data appendBytes:&cbuffer length:1];
	for (int i = 0; i<[[object competitionsAsAssistant] count]; i++) {
		ibuffer = [[[object competitionsAsAssistant] objectAtIndex:i] intValue];
		[data appendBytes:&ibuffer length:4];
	}
	
	[FMDateSaver saveDate:[object unknownDate1] toData:data];
}

@end
