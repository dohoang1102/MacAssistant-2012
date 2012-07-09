//
//  AgentLoader.m
//  FM11SX
//
//  Created by Amy Kettlewell on 10/11/15.
//  Copyright 2010 littleblue. All rights reserved.
//

#import "AgentLoader.h"
#import "FMDateLoader.h"

@implementation AgentLoader

+ (Agent *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset
{
	NSMutableArray *tempArray;
	char cbuffer;
	int ibuffer, count;
	BOOL debug = NO;
	
	unsigned int offset = *byteOffset;
	
	Agent *object = [[Agent alloc] init];
	
	if (debug) { NSLog(@"in agent at %d",offset); }
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setScope:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setPatience:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setAgentFeeDemands:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setWillingnessToToutPlayers:cbuffer];
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar1:cbuffer];
	[object setUnknownDate1:[FMDateLoader readFromData:data atOffset:&offset]];
	
	
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setBasedNationID:ibuffer];
	
	if (debug) { NSLog(@"agent clients at %d",offset); }
	
	[data getBytes:&count range:NSMakeRange(offset, 4)]; offset += 4;
	tempArray = [[NSMutableArray alloc] init];
	for (int i=0;i<count;i++) {
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[tempArray addObject:[NSNumber numberWithInt:ibuffer]];
	}
	[object setClients:tempArray];
	[tempArray release];
	
	*byteOffset = offset;
	
	return object;
}

@end
