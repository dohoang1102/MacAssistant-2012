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
	short sbuffer;
	float fbuffer;
	int ibuffer;
	BOOL debug = NO;
	NSMutableArray *tempArray;
	
	unsigned int offset = *byteOffset;
	
	Club *object = [[Club alloc] init];
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setDatabaseClass:cbuffer];
	
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
	
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setNationID:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setCityID:ibuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setNickname1Gender:cbuffer];
	[object setNickname1:[FMString readFromData:data atOffset:&offset]];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setNickname2Gender:cbuffer];
	[object setNickname2:[FMString readFromData:data atOffset:&offset]];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setYouthAcademy:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setYouthSetup:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setYouthRecruitment:cbuffer];
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setYearFounded:sbuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setFutureTransferManagerID:ibuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setProfessionalStatus:cbuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setAverageAttendance:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setMinimumAttendance:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setMaximumAttendance:ibuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setTrainingFacilities:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setFlags:cbuffer];
	if ([object flags] > CF_MAX) { 
		return [NSString stringWithFormat:@"Invalid club flags - %d",[object flags]]; 
	}
	
	// ??
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar1:cbuffer];
	
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setChairmanID:ibuffer];

	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setRoughFinancialState:cbuffer];
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setMorale:cbuffer];
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	tempArray = [[NSMutableArray alloc] init];
	for (int i=0;i<cbuffer;i++) {
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[tempArray addObject:[NSNumber numberWithInt:ibuffer]];
	}
	[object setDirectors:tempArray];
	[tempArray release];
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	tempArray = [[NSMutableArray alloc] init];
	for (int i=0;i<cbuffer;i++) {
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[tempArray addObject:[NSNumber numberWithInt:ibuffer]];
	}
	[object setScouts:tempArray];
	[tempArray release];
	
	// here in man u 1 at 1462493
	// here in test2mls at 1595427
	
	if (debug) { NSLog(@"before finance at %d",offset); }
	
	id finance = [ClubFinanceLoader readFromData:data atOffset:&offset version:version];
	if ([[finance className] isEqualToString:@"ClubFinance"]) {
		[object setFinance:finance];
	}
	else { return [NSString stringWithFormat:@"Finance - %@",finance]; }
	
	if (debug) { NSLog(@"after finance at %d",offset); }
	
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	tempArray = [[NSMutableArray alloc] init];
	for (int i=0;i<sbuffer;i++) {
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[tempArray addObject:[NSNumber numberWithInt:ibuffer]];
	}
	[object setTransferOffers:tempArray];
	[tempArray release];
	
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
	[object setUnknownData1:[data subdataWithRange:NSMakeRange(offset, 94)]]; offset += 94;
	
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setUnknownShort1:sbuffer];
	[object setUnknownData2:[data subdataWithRange:NSMakeRange(offset, (sbuffer * 2))]]; offset += (sbuffer * 2);
	 
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
	
	// youth team
	[object setUnknownData3:[data subdataWithRange:NSMakeRange(offset, 94)]]; offset += 94; 
	
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setUnknownShort2:sbuffer];
	[object setUnknownData4:[data subdataWithRange:NSMakeRange(offset, (sbuffer * 2))]];  offset += (sbuffer * 2);
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	tempArray = [[NSMutableArray alloc] init];
	for (int i=0;i<cbuffer;i++) {
		[tempArray addObject:[IDPCLoader readFromData:data atOffset:&offset]];
	}
	[object setIDPCs:tempArray];
	[tempArray release];
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	tempArray = [[NSMutableArray alloc] init];
	for (int i=0;i<cbuffer;i++) {
		[tempArray addObject:[ClubSponsorLoader readFromData:data atOffset:&offset]];
	}
	[object setSponsors:tempArray];
	[tempArray release];
	
	if (debug) { NSLog(@"after sponsors at %d",offset); }
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	tempArray = [[NSMutableArray alloc] init];
	for (int i=0;i<cbuffer;i++) {
		[tempArray addObject:[RegionalDivisionLoader readFromData:data atOffset:&offset]];
	}
	[object setRegionalDivisions:tempArray];
	[tempArray release];
	
	if (debug) { NSLog(@"after regionals at %d",offset); }
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setHasUEFACoefficient:cbuffer];
	if ([object hasUEFACoefficient]) {
		
		[object setUnknownData5:[data subdataWithRange:NSMakeRange(offset, 4)]]; offset += 4; 
	
		/*
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUEFAPoints:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUEFAMatches:cbuffer];
		*/
		
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
	}
	
	if (debug) { NSLog(@"after coefficients at %d",offset); }
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
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
	}
	
	if (debug) { NSLog(@"after sks at %d",offset); }
	
	// ???
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar3:cbuffer];
	
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setSeasonTicketHolders:ibuffer];
	[object setSeasonEndDate:[FMDateLoader readFromData:data atOffset:&offset]];
	[object setPreSeasonStartDate:[FMDateLoader readFromData:data atOffset:&offset]];
	[object setSeasonStartDate:[FMDateLoader readFromData:data atOffset:&offset]];
	
	// ???
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar4:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar5:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar6:cbuffer];
	
	[object setUnknownDate1:[FMDateLoader readFromData:data atOffset:&offset]];
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar7:cbuffer];
	
	[object setUnknownDate2:[FMDateLoader readFromData:data atOffset:&offset]];
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar8:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar9:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar10:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar11:cbuffer];
	
	// ???
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar12:cbuffer];
	[object setUnknownData6:[data subdataWithRange:NSMakeRange(offset, (cbuffer*13))]]; offset += (cbuffer*13);
	
	if (debug) { NSLog(@"before TC at %d",offset); }
	
	id tc = [TeamContainerLoader readFromData:data atOffset:&offset];
	if ([[tc className] isEqualToString:@"TeamContainer"]) {
		[object setTeamContainer:tc];
	}
	else { return [NSString stringWithFormat:@"Team Container - %@",tc]; }
	
	if (debug) { NSLog(@"after TC at %d",offset); }
	
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setRowID:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setUID:ibuffer];
	
	if (debug) { NSLog(@"Club %d (%@) at %d",[object rowID],[[object teamContainer] name],offset); }
	
	*byteOffset = offset;
	
	return object;
}



@end
