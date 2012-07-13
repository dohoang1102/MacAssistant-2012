//
//  ClubLoader.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/24.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "DatabaseTypes.h"
#import "GameVersions.h"
#import "FMDateLoader.h"
#import "ClubLoader.h"
#import "ClubFinanceLoader.h"
#import "ClubSponsorLoader.h"
#import "IDPCLoader.h"
#import "RegionalDivisionLoader.h"
#import "ScoutingKnowledgeLoader.h"
#import "ShortlistedPersonLoader.h"
#import "TeamContainerLoader.h"

@implementation Loader (ClubLoader)

+ (id)readClubFromData:(NSData *)data atOffset:(unsigned int *)byteOffset version:(short)version
{
	char cbuffer;
    char counterBuffer;
	short sbuffer;
	float fbuffer;
	int ibuffer;
	BOOL debug = NO;
	NSMutableArray *tempArray;
	
	unsigned int offset = *byteOffset;
	
	Club *object = [[Club alloc] init];
	
	// Look OK
    [data getBytes:&cbuffer range:NSMakeRange(offset, 1)];
    offset += 1;
	[object setDatabaseClass:cbuffer];
	
    // Looks OK
	if ([object databaseClass]==DBC_LEAGUE_BODY_CLUB)
	{
		[object setIsLeagueBodyClub:TRUE];
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setCompetitionID:ibuffer];
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setMaximumWeeklyWage:ibuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setAllowSponsorshipForTopPlayers:cbuffer];
	}
	
    // Valid (It's the row ID)
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)];
    offset += 4;
	[object setNationID:ibuffer];
	
    // Valid (It's the row ID)
    [data getBytes:&ibuffer range:NSMakeRange(offset, 4)];
    offset += 4;
	[object setCityID:ibuffer];
	
    // Valid
    [data getBytes:&cbuffer range:NSMakeRange(offset, 1)];
    offset += 1;
    [object setNickname2Gender:cbuffer];
    
    // Valid
    [object setNickname2:[FMString readFromData:data atOffset:&offset]];
    
    // Valid
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)];
    offset += 1;
	[object setYouthFacilities:cbuffer];
    
    // Valid
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)];
    offset += 1;
	[object setYouthCoaching:cbuffer];
    
    // Valid
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)];
    offset += 1;
	[object setYouthRecruitment:cbuffer];
    
    // Valid
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)];
    offset += 2;
	[object setYearFounded:sbuffer];
    
    // Unknown if Valid
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)];
    offset += 4;
	[object setFutureTransferManagerID:ibuffer];
    
    // Unknown if Valid
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)];
    offset += 1;
	[object setProfessionalStatus:cbuffer];
    
    // Valid
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)];
    offset += 1;
	[object setTrainingFacilities:cbuffer];
    
    // Unknown if Valid
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)];
    offset += 1;
	[object setFlags:cbuffer];
    
	if ([object flags] > CF_MAX) { 
		return [NSString stringWithFormat:@"Invalid club flags - %d",[object flags]]; 
	}
	
	// ??
    // Unknown if Valid
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)];
    offset += 1;
	[object setUnknownChar1:cbuffer];
    
    // Unknown if Valid
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)];
    offset += 4;
	[object setChairmanID:ibuffer];
    
    // Unknown if Valid
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)];
    offset += 1;
	[object setRoughFinancialState:cbuffer];
	
    // Valid
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)];
    offset += 1;
	[object setMorale:cbuffer];
	
    // Offsets:
    //FM2011: 1377396
    //FM 2012: 1658903
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)];
    offset += 1;
	tempArray = [[NSMutableArray alloc] init];
	for (int i=0;i<cbuffer;i++) {
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)];
        offset += 4;
		[tempArray addObject:[NSNumber numberWithInt:ibuffer]];
	}
	[object setDirectors:tempArray];
	[tempArray release];
	
    // Offsets:
    //FM2011: 1377397
    //FM 2012: 1658904
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)];
    offset += 1;
	tempArray = [[NSMutableArray alloc] init];
	for (int i=0;i<cbuffer;i++) {
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)];
        offset += 4;
		[tempArray addObject:[NSNumber numberWithInt:ibuffer]];
	}
	[object setScouts:tempArray];
	[tempArray release];
	
	// here in man u 1 at 1462493
	// here in test2mls at 1595427
	
	if (debug) { NSLog(@"before finance at %d",offset); }
	
    // Offsets:
    //FM2011: 1377398
    //FM 2012: 1658905
	id finance = [ClubFinanceLoader readFromData:data atOffset:&offset version:version];
	if ([[finance className] isEqualToString:@"ClubFinance"]) {
		[object setFinance:finance];
	}
	else { return [NSString stringWithFormat:@"Finance - %@",finance]; }
	
	if (debug) { NSLog(@"after finance at %d",offset); }
	
    // Offsets:
    //FM2011: 1377465
    //FM 2012: 1658973
	// [data getBytes:&sbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	/*
    tempArray = [[NSMutableArray alloc] init];
	for (int i=0;i<sbuffer;i++) {
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[tempArray addObject:[NSNumber numberWithInt:ibuffer]];
	}
	[object setTransferOffers:tempArray];
	[tempArray release]; */
	
    // Offsets:
    //FM2011: 1377467
    //FM 2012: 1658975
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setFirstTeamStrengthRating:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setFirstTeamQuicknessRating:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setFirstTeamGoalkeepingRating:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setFirstTeamTacticsRating:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setFirstTeamBallControlRating:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setFirstTeamDefendingRating:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setFirstTeamAttackingRating:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setFirstTeamShootingRating:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setFirstTeamSetPiecesRating:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setFirstTeamStrengthWorkload:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setFirstTeamQuicknessWorkload:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setFirstTeamGoalkeepingWorkload:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setFirstTeamTacticsWorkload:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setFirstTeamBallControlWorkload:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setFirstTeamDefendingWorkload:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setFirstTeamAttackingWorkload:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setFirstTeamShootingWorkload:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setFirstTeamSetPiecesWorkload:cbuffer];
	
	// first team
    // Offsets:
    //FM2011: 1377485
    //FM 2012: NO JUMP
	// [object setUnknownData1:[data subdataWithRange:NSMakeRange(offset, 94)]]; offset += 94;
	
    // first team
    // Offsets:
    //FM2011: 1377579
	// [data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	// [object setUnknownShort1:sbuffer];
    
    // first team
    // Offsets:
    //FM2011: 1377581
	// [object setUnknownData2:[data subdataWithRange:NSMakeRange(offset, (sbuffer * 2))]]; offset += (sbuffer * 2);
	 
    // first team
    // Offsets:
    //FM2011: 1377583
    //FM 2012: 1658993
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setYouthTeamStrengthRating:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setYouthTeamQuicknessRating:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setYouthTeamGoalkeepingRating:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setYouthTeamTacticsRating:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setYouthTeamBallControlRating:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setYouthTeamDefendingRating:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setYouthTeamAttackingRating:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setYouthTeamShootingRating:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setYouthTeamSetPiecesRating:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setYouthTeamStrengthWorkload:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setYouthTeamQuicknessWorkload:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setYouthTeamGoalkeepingWorkload:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setYouthTeamTacticsWorkload:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setYouthTeamBallControlWorkload:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setYouthTeamDefendingWorkload:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setYouthTeamAttackingWorkload:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setYouthTeamShootingWorkload:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setYouthTeamSetPiecesWorkload:cbuffer];
	
    // Offsets:
    //FM2011: 1377601
    //FM 2012: 1659011
    
	// youth team
    // NOT NEEDED BY FM 2012
	// [object setUnknownData3:[data subdataWithRange:NSMakeRange(offset, 94)]]; offset += 94;
	
    // Offsets:
    //FM2011: 1377695
    // FM 2012: 1659011
	//[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	//[object setUnknownShort2:sbuffer];
    
    // Offsets:
    //FM2011: 1377697
    // FM 2012: 1659011
	// [object setUnknownData4:[data subdataWithRange:NSMakeRange(offset, (sbuffer * 2))]];  offset += (sbuffer * 2);
	
    // Offsets:
    //FM2011: 1377699
    // FM 2012: 1659011
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
    // FM2012 Skip 100 bytes for now
    if (cbuffer > 0) {
        for (int i=0; i<cbuffer; i++) {
            offset += 101;
        }
        [data getBytes:&counterBuffer range:NSMakeRange(offset, 1)]; offset += 1;
        tempArray = [[NSMutableArray alloc] init];
        for (int i=0;i<counterBuffer;i++) {
            [tempArray addObject:[IDPCLoader readFromData:data atOffset:&offset]];
        }
        [object setIDPCs:tempArray];
        [tempArray release];
    }
    else {
        offset += 1;
    }
    
    // Offsets:
    //FM2011: 1377700
    // FM 2012: 1659012
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	tempArray = [[NSMutableArray alloc] init];
	for (int i=0;i<cbuffer;i++) {
		[tempArray addObject:[ClubSponsorLoader readFromData:data atOffset:&offset]];
	}
	[object setSponsors:tempArray];
	[tempArray release];
	
	if (debug) { NSLog(@"after sponsors at %d",offset); }
	
    // Offsets:
    //FM2011: 1377701
    // FM 2012: 1659013
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	tempArray = [[NSMutableArray alloc] init];
	for (int i=0;i<cbuffer;i++) {
		[tempArray addObject:[RegionalDivisionLoader readFromData:data atOffset:&offset]];
	}
	[object setRegionalDivisions:tempArray];
	[tempArray release];
	
	if (debug) { NSLog(@"after regionals at %d",offset); }
    
    // Offsets:
    //FM2011: 1377702
    // FM 2012: 1659014
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
    if (cbuffer > 0) {
        [object setUnknownData6:[data subdataWithRange:NSMakeRange(offset, (cbuffer*16))]]; offset += (cbuffer*16);
        // FM 2012: 1659015
        [data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
    
        for (int i=0; i<cbuffer; i++) {
            offset += 4;
        }
    }
    // Unknown Container
    [data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
    if (cbuffer > 0) {
        offset += 1;
        [data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
        for (int i=0; i<sbuffer; i++) {
            offset += 22;
        }
    }
    
    /* --- Unknown For now
	[object setHasUEFACoefficient:cbuffer];
	if ([object hasUEFACoefficient]) {
		[object setUnknownData5:[data subdataWithRange:NSMakeRange(offset, 4)]]; offset += 4;
	
		
		// [data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		// [object setUEFAPoints:cbuffer];
		// [data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		// [object setUEFAMatches:cbuffer];
		
		[data getBytes:&fbuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setUEFATempCoefficient:fbuffer];
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setUEFA5YearTotal:ibuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		tempArray = [[NSMutableArray alloc] init];
		for (int i=0;i<cbuffer;i++) {
			[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
			[tempArray addObject:[NSNumber numberWithInt:ibuffer]];
		}
		[object setCoefficients:tempArray];
		[tempArray release];
	} */
	
	if (debug) { NSLog(@"after coefficients at %d",offset); }
    
    /*
	[object setHasScoutingKnowledges:cbuffer];
	if ([object hasScoutingKnowledges]) {
		if (debug) { NSLog(@"SKs at %d",offset); }
		
		// ???
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar2:cbuffer];
		
		[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
		tempArray = [[NSMutableArray alloc] init];
		for (int i=0;i<sbuffer;i++) {
			[tempArray addObject:[ScoutingKnowledgeLoader readFromData:data atOffset:&offset]];
		}
		[object setScoutingKnowledges:tempArray];
		[tempArray release];
	} */
	
	if (debug) { NSLog(@"after sks at %d",offset); }
	
	// ???
    // FM 2012: 1659016
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar3:cbuffer];
	
    // FM 2012: 1659018
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setSeasonTicketHolders:ibuffer];
    
    // FM 2012: 1659022
	[object setSeasonEndDate:[FMDateLoader readFromData:data atOffset:&offset]];
    
    // FM 2012: 1659026
	[object setPreSeasonStartDate:[FMDateLoader readFromData:data atOffset:&offset]];
    
    // FM 2012: 1659030
	[object setSeasonStartDate:[FMDateLoader readFromData:data atOffset:&offset]];
	
	// ???
    // FM 2012: 1659034
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar4:cbuffer];
    
    // FM 2012: 1659035
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar5:cbuffer];
    
    // FM 2012: 1659036
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar6:cbuffer];
	
    // FM 2012: 1659037
	[object setUnknownDate1:[FMDateLoader readFromData:data atOffset:&offset]];
	
    // FM 2012: 1659041
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar7:cbuffer];
	
    // FM 2012: 2 unknown bytes
    offset += 2;
    [data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setSupporterLoyalty:cbuffer];
    [data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setSupporterPassion:cbuffer];
    [data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setSupporterPatience:cbuffer];
    [data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setSupporterAffluence:cbuffer];
    [data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setSupporterTemperament:cbuffer];
    
    // FM 2012
    // Skip 5 Unknown bytes
    offset += 5;
    
    // FM 2012
    // Skip 14 Unknown bytes
    offset += 14;
    
    // FM 2012: 1659068
	[object setUnknownDate2:[FMDateLoader readFromData:data atOffset:&offset]];
	
    // FM 2012: 1659072
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar8:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar9:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar10:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar11:cbuffer];
	
    // FM 2012: Season Ticket Cup Matches
	// Length 0x1 bytes
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	for (int i=0; i<cbuffer; i++) {
        offset += 4; // Competition UID 1
        offset += 4; // Competition UID 2
        offset += 1; // No Matches (Unverified)
        offset += 4; // Name (Unverified)
        offset += 4; // Name 2 (Unverified)
        offset += 4; // EOF
    }
	
    // Possibly Debts
    [data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
    for (int i=0; i<ibuffer; i++) {
        offset += 4; // Amount
        offset += 4; // Unknown
        offset += 4; // End Date
        offset += 1; // Type
        offset += 4; // Start Date
    }
    offset += 1;
    
	if (debug) { NSLog(@"before TC at %d",offset); }
	
	id tc = [TeamContainerLoader readFromData:data atOffset:&offset];
	if ([[tc className] isEqualToString:@"TeamContainer"]) {
		[object setTeamContainer:tc];
	}
	else { return [NSString stringWithFormat:@"Team Container - %@",tc]; }
	
	if (debug) { NSLog(@"after TC at %d",offset); }
    [data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
    [object setAverageAttendance:ibuffer];
    [data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
    [object setMinimumAttendance:ibuffer];
    [data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
    [object setMaximumAttendance:ibuffer];
    
    id newTc = [TeamContainerLoader readTransferInfosFromData:data atOffset:&offset withTeamContainer: tc];
    if ([[newTc className] isEqualToString:@"TeamContainer"]) {
        [object setTeamContainer:newTc];
    }
    else { return [NSString stringWithFormat:@"Team Container - %@", newTc]; }
    
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setRowID:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setUID:ibuffer];
	
    // FM 2012: Skip 4 bytes at the end of the file
    offset += 4;
    
	if (debug) { NSLog(@"Club %d (%@) at %d",[object rowID],[[object teamContainer] name],offset); }
    
    
	
	*byteOffset = offset;
	
	return object;
}



@end
