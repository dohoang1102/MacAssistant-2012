//
//  PlayerAndNonPlayerLoader.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/21.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PlayerAndNonPlayerLoader.h"


@implementation PlayerAndNonPlayerLoader

+ (PlayerAndNonPlayer *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset
{
	char cbuffer;
	
	unsigned int offset = *byteOffset;
	
	PlayerAndNonPlayer *object = [[PlayerAndNonPlayer alloc] init];
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setNonPlayerClubJob:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setNonPlayerNationalJob:cbuffer];
	
	*byteOffset = offset;
	
	return object;
}

@end
