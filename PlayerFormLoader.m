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
	int ibuffer;
	NSMutableArray *tempArray;
	
	unsigned int offset = *byteOffset;
	
	PlayerForm *object = [[PlayerForm alloc] init];
	
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setTeamID:ibuffer];
	
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	tempArray = [[NSMutableArray alloc] init];
	for (int i=0;i<ibuffer;i++) {
		[tempArray addObject:[MatchFormLoader readFromData:data atOffset:&offset]];
	}
	[object setMatchForms:tempArray];
	[tempArray release];
	
	*byteOffset = offset;
	
	return object;
}

@end
