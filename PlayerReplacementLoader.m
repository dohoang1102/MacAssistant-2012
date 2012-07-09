//
//  PlayerReplacementLoader.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/17.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PlayerReplacementLoader.h"


@implementation PlayerReplacementLoader

+ (PlayerReplacement *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset
{
	char cbuffer;
	int ibuffer;
	
	unsigned int offset = *byteOffset;
	
	PlayerReplacement *object = [[PlayerReplacement alloc] init];
	
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setOldPlayerID:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setNewPlayerID:ibuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setConfirmed:cbuffer];
	
	*byteOffset = offset;
	
	return object;
}

@end
