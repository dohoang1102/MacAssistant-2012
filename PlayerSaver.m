//
//  PlayerSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 10/07/25.
//  Copyright 2010 littleblue. All rights reserved.
//

#import "PlayerSaver.h"
#import "PlayerFormSaver.h"
#import "BookingCountSaver.h"
#import "PlayerBanSaver.h"
#import "PlayerInjurySaver.h"
#import "FMDateSaver.h"
#import "GameVersions.h"

@implementation PlayerSaver

+ (void)savePlayer:(Player *)object toData:(NSMutableData *)data version:(short)version
{
	char cbuffer;
	short sbuffer;
	int ibuffer;
	float fbuffer;
	unsigned long long llbuffer;
	BOOL bbuffer;
	
	sbuffer = [object homeReputation];
	[data appendBytes:&sbuffer length:2];
	sbuffer = [object currentReputation];
	[data appendBytes:&sbuffer length:2];
	sbuffer = [object worldReputation];
	[data appendBytes:&sbuffer length:2];
	sbuffer = [object currentAbility];
	[data appendBytes:&sbuffer length:2];
	sbuffer = [object potentialAbility];
	[data appendBytes:&sbuffer length:2];
	ibuffer = [object playerStatsID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object value];
	[data appendBytes:&ibuffer length:4];
	cbuffer = [object morale];
	[data appendBytes:&cbuffer length:1];
	[FMDateSaver saveDate:[object unknownDate1] toData:data];
	
	sbuffer = [object fitness];
	[data appendBytes:&sbuffer length:2];
	sbuffer = [object jadedness];
	[data appendBytes:&sbuffer length:2];
	sbuffer = [object condition];
	[data appendBytes:&sbuffer length:2];
	
	[data appendData:[object unknownData1]];
	bbuffer = [object declaredForNation];
	[data appendBytes:&bbuffer length:1];
	sbuffer = [object weight];
	[data appendBytes:&sbuffer length:2];
	sbuffer = [object height];
	[data appendBytes:&sbuffer length:2];
	fbuffer = [object unknownFloat1];
	[data appendBytes:&fbuffer length:4];
	cbuffer = [object unknownChar1];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object unknownChar2];
	[data appendBytes:&cbuffer length:1];
	[data appendData:[object unknownData2]];
	ibuffer = [object askingPrice];
	[data appendBytes:&ibuffer length:4];
	[data appendData:[object unknownData3]];
	cbuffer = [object unknownChar3];
	[data appendBytes:&cbuffer length:1];
	[data appendData:[object unknownData4]];
	[data appendData:[object unknownData5]];
	[FMDateSaver saveDate:[object unknownDate3] toData:data];
	[FMDateSaver saveDate:[object unknownDate4] toData:data];
	[FMDateSaver saveDate:[object unknownDate5] toData:data];
	[FMDateSaver saveDate:[object unknownDate6] toData:data];
	bbuffer = [object unknownBool1];
	[data appendBytes:&bbuffer length:1];
	
	if ([object unknownBool1]) {
		[data appendData:[object unknownData6]];
	}
	
	ibuffer = [object firstClubID];
	[data appendBytes:&ibuffer length:4];
	llbuffer = [object preferredMoves];
	[data appendBytes:&llbuffer length:8];
	ibuffer = [object unknownInt1];
	[data appendBytes:&ibuffer length:4];
	[FMDateSaver saveDate:[object unknownDate7] toData:data];
	bbuffer = [object hasCareerStats];
	[data appendBytes:&bbuffer length:1];
	
	if ([object hasCareerStats]) {
		sbuffer = [object clubLeagueGoals];
		[data appendBytes:&sbuffer length:2];
		sbuffer = [object clubGoals];
		[data appendBytes:&sbuffer length:2];
		sbuffer = [object clubAppearances];
		[data appendBytes:&sbuffer length:2];
		sbuffer = [object leagueGoals];
		[data appendBytes:&sbuffer length:2];
		sbuffer = [object goals];
		[data appendBytes:&sbuffer length:2];
		sbuffer = [object appearances];
		[data appendBytes:&sbuffer length:2];
		sbuffer = [object clubLeagueAppearances];
		[data appendBytes:&sbuffer length:2];
		sbuffer = [object leagueAppearances];
		[data appendBytes:&sbuffer length:2];
		sbuffer = [object unknownShort1];
		[data appendBytes:&sbuffer length:2];
	}
	
	bbuffer = [object hasExtraPlayingData];
	[data appendBytes:&bbuffer length:1];
	
	if ([object hasExtraPlayingData]) {
		cbuffer = [[object injuries] count];
		[data appendBytes:&cbuffer length:1];
		for (int i = 0; i<[[object injuries] count]; i++) {
			[PlayerInjurySaver saveInjury:[[object injuries] objectAtIndex:i] toData:data];
		}
		
		cbuffer = [[object bans] count];
		[data appendBytes:&cbuffer length:1];
		for (int i = 0; i<[[object bans] count]; i++) {
			[PlayerBanSaver saveBan:[[object bans] objectAtIndex:i] toData:data];
		}
		
//		cbuffer = [object unknownChar5];
//		[data appendBytes:&cbuffer length:1];
//		[data appendData:[object unknownData7]];
		
		cbuffer = [object unknownChar6];
		[data appendBytes:&cbuffer length:1];
		[data appendData:[object unknownData8]];
		
		cbuffer = [object unknownChar7];
		[data appendBytes:&cbuffer length:1];
		[data appendData:[object unknownData9]];
		
		cbuffer = [object unknownChar8];
		[data appendBytes:&cbuffer length:1];
		[data appendData:[object unknownData10]];
		
		cbuffer = [object unknownChar9];
		[data appendBytes:&cbuffer length:1];
		[data appendData:[object unknownData11]];
	}
	
	bbuffer = [object hasMLSData];
	[data appendBytes:&bbuffer length:1];
	
	if ([object hasMLSData]) {
		cbuffer = [object MLSPlayerType];
		[data appendBytes:&cbuffer length:1];
		ibuffer = [object MLSRightsClubID];
		[data appendBytes:&ibuffer length:4];
		[FMDateSaver saveDate:[object MLSRightsExpiryDate] toData:data];
		cbuffer = [object MLSDraftType];
		[data appendBytes:&cbuffer length:1];
		ibuffer = [object MLSLastDraftClubID];
		[data appendBytes:&ibuffer length:4];
		sbuffer = [object MLSLastDraftYear];
		[data appendBytes:&sbuffer length:2];
		cbuffer = [object MLSLastDraftPick];
		[data appendBytes:&cbuffer length:1];
		bbuffer = [object MLSGuaranteedDealClub];
		[data appendBytes:&bbuffer length:1];
		cbuffer = [object MLSLastDraftRound];
		[data appendBytes:&cbuffer length:1];
		bbuffer = [object MLSGuaranteedDealPlayer];
		[data appendBytes:&bbuffer length:1];
		[FMDateSaver saveDate:[object MLSDiscoveryPlayerDate] toData:data];
	}
	
	bbuffer = [object hasInternationalCareer];
	[data appendBytes:&bbuffer length:1];
	
	if ([object hasInternationalCareer]) {
		[data appendData:[object unknownData13]];
		[FMDateSaver saveDate:[object unknownDate8] toData:data];
		[data appendData:[object unknownData14]];
		
		cbuffer = [object unknownChar11];
		[data appendBytes:&cbuffer length:1];
		[data appendData:[object unknownData15]];
		
		cbuffer = [object unknownChar12];
		[data appendBytes:&cbuffer length:1];
		[data appendData:[object unknownData16]];
		
		cbuffer = [object unknownChar13];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar14];
		[data appendBytes:&cbuffer length:1];
		
		cbuffer = [object unknownChar15];
		[data appendBytes:&cbuffer length:1];
		[data appendData:[object unknownData17]];
		
		[FMDateSaver saveDate:[object lastInternationalMatch] toData:data];
		[data appendData:[object unknownData18]];
		[FMDateSaver saveDate:[object unknownDate10] toData:data];
		[FMDateSaver saveDate:[object unknownDate11] toData:data];
		[data appendData:[object unknownData19]];
		[FMDateSaver saveDate:[object internationalRetirementDate] toData:data];
		cbuffer = [object unknownChar16];
		[data appendBytes:&cbuffer length:1];
		
		[FMDateSaver saveDate:[object internationalDebutDate] toData:data];
		ibuffer = [object internationalDebutOpposition];
		[data appendBytes:&ibuffer length:4];
	
		[FMDateSaver saveDate:[object unknownDate14] toData:data];
		[data appendData:[object unknownData21]];
	}
	
	cbuffer = [[object bookingCounts] count];
	[data appendBytes:&cbuffer length:1];
	for (int i = 0; i<[[object bookingCounts] count]; i++) {
		[BookingCountSaver saveCount:[[object bookingCounts] objectAtIndex:i] toData:data];
	}
	
	bbuffer = [object hasForms];
	[data appendBytes:&bbuffer length:1];
	
	if ([object hasForms]) {
		cbuffer = [[object forms] count];
		[data appendBytes:&cbuffer length:1];
		for (int i = 0; i<[[object forms] count]; i++) {
			[PlayerFormSaver savePlayerForm:[[object forms] objectAtIndex:i] toData:data];
		}
		
		bbuffer = [object unknownBool2];
		[data appendBytes:&bbuffer length:1];
		
		if ([object unknownBool2]) {
			cbuffer = [object unknownChar17];
			[data appendBytes:&cbuffer length:1];
			[data appendData:[object unknownData22]];
		}
	}
	
	ibuffer = [object teamLastPlayedForID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object unknownInt2];
	[data appendBytes:&ibuffer length:4];
	
	[FMDateSaver saveDate:[object lastUpdateDate] toData:data];
	[FMDateSaver saveDate:[object nextFitnessDropDate] toData:data];
	ibuffer = [object recurringInjuryID];
	[data appendBytes:&ibuffer length:4];
	cbuffer = [object recurringInjuryOccuranceCount];
	[data appendBytes:&cbuffer length:1];
	ibuffer = [object fileListID];
	[data appendBytes:&ibuffer length:4];
	cbuffer = [object sentLightTrainingNews];
	[data appendBytes:&cbuffer length:1];
	ibuffer = [object lastInjuryTypeID];
	[data appendBytes:&ibuffer length:4];
	cbuffer = [object trainingLevel];
	[data appendBytes:&cbuffer length:1];
	sbuffer = [object daysSinceLastMatch];
	[data appendBytes:&sbuffer length:2];
	cbuffer = [object minutesPlayedLastMatch];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object unknownChar4];
	[data appendBytes:&cbuffer length:1];
}

@end
