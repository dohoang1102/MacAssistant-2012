//
//  PlayerReplacementSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 10/07/25.
//  Copyright 2010 EnjoyLocally.co.uk. All rights reserved.
//

#import "PlayerReplacementSaver.h"

@implementation PlayerReplacementSaver

+ (void)savePlayer:(PlayerReplacement *)object toData:(NSMutableData *)data
{
	BOOL bbuffer;
	int ibuffer;
	
	ibuffer = [object oldPlayerID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object newPlayerID];
	[data appendBytes:&ibuffer length:4];
	bbuffer = [object confirmed];
	[data appendBytes:&bbuffer length:1];
}

@end
