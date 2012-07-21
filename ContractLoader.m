//
//  ContractLoader.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/20.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ContractLoader.h"
#import "ContractClauseLoader.h"
#import "ContractBonusLoader.h"
#import "FMDateLoader.h"
#import "GameVersions.h"

@implementation ContractLoader

+ (Contract *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset type:(char)type version:(short)version
{
	int ibuffer;
	char cbuffer;
	NSMutableArray *tempArray;
	
	unsigned int offset = *byteOffset;
	
	Contract *object = [[Contract alloc] init];
	
	[object setType:type];
	
	if ([object type]==CT_FULL_CONTRACT) {
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setStatus:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setLeavingOnBosman:cbuffer];
//		[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
//		[object setLeagueGamesPlayedSinceJoined:sbuffer];
//		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
//		[object setAppearanceBonus:ibuffer];
//		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
//		[object setGoalBonus:ibuffer];
//		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
//		[object setCleanSheetBonus:ibuffer];
		
		// ???
		[object setUnknownData1:[data subdataWithRange:NSMakeRange(offset, 10)]]; 
		offset += 10;
		
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setJob:cbuffer];
		
        // FM 2012 ???
        offset += 1;
        
		// ???
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar1:cbuffer];
		
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		tempArray = [[NSMutableArray alloc] init];
		for (int i=0;i<cbuffer;i++) {
			[tempArray addObject:[ContractClauseLoader readFromData:data atOffset:&offset]];
		}
		[object setClauses:tempArray];
		[tempArray release];
		
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		tempArray = [[NSMutableArray alloc] init];
		for (int i=0;i<cbuffer;i++) {
			[tempArray addObject:[ContractBonusLoader readFromData:data atOffset:&offset]];
		}
		[object setBonuses:tempArray];
		[tempArray release];
		
		// ??? seen 100
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar2:cbuffer];
	}
	else if ([object type]==CT_LOAN_CONTRACT) {
		// ???
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar3:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar4:cbuffer];
		
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setAgreedPrice:ibuffer];
		
		// ???
		[object setUnknownData1:[data subdataWithRange:NSMakeRange(offset, 4)]]; 
		offset += 4;
	}
	else { NSLog(@"unknown contract type - %d at %d",[object type],offset); }
	
	if (type!=CT_INVALID_CONTRACT) {
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setPersonID:ibuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setTeamContainerType:cbuffer];
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setClubID:ibuffer];
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setWeeklyWage:ibuffer];
        
        // FM 2012 ???
        offset += 4;
        
		[object setEndDate:[FMDateLoader readFromData:data atOffset:&offset]];
		
		// ???
		[object setUnknownDate1:[FMDateLoader readFromData:data atOffset:&offset]];
		
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setCurrentSquadStatus:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setPerceivedSquadStatus:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setTransferStatus:cbuffer];
	
		
	//	[data getBytes:&llbuffer range:NSMakeRange(offset, 8)]; offset += 8;
	//	[object setHappiness:llbuffer];
		
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setUnknownInt1:ibuffer];
		
		if (version < FM2011_11_2) {
			[object setUnknownData3:[data subdataWithRange:NSMakeRange(offset, (ibuffer*18))]]; 
			offset += (ibuffer*18);
		}
		else {
			// NSLog(@"CRASHING WITH iBUFFER: %d", ibuffer);
			if (ibuffer < 1000) {
				[object setUnknownData3:[data subdataWithRange:NSMakeRange(offset, (ibuffer*22))]]; 
				offset += (ibuffer*22);
			}
		}
		// NSLog(@"NO, CRASH IS LATER ON");
		
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar6:cbuffer];
		
		[object setStartDate:[FMDateLoader readFromData:data atOffset:&offset]];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setHappinessLevel:cbuffer];
		
		// ??
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar5:cbuffer];
		
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setSquadNumber:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setClubChoiceFactor:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setTransferOfferOptions:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setGamesMissedInARow:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setGamesPlayedInARow:cbuffer];
		
		// ??
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar7:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar8:cbuffer];
		
	}
	
	*byteOffset = offset;
	
	return object;
}

@end
