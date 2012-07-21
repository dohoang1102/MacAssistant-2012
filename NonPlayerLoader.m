//
//  NonPlayerLoader.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/20.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "NonPlayerLoader.h"
#import "ScoutingKnowledgeLoader.h"
#import "StaffTendencyLoader.h"

@implementation NonPlayerLoader

+ (NonPlayer *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset version:(short)version
{
	char cbuffer;
	short sbuffer;
	int ibuffer;
	NSMutableArray *tempArray;
	
	unsigned int offset = *byteOffset;
	
	NonPlayer *object = [[NonPlayer alloc] init];
	
	// NSLog(@"in Non-Player at %d",offset);
	
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setHomeReputation:sbuffer];
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setCurrentReputation:sbuffer];
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setWorldReputation:sbuffer];
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setCurrentAbility:sbuffer];
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setPotentialAbility:sbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setPreferredFormation:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setPreferredFormation2:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setDefensiveFormation:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setAttackingFormation:cbuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setNonPlayingStatsID:ibuffer];
	
	// ???
	[object setUnknownData1:[data subdataWithRange:NSMakeRange(offset, 8)]]; 
	offset += 8;
    
    // FM 2012 ???
    offset += 4;
    offset += 4; // Date
    
    offset += 1;
    
    [data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
    [object setHasScoutingKnowledges:cbuffer];
    if ([object hasScoutingKnowledges]) {
        // ???
        [data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
        [object setUnknownChar3:cbuffer];
        
        [data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
        tempArray = [[NSMutableArray alloc] init];
        for (int i=0;i<sbuffer;i++) {
            [tempArray addObject:[ScoutingKnowledgeLoader readFromData:data atOffset:&offset version:version]];
        }
        [object setScoutingKnowledges:tempArray];
        [tempArray release];
    }
    
    [data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
    [object setHasTendencies:cbuffer];
	if ([object hasTendencies]) {
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		tempArray = [[NSMutableArray alloc] init];
		for (int i=0;i<cbuffer;i++) {
			[tempArray addObject:[StaffTendencyLoader readFromData:data atOffset:&offset]];
		}
		[object setTendencies:tempArray];
		[tempArray release];
	}
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
    if (cbuffer > 0) {
        offset += 23;
    }
    
    /*
     
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownBool2:cbuffer];
	
	// if (cbuffer) { 
    [object setUnknownData3:[data subdataWithRange:NSMakeRange(offset, 19)]]; 
    offset += 19;
    // }
    */
	
	*byteOffset = offset;
	
	return object;
}

@end
