//
//  AgentSaver.m
//  FM11SX
//
//  Created by Amy Kettlewell on 10/11/27.
//  Copyright 2010 littleblue. All rights reserved.
//

#import "AgentSaver.h"
#import "FMDateSaver.h"

@implementation AgentSaver

+ (void)saveAgent:(Agent *)object toData:(NSMutableData *)data
{
	char cbuffer;
	int ibuffer;
	
	cbuffer = [object scope];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object patience];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object agentFeeDemands];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object willingnessToToutPlayers];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object unknownChar1];
	[data appendBytes:&cbuffer length:1];
	[FMDateSaver saveDate:[object unknownDate1] toData:data];
	ibuffer = [object basedNationID];
	[data appendBytes:&ibuffer length:4];
	
	ibuffer = [[object clients] count];
	[data appendBytes:&ibuffer length:4];
	for (int i = 0; i<[[object clients] count]; i++) {
		ibuffer = [[[object clients] objectAtIndex:i] intValue];
		[data appendBytes:&ibuffer length:4];
	}
}

@end
