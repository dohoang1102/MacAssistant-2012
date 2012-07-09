//
//  NationLoader.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/16.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "GameVersions.h"
#import "NationLoader.h"
#import "FifaRankingMatchLoader.h"
#import "TransferInfoLoader.h"
#import "TransferPreferenceLoader.h"
#import "TeamContainerLoader.h"
#import "TreatedNationsLoader.h"
#import "SpokenLanguageLoader.h"
#import "FutureRegenLoader.h"
#import "FamousPlayerLoader.h"
#import "GeneralInfoLoader.h"
#import "Unknown2Loader.h"
#import "Unknown4Loader.h"
#import "Unknown5Loader.h"
#import "Unknown6Loader.h"

@implementation Loader (NationLoader)

+ (id)readNationFromData:(NSData *)data atOffset:(unsigned int *)byteOffset version:(short)version
{
	char cbuffer;
	short sbuffer;
	float fbuffer;
	int ibuffer, count;
	BOOL debug = NO;
	NSMutableArray *tempArray;
	
	unsigned int offset = *byteOffset;
	
	Nation *object = [[Nation alloc] init];
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setDatabaseClass:cbuffer];
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setNumberOfClubs:sbuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setNumberOfStaff:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setNumberOfPlayers:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setNumberOfCities:ibuffer];
	
	// ???
	[object setUnknownData1:[data subdataWithRange:NSMakeRange(offset, 70)]]; 
	offset += 70;
	
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setFIFARanking:sbuffer];
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setFIFARankingPoints:sbuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setNationalStadiumID:ibuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setWageBudget:cbuffer];
	[data getBytes:&fbuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setWageFactor:fbuffer];
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setCurrentGameIndex:sbuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setFirstNameStartIndex:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setSurnameStartIndex:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setCommonNameStartIndex:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setFirstNameCount:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setSurnameCount:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setCommonNameCount:ibuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setLeagueSelected:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setRuleGroupLoaded:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUpdateDays:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setFlags:cbuffer];
	
	if (debug) { NSLog (@" after blips at %d",offset); }
	
	// ???
	[object setUnknownData5:[data subdataWithRange:NSMakeRange(offset, 6)]]; 
	offset += 6;
	
	
	// ???
	[data getBytes:&fbuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setUnknownFloat1:fbuffer];
	
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	tempArray = [[NSMutableArray alloc] init];
	for (int i=0;i<ibuffer;i++) {
		id info = [GeneralInfoLoader readFromData:data atOffset:&offset readInfo:YES];
		if ([[info className] isEqualToString:@"GeneralInfo"]) {
			[tempArray addObject:info];
		}
		else { return [NSString stringWithFormat:@"Info - %@",info]; }
	}
	[object setInfos:tempArray];
	[tempArray release];
	
	if (debug) { NSLog(@"after infos at %d",offset); }
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	tempArray = [[NSMutableArray alloc] init];
	for (int i=0;i<cbuffer;i++) {
		[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
		[tempArray addObject:[NSNumber numberWithShort:sbuffer]];
	}
	[object setRankingPoints:tempArray];
	[tempArray release];
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	tempArray = [[NSMutableArray alloc] init];
	for (int i=0;i<cbuffer;i++) {
		[tempArray addObject:[FifaRankingMatchLoader readFromData:data atOffset:&offset]];
	}
	[object setRankingMatches:tempArray];
	[tempArray release];
	
	// ???
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	if (cbuffer>0 && debug) { NSLog(@"mystery count 2 > 0 at %d",offset); }
	tempArray = [[NSMutableArray alloc] init];
	for (int i=0;i<cbuffer;i++) {
		[tempArray addObject:[Unknown4Loader readFromData:data atOffset:&offset]];
	}
	[object setUnknowns1:tempArray];
	[tempArray release];
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	tempArray = [[NSMutableArray alloc] init];
	for (int i=0;i<cbuffer;i++) {
		[data getBytes:&fbuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[tempArray addObject:[NSNumber numberWithFloat:fbuffer]];
	}
	[object setCoefficients:tempArray];
	[tempArray release];
	
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	tempArray = [[NSMutableArray alloc] init];
	for (int i=0;i<sbuffer;i++) {
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[tempArray addObject:[NSNumber numberWithInt:ibuffer]];
	}
	[object setHumanPlayerPool:tempArray];
	[tempArray release];
	
	// ???
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	tempArray = [[NSMutableArray alloc] init];
	for (int i=0;i<sbuffer;i++) {
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[tempArray addObject:[NSNumber numberWithInt:ibuffer]];
	}
	[object setUnknowns2:tempArray];
	[tempArray release];
	
	if (debug) { NSLog (@"before shortlists at %d",offset); }
	
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setMainSquadGkShortlistMinimumReputation:sbuffer];
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	tempArray = [[NSMutableArray alloc] init];
	for (int i=0;i<cbuffer;i++) {
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[tempArray addObject:[NSNumber numberWithInt:ibuffer]];
	}
	[object setMainSquadGkShortlist:tempArray];
	[tempArray release];
	
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setMainSquadDefShortlistMinimumReputation:sbuffer];
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	tempArray = [[NSMutableArray alloc] init];
	for (int i=0;i<cbuffer;i++) {
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[tempArray addObject:[NSNumber numberWithInt:ibuffer]];
	}
	[object setMainSquadDefShortlist:tempArray];
	[tempArray release];
	
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setMainSquadMidShortlistMinimumReputation:sbuffer];
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	tempArray = [[NSMutableArray alloc] init];
	for (int i=0;i<cbuffer;i++) {
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[tempArray addObject:[NSNumber numberWithInt:ibuffer]];
	}
	[object setMainSquadMidShortlist:tempArray];
	[tempArray release];
	
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setMainSquadFwShortlistMinimumReputation:sbuffer];
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	tempArray = [[NSMutableArray alloc] init];
	for (int i=0;i<cbuffer;i++) {
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[tempArray addObject:[NSNumber numberWithInt:ibuffer]];
	}
	[object setMainSquadFwShortlist:tempArray];
	[tempArray release];
	
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setU21GkShortlistMinimumReputation:sbuffer];
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	tempArray = [[NSMutableArray alloc] init];
	for (int i=0;i<cbuffer;i++) {
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[tempArray addObject:[NSNumber numberWithInt:ibuffer]];
	}
	[object setU21GkShortlist:tempArray];
	[tempArray release];
	
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setU21DefShortlistMinimumReputation:sbuffer];
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	tempArray = [[NSMutableArray alloc] init];
	for (int i=0;i<cbuffer;i++) {
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[tempArray addObject:[NSNumber numberWithInt:ibuffer]];
	}
	[object setU21DefShortlist:tempArray];
	[tempArray release];
	
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setU21MidShortlistMinimumReputation:sbuffer];
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	tempArray = [[NSMutableArray alloc] init];
	for (int i=0;i<cbuffer;i++) {
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[tempArray addObject:[NSNumber numberWithInt:ibuffer]];
	}
	[object setU21MidShortlist:tempArray];
	[tempArray release];
	
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setU21FwShortlistMinimumReputation:sbuffer];
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	tempArray = [[NSMutableArray alloc] init];
	for (int i=0;i<cbuffer;i++) {
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[tempArray addObject:[NSNumber numberWithInt:ibuffer]];
	}
	[object setU21FwShortlist:tempArray];
	[tempArray release];
	
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setU19GkShortlistMinimumReputation:sbuffer];
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	tempArray = [[NSMutableArray alloc] init];
	for (int i=0;i<cbuffer;i++) {
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[tempArray addObject:[NSNumber numberWithInt:ibuffer]];
	}
	[object setU19GkShortlist:tempArray];
	[tempArray release];
	
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setU19DefShortlistMinimumReputation:sbuffer];
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	tempArray = [[NSMutableArray alloc] init];
	for (int i=0;i<cbuffer;i++) {
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[tempArray addObject:[NSNumber numberWithInt:ibuffer]];
	}
	[object setU19DefShortlist:tempArray];
	[tempArray release];
	
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setU19MidShortlistMinimumReputation:sbuffer];
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	tempArray = [[NSMutableArray alloc] init];
	for (int i=0;i<cbuffer;i++) {
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[tempArray addObject:[NSNumber numberWithInt:ibuffer]];
	}
	[object setU19MidShortlist:tempArray];
	[tempArray release];
	
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setU19FwShortlistMinimumReputation:sbuffer];
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	tempArray = [[NSMutableArray alloc] init];
	for (int i=0;i<cbuffer;i++) {
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[tempArray addObject:[NSNumber numberWithInt:ibuffer]];
	}
	[object setU19FwShortlist:tempArray];
	[tempArray release];
	
	/*
	
	if (debug) { NSLog(@"before TIs at %d",offset); }
	
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	tempArray = [[NSMutableArray alloc] init];
	for (int i=0;i<sbuffer;i++) {
		id ti = [TransferInfoLoader readFromData:data atOffset:&offset];
		if ([[ti className] isEqualToString:@"TransferInfo"]) {
			[tempArray addObject:ti];
		}
		else { return [NSString stringWithFormat:@"Transfer Info - %@",ti]; }
	}
	[object setTransferInfos:tempArray];
	[tempArray release];
	
	if (debug) { NSLog(@"after TIs at %d",offset); }
	
	*/
	
	if (debug) { NSLog(@"after shortlists at %d",offset); }
	
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	tempArray = [[NSMutableArray alloc] init];
	for (int i=0;i<sbuffer;i++) {
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[tempArray addObject:[NSNumber numberWithInt:ibuffer]];
	}
	[object setBannedPlayers:tempArray];
	[tempArray release];
	
	[data getBytes:&count range:NSMakeRange(offset, 4)]; offset += 4;
	tempArray = [[NSMutableArray alloc] init];
	for (int i=0;i<count;i++) {
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[tempArray addObject:[NSNumber numberWithInt:ibuffer]];
	}
	[object setAgents:tempArray];
	[tempArray release];
	
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	tempArray = [[NSMutableArray alloc] init];
	for (int i=0;i<sbuffer;i++) {
		[tempArray addObject:[FutureRegenLoader readFromData:data atOffset:&offset]];
	}
	[object setFutureRegenPlayers:tempArray];
	[tempArray release];
	
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	tempArray = [[NSMutableArray alloc] init];
	for (int i=0;i<sbuffer;i++) {
		[tempArray addObject:[FutureRegenLoader readFromData:data atOffset:&offset]];
	}
	[object setFutureRegenStaff:tempArray];
	[tempArray release];
	
	if (debug) { NSLog(@"at unknown array at %d",offset); }
	
	/*
	
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	if (sbuffer>0 && debug) { NSLog(@"unknown array at %d",offset); }
	tempArray = [[NSMutableArray alloc] init];
	for (int i=0;i<sbuffer;i++) {
		[tempArray addObject:[Unknown2Loader readFromData:data atOffset:&offset]];
	}
	[object setUnknowns3:tempArray];
	[tempArray release];
	
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	tempArray = [[NSMutableArray alloc] init];
	for (int i=0;i<sbuffer;i++) {
		[tempArray addObject:[FamousPlayerLoader readFromData:data atOffset:&offset]];
	}
	[object setFamousPlayers:tempArray];
	[tempArray release];
	
	if (debug) { NSLog(@"after famous players at %d",offset); }
	
	 */
	
	// ???
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setUnknownShort1:sbuffer];
	 
	// ???
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	if (sbuffer>0 && debug) { NSLog(@"unknown array at %d",offset); }
	tempArray = [[NSMutableArray alloc] init];
	for (int i=0;i<sbuffer;i++) {
		[tempArray addObject:[Unknown5Loader readFromData:data atOffset:&offset]];
	}
	[object setUnknowns4:tempArray];
	[tempArray release];
	 
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setUnknownShort2:sbuffer];
	[object setUnknownData6:[data subdataWithRange:NSMakeRange(offset, (sbuffer * 8))]]; offset += (sbuffer * 8);
	
	// ???
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar1:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar2:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar3:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar4:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar5:cbuffer];
	
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setReputation:sbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setStyleOfFootball:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setStateOfDevelopment:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setGameImportance:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setLeagueStandard:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setFIFAFullMember:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setEconomicFactor:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setYearsToGainNationality:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setGainNationalityType:cbuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setContinentID:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setRegionID:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setCapitalID:ibuffer];
	
	if (debug) { NSLog(@"after capital at %d",offset); }
	
	// ???
	[object setUnknownData2:[data subdataWithRange:NSMakeRange(offset, 19)]]; offset += 19;
	
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	tempArray = [[NSMutableArray alloc] init];
	for (int i=0;i<cbuffer;i++) {
		[tempArray addObject:[SpokenLanguageLoader readFromData:data atOffset:&offset]];
	}
	[object setSpokenLanguages:tempArray];
	[tempArray release];
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	tempArray = [[NSMutableArray alloc] init];
	for (int i=0;i<cbuffer;i++) {
		[tempArray addObject:[TransferPreferenceLoader readFromData:data atOffset:&offset]];
	}
	[object setTransferPreferences:tempArray];
	[tempArray release];
	
	if (debug) { NSLog(@"at new things at %d",offset); }
	
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	tempArray = [[NSMutableArray alloc] init];
	for (int i=0;i<ibuffer;i++) {
		[tempArray addObject:[TreatedNationsLoader readFromData:data atOffset:&offset]];
	}
	[object setEUTreatedNations:tempArray];
	[tempArray release];
	
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	tempArray = [[NSMutableArray alloc] init];
	for (int i=0;i<ibuffer;i++) {
		[tempArray addObject:[TreatedNationsLoader readFromData:data atOffset:&offset]];
	}
	[object setNonEUTreatedNations:tempArray];
	[tempArray release];
	
	[data getBytes:&count range:NSMakeRange(offset, 4)]; offset += 4;
	tempArray = [[NSMutableArray alloc] init];
	for (int i=0;i<count;i++) {
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[tempArray addObject:[NSNumber numberWithInt:ibuffer]];
	}
	[object setAgreements:tempArray];
	[tempArray release];
	
//	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
//	offset += (ibuffer*22);
	
//	offset += 100;
	
	// ???
	[object setUnknownData3:[data subdataWithRange:NSMakeRange(offset, 16)]]; offset += 16;
	
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setLength:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setWidth:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setArea:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setPopulation:ibuffer];
		
	// ???
	[object setUnknownData4:[data subdataWithRange:NSMakeRange(offset, 31)]]; offset += 31;
	
	// ???
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	if (cbuffer>0 && debug) { NSLog(@"unknown array at %d",offset); }
	tempArray = [[NSMutableArray alloc] init];
	for (int i=0;i<cbuffer;i++) {
		[tempArray addObject:[Unknown6Loader readFromData:data atOffset:&offset]];
	}
	[object setUnknowns5:tempArray];
	[tempArray release];
	
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
	
	if (debug) { NSLog(@"Nation %d (%@) at %d",[object rowID],[[object teamContainer] name], offset); }
	
	*byteOffset = offset;
	
	return object;
}

@end
