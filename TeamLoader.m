//
//  TeamLoader.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/17.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TeamLoader.h"
#import "DatabaseTypes.h"
#import "FMDateLoader.h"
#import "FixtureBlockLoader.h"
#import "Unknown8Loader.h"
#import "PlayerReplacementLoader.h"
#import "GameVersions.h"

@implementation Loader (TeamLoader)

+ (Team *)readTeamFromData:(NSData *)data atOffset:(unsigned int *)byteOffset version:(short)version
{
	char cbuffer;
	short sbuffer;
	int ibuffer;
	BOOL debug = NO;
	NSMutableArray *tempArray;
	
	unsigned int offset = *byteOffset;
	
	Team *object = [[Team alloc] init];
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setDatabaseClass:cbuffer];
	
	if ([object databaseClass]==DBC_NATIONAL_TEAM) {
		[object setLastSelectionDate:[FMDateLoader readFromData:data atOffset:&offset]];
		[object setUnlockDate:[FMDateLoader readFromData:data atOffset:&offset]];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setMaximumSquadSize:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setMinimumSquadSize:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setLocked:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setClubsHaveSetFriendlyInstructions:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setAvailablePlayers:cbuffer];
		
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		tempArray = [[NSMutableArray alloc] init];
		for (int i=0;i<cbuffer;i++) {
			[tempArray addObject:[PlayerReplacementLoader readFromData:data atOffset:&offset]];
		}
		[object setPlayerReplacements:tempArray];
		[tempArray release];
		
		// ???
		[object setUnknownData1:[data subdataWithRange:NSMakeRange(offset, 114)]]; 
		offset += 114;
		
		[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
		[object setUnknownShort1:sbuffer];
		[object setUnknownData4:[data subdataWithRange:NSMakeRange(offset, (sbuffer*2))]]; offset += (sbuffer*2);
	}
	
	if (debug) { NSLog(@"flags at %d",offset); }
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setFlags:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setLastPosition:cbuffer];
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setReputation:sbuffer];
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setNationalReputation:sbuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setDivisionID:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setLastDivisionID:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setNextDivisionID:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setStadiumID:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setManagerID:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setContinentalCupID:ibuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setContinentalCupSeeding:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setHomeMatchday:cbuffer];
	
	// ???
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar1:cbuffer];
	
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setFutureContinentalCupID:ibuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setFutureContinentalCupInfo:cbuffer];
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setFirstFixtureYear:sbuffer];
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setLastFixtureYear:sbuffer];
	[object setLastMatchDate:[FMDateLoader readFromData:data atOffset:&offset]];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setOtherDivisionID:ibuffer];
	
	// ???
	[object setUnknownData2:[data subdataWithRange:NSMakeRange(offset, 9)]]; 
	offset += 9;
	
	if (debug) { NSLog(@"before arrays at %d",offset); }
	
	/*
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	tempArray = [[NSMutableArray alloc] init];
	for (int i=0;i<cbuffer;i++) {
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[tempArray addObject:[NSNumber numberWithInt:ibuffer]];
	}
	[object setPhysios:tempArray];
	[tempArray release];
	
	 */
	
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	tempArray = [[NSMutableArray alloc] init];
	for (int i=0;i<sbuffer;i++) {
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[tempArray addObject:[NSNumber numberWithInt:ibuffer]];
	}
	[object setPlayers:tempArray];
	[tempArray release];
	
	/*
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	tempArray = [[NSMutableArray alloc] init];
	for (int i=0;i<cbuffer;i++) {
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[tempArray addObject:[NSNumber numberWithInt:ibuffer]];
	}
	[object setCoaches:tempArray];
	[tempArray release];
	*/
	
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	tempArray = [[NSMutableArray alloc] init];
	for (int i=0;i<sbuffer;i++) {
		[tempArray addObject:[FixtureBlockLoader readFromData:data atOffset:&offset]];
	}
	[object setFixtureBlocks:tempArray];
	[tempArray release];
	
	if (debug) { NSLog(@"after arrays at %d",offset); }
	
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	tempArray = [[NSMutableArray alloc] init];
	for (int i=0;i<sbuffer;i++) {
		[tempArray addObject:[Unknown8Loader readFromData:data atOffset:&offset]];
	}
	[object setUnknown8s:tempArray];
	[tempArray release];
	
	// ???
	[object setUnknownData3:[data subdataWithRange:NSMakeRange(offset, 16)]]; 
	offset += 16;
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	tempArray = [[NSMutableArray alloc] init];
	for (int i=0;i<cbuffer;i++) {
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[tempArray addObject:[NSNumber numberWithInt:ibuffer]];
	}
	[object setUnknowns1:tempArray];
	[tempArray release];
	
	// ???
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar2:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar3:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar4:cbuffer];
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setTeamType:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setTeamContainerType:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setNewTeam:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setMaximumAge:cbuffer];
	
	if (debug) { NSLog(@"before tcid at %d",offset); }
	
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setTeamContainerID:ibuffer];
	[object setName:[FMString readFromData:data atOffset:&offset]];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setNameGender:cbuffer];
	[object setShortName:[FMString readFromData:data atOffset:&offset]];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setShortNameGender:cbuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setRowID:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setUID:ibuffer];
	
	if (debug) { NSLog(@"Team %d at %d",[object rowID], offset); }
	
	*byteOffset = offset;
	
	return object;
}

@end
