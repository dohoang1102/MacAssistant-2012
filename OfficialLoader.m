//
//  OfficialLoader.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/21.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "OfficialLoader.h"
#import "OfficialPastGameLoader.h"
#import "FMDateLoader.h"

@implementation OfficialLoader

+ (Official *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset
{
	char cbuffer;
	short sbuffer;
	int ibuffer;
	NSMutableArray *tempArray;
	
	unsigned int offset = *byteOffset;
	
	Official *object = [[Official alloc] init];
	
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setCityID:ibuffer];
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setCurrentAbility:sbuffer];
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setPotentialAbility:sbuffer];
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setReputation:sbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setAllowingFlow:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setDiscipline:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setImportantMatches:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setPressure:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setRefereeing:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setRunningLine:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setTimekeeping:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setFIFAOfficial:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setContinentalOfficial:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setAssistantRefereeOnly:cbuffer];
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	tempArray = [[NSMutableArray alloc] init];
	for (int i=0;i<cbuffer;i++) {
		[tempArray addObject:[OfficialPastGameLoader readFromData:data atOffset:&offset]];
	}
	[object setPastGames:tempArray];
	[tempArray release];
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	tempArray = [[NSMutableArray alloc] init];
	for (int i=0;i<cbuffer;i++) {
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[tempArray addObject:[NSNumber numberWithInt:ibuffer]];
	}
	[object setCompetitionsAsReferee:tempArray];
	[tempArray release];
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	tempArray = [[NSMutableArray alloc] init];
	for (int i=0;i<cbuffer;i++) {
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[tempArray addObject:[NSNumber numberWithInt:ibuffer]];
	}
	[object setCompetitionsAsAssistant:tempArray];
	[tempArray release];
	
	[object setUnknownDate1:[FMDateLoader readFromData:data atOffset:&offset]];
	
	*byteOffset = offset;
	
	return object;
}

@end
