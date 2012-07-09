//
//  NationSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 10/01/05.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "NationSaver.h"
#import "GeneralInfoSaver.h"
#import "FutureRegenSaver.h"
#import "TransferPreferenceSaver.h"
#import "TreatedNationsSaver.h"
#import "FifaRankingMatchSaver.h"
#import "TeamContainerSaver.h"
#import "SpokenLanguageSaver.h"
#import "FamousPlayerSaver.h"
#import "Unknown2Saver.h"
#import "Unknown4Saver.h"
#import "Unknown5Saver.h"
#import "Unknown6Saver.h"

@implementation NationSaver

+ (void)saveNation:(Nation *)object toData:(NSMutableData *)data
{
	char cbuffer;
	short sbuffer;
	int ibuffer;
	float fbuffer;
	BOOL bbuffer;
	
	cbuffer = [object databaseClass];
	[data appendBytes:&cbuffer length:1];
	sbuffer = [object numberOfClubs];
	[data appendBytes:&sbuffer length:2];
	ibuffer = [object numberOfStaff];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object numberOfPlayers];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object numberOfCities];
	[data appendBytes:&ibuffer length:4];
	[data appendData:[object unknownData1]];
	sbuffer = [object FIFARanking];
	[data appendBytes:&sbuffer length:2];
	sbuffer = [object FIFARankingPoints];
	[data appendBytes:&sbuffer length:2];
	ibuffer = [object nationalStadiumID];
	[data appendBytes:&ibuffer length:4];
	cbuffer = [object wageBudget];
	[data appendBytes:&cbuffer length:1];
	fbuffer = [object wageFactor];
	[data appendBytes:&fbuffer length:4];
	sbuffer = [object currentGameIndex];
	[data appendBytes:&sbuffer length:2];
	ibuffer = [object firstNameStartIndex];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object surnameStartIndex];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object commonNameStartIndex];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object firstNameCount];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object surnameCount];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object commonNameCount];
	[data appendBytes:&ibuffer length:4];
	bbuffer = [object leagueSelected];
	[data appendBytes:&bbuffer length:1];
	bbuffer = [object ruleGroupLoaded];
	[data appendBytes:&bbuffer length:1];
	cbuffer = [object updateDays];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object flags];
	[data appendBytes:&cbuffer length:1];
	
	[data appendData:[object unknownData5]];
	
	fbuffer = [object unknownFloat1];
	[data appendBytes:&fbuffer length:4];
	
	ibuffer = [[object infos] count];
	[data appendBytes:&ibuffer length:4];
	for (int i = 0; i<[[object infos] count]; i++) {
		[GeneralInfoSaver saveInfo:[[object infos] objectAtIndex:i] toData:data saveInfo:YES];
	}
	cbuffer = [[object rankingPoints] count];
	[data appendBytes:&cbuffer length:1];
	for (int i = 0; i<[[object rankingPoints] count]; i++) {
		sbuffer = [[[object rankingPoints] objectAtIndex:i] shortValue];
		[data appendBytes:&sbuffer length:2];
	}
	cbuffer = [[object rankingMatches] count];
	[data appendBytes:&cbuffer length:1];
	for (int i = 0; i<[[object rankingMatches] count]; i++) {
		[FifaRankingMatchSaver saveMatch:[[object rankingMatches] objectAtIndex:i] toData:data];
	}
	cbuffer = [[object unknowns1] count];
	[data appendBytes:&cbuffer length:1];
	for (int i = 0; i<[[object unknowns1] count]; i++) {
		[Unknown4Saver saveUnknown:[[object unknowns1] objectAtIndex:i] toData:data];
	}
	cbuffer = [[object coefficients] count];
	[data appendBytes:&cbuffer length:1];
	for (int i = 0; i<[[object coefficients] count]; i++) {
		fbuffer = [[[object coefficients] objectAtIndex:i] floatValue];
		[data appendBytes:&fbuffer length:4];
	}
	sbuffer = [[object humanPlayerPool] count];
	[data appendBytes:&sbuffer length:2];
	for (int i = 0; i<[[object humanPlayerPool] count]; i++) {
		ibuffer = [[[object humanPlayerPool] objectAtIndex:i] intValue];
		[data appendBytes:&ibuffer length:4];
	}
	sbuffer = [[object unknowns2] count];
	[data appendBytes:&sbuffer length:2];
	for (int i = 0; i<[[object unknowns2] count]; i++) {
		ibuffer = [[[object unknowns2] objectAtIndex:i] intValue];
		[data appendBytes:&ibuffer length:4];
	}
	
	sbuffer = [object mainSquadGkShortlistMinimumReputation];
	[data appendBytes:&sbuffer length:2];
	cbuffer = [[object mainSquadGkShortlist] count];
	[data appendBytes:&cbuffer length:1];
	for (int i = 0; i<[[object mainSquadGkShortlist] count]; i++) {
		ibuffer = [[[object mainSquadGkShortlist] objectAtIndex:i] intValue];
		[data appendBytes:&ibuffer length:4];
	}
	sbuffer = [object mainSquadDefShortlistMinimumReputation];
	[data appendBytes:&sbuffer length:2];
	cbuffer = [[object mainSquadDefShortlist] count];
	[data appendBytes:&cbuffer length:1];
	for (int i = 0; i<[[object mainSquadDefShortlist] count]; i++) {
		ibuffer = [[[object mainSquadDefShortlist] objectAtIndex:i] intValue];
		[data appendBytes:&ibuffer length:4];
	}
	sbuffer = [object mainSquadMidShortlistMinimumReputation];
	[data appendBytes:&sbuffer length:2];
	cbuffer = [[object mainSquadMidShortlist] count];
	[data appendBytes:&cbuffer length:1];
	for (int i = 0; i<[[object mainSquadMidShortlist] count]; i++) {
		ibuffer = [[[object mainSquadMidShortlist] objectAtIndex:i] intValue];
		[data appendBytes:&ibuffer length:4];
	}
	sbuffer = [object mainSquadFwShortlistMinimumReputation];
	[data appendBytes:&sbuffer length:2];
	cbuffer = [[object mainSquadFwShortlist] count];
	[data appendBytes:&cbuffer length:1];
	for (int i = 0; i<[[object mainSquadFwShortlist] count]; i++) {
		ibuffer = [[[object mainSquadFwShortlist] objectAtIndex:i] intValue];
		[data appendBytes:&ibuffer length:4];
	}
	
	sbuffer = [object u21GkShortlistMinimumReputation];
	[data appendBytes:&sbuffer length:2];
	cbuffer = [[object u21GkShortlist] count];
	[data appendBytes:&cbuffer length:1];
	for (int i = 0; i<[[object u21GkShortlist] count]; i++) {
		ibuffer = [[[object u21GkShortlist] objectAtIndex:i] intValue];
		[data appendBytes:&ibuffer length:4];
	}
	sbuffer = [object u21DefShortlistMinimumReputation];
	[data appendBytes:&sbuffer length:2];
	cbuffer = [[object u21DefShortlist] count];
	[data appendBytes:&cbuffer length:1];
	for (int i = 0; i<[[object u21DefShortlist] count]; i++) {
		ibuffer = [[[object u21DefShortlist] objectAtIndex:i] intValue];
		[data appendBytes:&ibuffer length:4];
	}
	sbuffer = [object u21MidShortlistMinimumReputation];
	[data appendBytes:&sbuffer length:2];
	cbuffer = [[object u21MidShortlist] count];
	[data appendBytes:&cbuffer length:1];
	for (int i = 0; i<[[object u21MidShortlist] count]; i++) {
		ibuffer = [[[object u21MidShortlist] objectAtIndex:i] intValue];
		[data appendBytes:&ibuffer length:4];
	}
	sbuffer = [object u21FwShortlistMinimumReputation];
	[data appendBytes:&sbuffer length:2];
	cbuffer = [[object u21FwShortlist] count];
	[data appendBytes:&cbuffer length:1];
	for (int i = 0; i<[[object u21FwShortlist] count]; i++) {
		ibuffer = [[[object u21FwShortlist] objectAtIndex:i] intValue];
		[data appendBytes:&ibuffer length:4];
	}
	
	sbuffer = [object u19GkShortlistMinimumReputation];
	[data appendBytes:&sbuffer length:2];
	cbuffer = [[object u19GkShortlist] count];
	[data appendBytes:&cbuffer length:1];
	for (int i = 0; i<[[object u19GkShortlist] count]; i++) {
		ibuffer = [[[object u19GkShortlist] objectAtIndex:i] intValue];
		[data appendBytes:&ibuffer length:4];
	}
	sbuffer = [object u19DefShortlistMinimumReputation];
	[data appendBytes:&sbuffer length:2];
	cbuffer = [[object u19DefShortlist] count];
	[data appendBytes:&cbuffer length:1];
	for (int i = 0; i<[[object u19DefShortlist] count]; i++) {
		ibuffer = [[[object u19DefShortlist] objectAtIndex:i] intValue];
		[data appendBytes:&ibuffer length:4];
	}
	sbuffer = [object u19MidShortlistMinimumReputation];
	[data appendBytes:&sbuffer length:2];
	cbuffer = [[object u19MidShortlist] count];
	[data appendBytes:&cbuffer length:1];
	for (int i = 0; i<[[object u19MidShortlist] count]; i++) {
		ibuffer = [[[object u19MidShortlist] objectAtIndex:i] intValue];
		[data appendBytes:&ibuffer length:4];
	}
	sbuffer = [object u19FwShortlistMinimumReputation];
	[data appendBytes:&sbuffer length:2];
	cbuffer = [[object u19FwShortlist] count];
	[data appendBytes:&cbuffer length:1];
	for (int i = 0; i<[[object u19FwShortlist] count]; i++) {
		ibuffer = [[[object u19FwShortlist] objectAtIndex:i] intValue];
		[data appendBytes:&ibuffer length:4];
	}
	
	sbuffer = [[object bannedPlayers] count];
	[data appendBytes:&sbuffer length:2];
	for (int i = 0; i<[[object bannedPlayers] count]; i++) {
		ibuffer = [[[object bannedPlayers] objectAtIndex:i] intValue];
		[data appendBytes:&ibuffer length:4];
	}
	ibuffer = [[object agents] count];
	[data appendBytes:&ibuffer length:4];
	for (int i = 0; i<[[object agents] count]; i++) {
		ibuffer = [[[object agents] objectAtIndex:i] intValue];
		[data appendBytes:&ibuffer length:4];
	}
	
	sbuffer = [[object futureRegenPlayers] count];
	[data appendBytes:&sbuffer length:2];
	for (int i = 0; i<[[object futureRegenPlayers] count]; i++) {
		[FutureRegenSaver saveRegen:[[object futureRegenPlayers] objectAtIndex:i] toData:data];
	}
	sbuffer = [[object futureRegenStaff] count];
	[data appendBytes:&sbuffer length:2];
	for (int i = 0; i<[[object futureRegenStaff] count]; i++) {
		[FutureRegenSaver saveRegen:[[object futureRegenStaff] objectAtIndex:i] toData:data];
	}
	
	/*
	sbuffer = [[object unknowns3] count];
	[data appendBytes:&sbuffer length:2];
	for (int i = 0; i<[[object unknowns3] count]; i++) {
		[Unknown2Saver saveUnknown:[[object unknowns3] objectAtIndex:i] toData:data];
	}
	sbuffer = [[object famousPlayers] count];
	[data appendBytes:&sbuffer length:2];
	for (int i = 0; i<[[object famousPlayers] count]; i++) {
		[FamousPlayerSaver savePlayer:[[object famousPlayers] objectAtIndex:i] toData:data];
	}
	 
	*/
	
	sbuffer = [object unknownShort1];
	[data appendBytes:&sbuffer length:2];
	
	sbuffer = [[object unknowns4] count];
	[data appendBytes:&sbuffer length:2];
	for (int i = 0; i<[[object unknowns4] count]; i++) {
		[Unknown5Saver saveUnknown:[[object unknowns4] objectAtIndex:i] toData:data];
	}
	
	sbuffer = [object unknownShort2];
	[data appendBytes:&sbuffer length:2];
	[data appendData:[object unknownData6]];
	
	// ???
	cbuffer = [object unknownChar1];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object unknownChar2];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object unknownChar3];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object unknownChar4];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object unknownChar5];
	[data appendBytes:&cbuffer length:1];
	
	sbuffer = [object reputation];
	[data appendBytes:&sbuffer length:2];
	cbuffer = [object styleOfFootball];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object stateOfDevelopment];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object gameImportance];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object leagueStandard];
	[data appendBytes:&cbuffer length:1];
	bbuffer = [object FIFAFullMember];
	[data appendBytes:&bbuffer length:1];
	cbuffer = [object economicFactor];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object yearsToGainNationality];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object gainNationalityType];
	[data appendBytes:&cbuffer length:1];
	ibuffer = [object continentID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object regionID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object capitalID];
	[data appendBytes:&ibuffer length:4];
	[data appendData:[object unknownData2]];
	
	cbuffer = [[object spokenLanguages] count];
	[data appendBytes:&cbuffer length:1];
	for (int i = 0; i<[[object spokenLanguages] count]; i++) {
		[SpokenLanguageSaver saveLanguage:[[object spokenLanguages] objectAtIndex:i] toData:data];
	}
	cbuffer = [[object transferPreferences] count];
	[data appendBytes:&cbuffer length:1];
	for (int i = 0; i<[[object transferPreferences] count]; i++) {
		[TransferPreferenceSaver savePreference:[[object transferPreferences] objectAtIndex:i] toData:data];
	}
	
	ibuffer = [[object EUTreatedNations] count];
	[data appendBytes:&ibuffer length:4];
	for (int i = 0; i<[[object EUTreatedNations] count]; i++) {
		[TreatedNationsSaver saveNations:[[object EUTreatedNations] objectAtIndex:i] toData:data];
	}
	ibuffer = [[object nonEUTreatedNations] count];
	[data appendBytes:&ibuffer length:4];
	for (int i = 0; i<[[object nonEUTreatedNations] count]; i++) {
		[TreatedNationsSaver saveNations:[[object nonEUTreatedNations] objectAtIndex:i] toData:data];
	}
	
	ibuffer = [[object agreements] count];
	[data appendBytes:&ibuffer length:4];
	for (int i = 0; i<[[object agreements] count]; i++) {
		ibuffer = [[[object agreements] objectAtIndex:i] intValue];
		[data appendBytes:&ibuffer length:4];
	}
	
	[data appendData:[object unknownData3]];
	ibuffer = [object length];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object width];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object area];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object population];
	[data appendBytes:&ibuffer length:4];
	[data appendData:[object unknownData4]];
	
	cbuffer = [[object unknowns5] count];
	[data appendBytes:&cbuffer length:1];
	for (int i = 0; i<[[object unknowns5] count]; i++) {
		[Unknown6Saver saveUnknown:[[object unknowns5] objectAtIndex:i] toData:data];
	}
	
	[TeamContainerSaver saveTeamContainer:[object teamContainer] toData:data];
	
	ibuffer = [object rowID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object UID];
	[data appendBytes:&ibuffer length:4];
}

@end
