//
//  PlayerLoader.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/01.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PlayerLoader.h"
#import "PlayerFormLoader.h"
#import "BookingCountLoader.h"
#import "PlayerBanLoader.h"
#import "PlayerInjuryLoader.h"
#import "FMDateLoader.h"
#import "GameVersions.h"

@implementation PlayerLoader

+ (Player *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset version:(short)version
{
	char cbuffer;
	short sbuffer;
	int ibuffer;
	float fbuffer;
	BOOL bbuffer;
	unsigned long long llbuffer;
	BOOL debug = NO;
	NSMutableArray *tempArray;
	
	unsigned int offset = *byteOffset;
	
	Player *object = [[Player alloc] init];
	
	if (debug) { NSLog(@"in Player at %d",offset); }
	
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
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setPlayerStatsID:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setValue:ibuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setMorale:cbuffer];
	
	// ???
	[object setUnknownDate1:[FMDateLoader readFromData:data atOffset:&offset]];
	
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setFitness:sbuffer];
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setJadedness:sbuffer];
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setCondition:sbuffer];
	
	// ???
	[object setUnknownData1:[data subdataWithRange:NSMakeRange(offset, 4)]]; 
	offset += 4;
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setDeclaredForNation:cbuffer];
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setWeight:sbuffer];
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setHeight:sbuffer];
	
	// ???
	[data getBytes:&fbuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setUnknownFloat1:fbuffer];
    if (version == FM2012_12_2) {
        offset += 4;
    }
    
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar1:cbuffer];
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar2:cbuffer];
	
	// ???
	[object setUnknownData2:[data subdataWithRange:NSMakeRange(offset, cbuffer)]]; 
	offset += cbuffer;
    
    // FM 2012 ???
    offset += 3;
	
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setAskingPrice:ibuffer];
	
	// ???
	[object setUnknownData3:[data subdataWithRange:NSMakeRange(offset, 9)]]; 
	offset += 9;
	
	// ???
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar3:cbuffer];
	[object setUnknownData4:[data subdataWithRange:NSMakeRange(offset, (cbuffer*12))]]; 
	offset += (cbuffer*12);
	
	// ???
    offset += 4;
    
	[object setUnknownData5:[data subdataWithRange:NSMakeRange(offset, 31)]]; 
	offset += 31;
    
	[object setUnknownDate3:[FMDateLoader readFromData:data atOffset:&offset]];
	[object setUnknownDate4:[FMDateLoader readFromData:data atOffset:&offset]];
	[object setUnknownDate5:[FMDateLoader readFromData:data atOffset:&offset]];
	[object setUnknownDate6:[FMDateLoader readFromData:data atOffset:&offset]];
	
	// ???
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownBool1:cbuffer];
	if (cbuffer) {
		[object setUnknownData6:[data subdataWithRange:NSMakeRange(offset, 13)]]; 
		offset += 13;
	}
	
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setFirstClubID:ibuffer];
	[data getBytes:&llbuffer range:NSMakeRange(offset, 8)]; offset += 8;
	[object setPreferredMoves:llbuffer];
	
	// ???
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setUnknownInt1:ibuffer];
	
	[object setUnknownDate7:[FMDateLoader readFromData:data atOffset:&offset]];
    
    // ???
    offset += 4;
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setHasCareerStats:cbuffer];
	
	if ([object hasCareerStats]) {
		[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
		[object setClubLeagueGoals:sbuffer];
		[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
		[object setClubGoals:sbuffer];
		[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
		[object setClubAppearances:sbuffer];
		[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
		[object setLeagueGoals:sbuffer];
		[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
		[object setGoals:sbuffer];
		[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
		[object setAppearances:sbuffer];
		[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
		[object setClubLeagueAppearances:sbuffer];
		[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
		[object setLeagueAppearances:sbuffer];
		[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
		[object setUnknownShort1:sbuffer];
	}
	
	if (debug) { NSLog(@"at EPD at %d",offset); }
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setHasExtraPlayingData:cbuffer];
	
	if ([object hasExtraPlayingData]) {
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		tempArray = [[NSMutableArray alloc] init];
		for (int i=0;i<cbuffer;i++) {
			if (debug) { NSLog(@"has injury at %d",offset); }
			[tempArray addObject:[PlayerInjuryLoader readFromData:data atOffset:&offset]];
		}
		[object setInjuries:tempArray];
		[tempArray release];
		
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		tempArray = [[NSMutableArray alloc] init];
		for (int i=0;i<cbuffer;i++) {
			if (debug) { NSLog(@"has ban at %d",offset); }
			[tempArray addObject:[PlayerBanLoader readFromData:data atOffset:&offset]];
		}
		[object setBans:tempArray];
		[tempArray release];
	/*	
		// ???
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar5:cbuffer];
		[object setUnknownData7:[data subdataWithRange:NSMakeRange(offset, (cbuffer*8))]]; 
		offset += (cbuffer*8);
	*/	
		// ???
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar6:cbuffer];
		[object setUnknownData8:[data subdataWithRange:NSMakeRange(offset, (cbuffer*24))]]; 
		offset += (cbuffer*24);
		
		// ???
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar7:cbuffer];
		[object setUnknownData9:[data subdataWithRange:NSMakeRange(offset, (cbuffer*61))]]; 
		offset += (cbuffer*61);
		
		// ???
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar8:cbuffer];
		[object setUnknownData10:[data subdataWithRange:NSMakeRange(offset, (cbuffer*12))]]; 
		offset += (cbuffer*12);
		
		// ???
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar9:cbuffer];
		[object setUnknownData11:[data subdataWithRange:NSMakeRange(offset, (cbuffer*16))]]; 
		offset += (cbuffer*16);
	}
	
	[data getBytes:&bbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setHasMLSData:bbuffer];
	
	if ([object hasMLSData]) {
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setMLSPlayerType:cbuffer];
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setMLSRightsClubID:ibuffer];
		[object setMLSRightsExpiryDate:[FMDateLoader readFromData:data atOffset:&offset]];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setMLSDraftType:cbuffer];
        
        if (version == FM2012_12_2) {
            offset += 2; // ???
        }
        
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setMLSLastDraftClubID:ibuffer];
		[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
		[object setMLSLastDraftYear:sbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setMLSLastDraftPick:cbuffer];
		[data getBytes:&bbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setMLSGuaranteedDealClub:bbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setMLSLastDraftRound:cbuffer];
		[data getBytes:&bbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setMLSGuaranteedDealPlayer:bbuffer];
		
        offset += 1; // need to check
        //[object setMLSDiscoveryPlayerDate:[FMDateLoader readFromData:data atOffset:&offset]];
	}
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setHasInternationalCareer:cbuffer];
	
	if ([object hasInternationalCareer]) {
		// ???
		[object setUnknownData13:[data subdataWithRange:NSMakeRange(offset, 4)]]; 
		offset += 4;
		
		// same date as international retirement date?
		[object setUnknownDate8:[FMDateLoader readFromData:data atOffset:&offset]];
		
		// ???
		[object setUnknownData14:[data subdataWithRange:NSMakeRange(offset, 4)]]; 
		offset += 4;
		
		// ???
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar11:cbuffer];
		[object setUnknownData15:[data subdataWithRange:NSMakeRange(offset, (cbuffer*2))]]; 
		offset += (cbuffer*2);
		
		// ???
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar12:cbuffer];
		[object setUnknownData16:[data subdataWithRange:NSMakeRange(offset, (cbuffer*7))]]; 
		offset += (cbuffer*7);
        
        offset += 3;
        
        
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar14:cbuffer];
		
		// ???
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar15:cbuffer];
		
        // ???
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar13:cbuffer];
        offset += cbuffer;
        
		
		// last full international match?
		[object setLastInternationalMatch:[FMDateLoader readFromData:data atOffset:&offset]];
		
		// ???
		[object setUnknownData18:[data subdataWithRange:NSMakeRange(offset, 4)]]; 
		offset += 4;
		
		[object setUnknownDate10:[FMDateLoader readFromData:data atOffset:&offset]];
		[object setUnknownDate11:[FMDateLoader readFromData:data atOffset:&offset]];
		
		// ???
		[object setUnknownData19:[data subdataWithRange:NSMakeRange(offset, 10)]]; 
		offset += 10;
		
		[object setInternationalRetirementDate:[FMDateLoader readFromData:data atOffset:&offset]];
		
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar16:cbuffer];
		
		[object setInternationalDebutDate:[FMDateLoader readFromData:data atOffset:&offset]];
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setInternationalDebutOpposition:ibuffer];
		
		[object setUnknownDate14:[FMDateLoader readFromData:data atOffset:&offset]];
		
		[object setUnknownData21:[data subdataWithRange:NSMakeRange(offset, 4)]]; 
		offset += 4;
	}
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	tempArray = [[NSMutableArray alloc] init];
	for (int i=0;i<cbuffer;i++) {
		[tempArray addObject:[BookingCountLoader readFromData:data atOffset:&offset]];
	}
	[object setBookingCounts:tempArray];
	[tempArray release];
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setHasForms:cbuffer];
	
	if ([object hasForms]) {
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		tempArray = [[NSMutableArray alloc] init];
		for (int i=0;i<cbuffer;i++) {
			[tempArray addObject:[PlayerFormLoader readFromData:data atOffset:&offset]];
		}
		[object setForms:tempArray];
		[tempArray release];
		
		// training improvements?
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownBool2:cbuffer];
		if (cbuffer) {
			[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
			[object setUnknownChar17:cbuffer];
		//	NSLog(@"%d PTIs at %d",cbuffer,offset);
			[object setUnknownData22:[data subdataWithRange:NSMakeRange(offset, (cbuffer*59))]];
			offset += (cbuffer*59);
		}
	}
	
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setTeamLastPlayedForID:ibuffer];
	
	// ???
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setUnknownInt2:ibuffer];
	
	// injury status
	[object setLastUpdateDate:[FMDateLoader readFromData:data atOffset:&offset]];
	[object setNextFitnessDropDate:[FMDateLoader readFromData:data atOffset:&offset]];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setRecurringInjuryID:ibuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setRecurringInjuryOccuranceCount:cbuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setFileListID:ibuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setSentLightTrainingNews:cbuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setLastInjuryTypeID:ibuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setTrainingLevel:cbuffer];
    
    // ??? 2012
    offset += 1;
    
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setDaysSinceLastMatch:sbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setMinutesPlayedLastMatch:cbuffer];
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar4:cbuffer];
	
	*byteOffset = offset;
	
	return object;
}

@end
