//
//  ScoutingKnowledgeLoader.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/25.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ScoutingKnowledgeLoader.h"
#import "FMDateLoader.h"
#import "GameVersions.h"

@implementation ScoutingKnowledgeLoader

+ (ScoutingKnowledge *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset version:(short)version
{
	char cbuffer;
	int ibuffer;
	
	unsigned int offset = *byteOffset;
	
	ScoutingKnowledge *object = [[ScoutingKnowledge alloc] init];
	
	// ???
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar1:cbuffer];
	
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setNationID:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setSourceStaffID:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setSourceClubID:ibuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setPercentComplete:cbuffer];
	
	// ???
	[object setDate:[FMDateLoader readFromData:data atOffset:&offset]];
	
	// recheck this
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setSourcePlayerID:ibuffer];
    
    if (version == FM2012_12_2) {
        offset += 1;
    }
	
	*byteOffset = offset;
	
	return object;
}


@end
