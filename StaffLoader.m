//
//  StaffLoader.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/20.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "StaffLoader.h"
#import "FMDateLoader.h"
#import "ContractLoader.h"
#import "ContractOfferLoader.h"
#import "InterestedClubLoader.h"
#import "GameVersions.h"

@implementation StaffLoader

+ (Staff *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset version:(short)version
{
	char cbuffer, cbuffer2;
	short sbuffer;
	int ibuffer;
	BOOL debug = NO;
	NSMutableArray *tempArray;
	
	unsigned int offset = *byteOffset;
	
	Staff *object = [[Staff alloc] init];
	
	if (debug) { NSLog(@"in staff at %d",offset); }
	
	// ???
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar1:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar2:cbuffer];
	
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setLastClubID:ibuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setFullCaps:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setFullGoals:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setU21Caps:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setU21Goals:cbuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setNationalTeamID:ibuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setNationalJob:cbuffer];
	[object setNationalTeamJoinDate:[FMDateLoader readFromData:data atOffset:&offset]];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setClubTeamID:ibuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setClubJob:cbuffer];
	[object setClubTeamJoinDate:[FMDateLoader readFromData:data atOffset:&offset]];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setCurrentLanguageProficiency:cbuffer];
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	tempArray = [[NSMutableArray alloc] init];
	for (int i=0;i<cbuffer;i++) {
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[tempArray addObject:[NSNumber numberWithInt:ibuffer]];
	}
	[object setTransferOffers:tempArray];
	[tempArray release];
	
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setContractOfferDecisionDateUniqueID:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setHistoryID:ibuffer];
	
	// NSLog(@"contracts at %d, CBUFFER is: %d, CBUFFER2 is: %d",offset, cbuffer, cbuffer2);
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	tempArray = [[NSMutableArray alloc] init];
	for (int i=0;i<cbuffer;i++) {
		[data getBytes:&cbuffer2 range:NSMakeRange(offset, 1)]; offset += 1;
		[tempArray addObject:[ContractLoader readFromData:data atOffset:&offset type:cbuffer2 version:version]];
	}
	[object setContracts:tempArray];
	[tempArray release];
	// NSLog(@"After For 1");
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	tempArray = [[NSMutableArray alloc] init];
	for (int i=0;i<cbuffer;i++) {
		[tempArray addObject:[ContractOfferLoader readFromData:data atOffset:&offset version:version]];
	}
	[object setContractOffers:tempArray];
	[tempArray release];
	
	//NSLog(@"After For 2");
    
    // FM 2012 unknown arrays???
    [data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
    for (int i=0; i<cbuffer; i++) {
        offset += 5;
    }
    
    [data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
    for (int i=0; i<ibuffer; i++) {
        offset += 11;
    }
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setHasStaffRoles:cbuffer];
	
	// NSLog(@"After Staff HasRoles");
	
	if ([object hasStaffRoles]) {
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setManagerRole:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setAssistantManagerRole:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setCoachRole:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setPhysioRole:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setScoutRole:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setGoalkeepingCoachRole:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setFitnessCoachRole:cbuffer];
		
		// only seen 0x0A
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar7:cbuffer];
	}
	
	// NSLog(@"After Staff HasRoles IF");
	
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setUnknownShort1:sbuffer];
	
	// interested clubs?
	// NSLog(@"Gonna Crash? At Offest: %d and SBUFFER: %d", offset, sbuffer);
	if (sbuffer > 0) {
		[object setUnknownData2:[data subdataWithRange:NSMakeRange(offset, (sbuffer*4))]]; 
		offset += (sbuffer*4);
	}
		
	// ???
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar4:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar5:cbuffer];
	
	[object setCurrentNationJoinDate:[FMDateLoader readFromData:data atOffset:&offset]];
	
	// ???
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar6:cbuffer];
	[object setUnknownDate1:[FMDateLoader readFromData:data atOffset:&offset]];
	
	// int, int, date
	[object setUnknownData3:[data subdataWithRange:NSMakeRange(offset, 12)]]; 
	offset += 12;
	
	*byteOffset = offset;
	
	return object;
}

@end
