//
//  PlayerAndNonPlayerSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 10/07/25.
//  Copyright 2010 littleblue. All rights reserved.
//

#import "PlayerAndNonPlayerSaver.h"

@implementation PlayerAndNonPlayerSaver

+ (void)savePlayerAndNonPlayer:(PlayerAndNonPlayer *)object toData:(NSMutableData *)data
{
	char cbuffer;
	
	cbuffer = [object nonPlayerClubJob];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object nonPlayerNationalJob];
	[data appendBytes:&cbuffer length:1];
}

@end
