//
//  PlayerFormLoader.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/21.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PlayerFormLoader.h"
#import "MatchFormLoader.h"

@implementation PlayerFormLoader

+ (PlayerForm *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset
{
	char cbuffer;
	int ibuffer;
	NSMutableArray *tempArray;
	
	unsigned int offset = *byteOffset;
	
	PlayerForm *object = [[PlayerForm alloc] init];
	
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setTeamID:ibuffer];
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	tempArray = [[NSMutableArray alloc] init];
	for (int i=0;i<cbuffer;i++) {
		[tempArray addObject:[MatchFormLoader readFromData:data atOffset:&offset]];
	}
	[object setMatchForms:tempArray];
	[tempArray release];
	
	*byteOffset = offset;
	
	return object;
}

@end
