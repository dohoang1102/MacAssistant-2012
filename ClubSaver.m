//
//  ClubSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/23.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "GameVersions.h"
#import "ClubSaver.h"
#import "ClubFinanceSaver.h"
#import "FMString.h"
#import "FMDateSaver.h"
#import "TeamContainerSaver.h"
#import "RegionalDivisionSaver.h"
#import "ScoutingKnowledgeSaver.h"
#import "ClubSponsorSaver.h"
#import "IDPCSaver.h"
#import "ShortlistedPersonSaver.h"

@implementation ClubSaver

+ (void)saveClub:(Club *)object toData:(NSMutableData *)data version:(short)version
{
	char cbuffer;
	unsigned char ucbuffer;
	short sbuffer;
	float fbuffer;
	int ibuffer;
	BOOL bbuffer;
	
	cbuffer = [object databaseClass];
	[data appendBytes:&cbuffer length:1];
	
	if ([object databaseClass]) {
		ibuffer = [object competitionID];
		[data appendBytes:&ibuffer length:4];
		ibuffer = [object maximumWeeklyWage];
		[data appendBytes:&ibuffer length:4];
		bbuffer = [object allowSponsorshipForTopPlayers];
		[data appendBytes:&bbuffer length:1];
	}
	
	ibuffer = [object nationID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object cityID];
	[data appendBytes:&ibuffer length:4];
	cbuffer = [object nickname1Gender];
	[data appendBytes:&cbuffer length:1];
	[FMString saveString:[object nickname1] toData:data];
	cbuffer = [object nickname2Gender];
	[data appendBytes:&cbuffer length:1];
	[FMString saveString:[object nickname2] toData:data];
	cbuffer = [object youthAcademy];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object youthSetup];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object youthRecruitment];
	[data appendBytes:&cbuffer length:1];
	sbuffer = [object yearFounded];
	[data appendBytes:&sbuffer length:2];
	ibuffer = [object futureTransferManagerID];
	[data appendBytes:&ibuffer length:4];
	cbuffer = [object professionalStatus];
	[data appendBytes:&cbuffer length:1];
	ibuffer = [object averageAttendance];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object minimumAttendance];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object maximumAttendance];
	[data appendBytes:&ibuffer length:4];
	cbuffer = [object trainingFacilities];
	[data appendBytes:&cbuffer length:1];
	ucbuffer = [object flags];
	[data appendBytes:&ucbuffer length:1];
	cbuffer = [object unknownChar1];
	[data appendBytes:&cbuffer length:1];
	ibuffer = [object chairmanID];
	[data appendBytes:&ibuffer length:4];
	cbuffer = [object roughFinancialState];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object morale];
	[data appendBytes:&cbuffer length:1];
	
	cbuffer = [[object directors] count];
	[data appendBytes:&cbuffer length:1];
	for (int i = 0; i<[[object directors] count]; i++) {
		ibuffer = [[[object directors] objectAtIndex:i] intValue];
		[data appendBytes:&ibuffer length:4];
	}
	cbuffer = [[object scouts] count];
	[data appendBytes:&cbuffer length:1];
	for (int i = 0; i<[[object scouts] count]; i++) {
		ibuffer = [[[object scouts] objectAtIndex:i] intValue];
		[data appendBytes:&ibuffer length:4];
	}
	
	[ClubFinanceSaver saveFinance:[object finance] toData:data version:version];
	
	sbuffer = [[object transferOffers] count];
	[data appendBytes:&sbuffer length:2];
	for (int i = 0; i<[[object transferOffers] count]; i++) {
		ibuffer = [[[object transferOffers] objectAtIndex:i] intValue];
		[data appendBytes:&ibuffer length:4];
	}
	
	cbuffer = [object firstTeamStrengthRating];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object firstTeamQuicknessRating];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object firstTeamGoalkeepingRating];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object firstTeamTacticsRating];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object firstTeamBallControlRating];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object firstTeamDefendingRating];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object firstTeamAttackingRating];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object firstTeamShootingRating];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object firstTeamSetPiecesRating];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object firstTeamStrengthWorkload];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object firstTeamQuicknessWorkload];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object firstTeamGoalkeepingWorkload];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object firstTeamTacticsWorkload];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object firstTeamBallControlWorkload];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object firstTeamDefendingWorkload];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object firstTeamAttackingWorkload];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object firstTeamShootingWorkload];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object firstTeamSetPiecesWorkload];
	[data appendBytes:&cbuffer length:1];
	
	[data appendData:[object unknownData1]];
	sbuffer = [object unknownShort1];
	[data appendBytes:&sbuffer length:2];
	[data appendData:[object unknownData2]];
		
	cbuffer = [object youthTeamStrengthRating];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object youthTeamQuicknessRating];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object youthTeamGoalkeepingRating];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object youthTeamTacticsRating];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object youthTeamBallControlRating];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object youthTeamDefendingRating];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object youthTeamAttackingRating];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object youthTeamShootingRating];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object youthTeamSetPiecesRating];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object youthTeamStrengthWorkload];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object youthTeamQuicknessWorkload];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object youthTeamGoalkeepingWorkload];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object youthTeamTacticsWorkload];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object youthTeamBallControlWorkload];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object youthTeamDefendingWorkload];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object youthTeamAttackingWorkload];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object youthTeamShootingWorkload];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object youthTeamSetPiecesWorkload];
	[data appendBytes:&cbuffer length:1];
	
	[data appendData:[object unknownData3]];
	sbuffer = [object unknownShort2];
	[data appendBytes:&sbuffer length:2];
	[data appendData:[object unknownData4]];
	
	cbuffer = [[object IDPCs] count];
	[data appendBytes:&cbuffer length:1];
	for (int i = 0; i<[[object IDPCs] count]; i++) {
		[IDPCSaver saveIDPC:[[object IDPCs] objectAtIndex:i] toData:data];
	}
	cbuffer = [[object sponsors] count];
	[data appendBytes:&cbuffer length:1];
	for (int i = 0; i<[[object sponsors] count]; i++) {
		[ClubSponsorSaver saveSponsor:[[object sponsors] objectAtIndex:i] toData:data];
	}
	cbuffer = [[object regionalDivisions] count];
	[data appendBytes:&cbuffer length:1];
	for (int i = 0; i<[[object regionalDivisions] count]; i++) {
		[RegionalDivisionSaver saveDivision:[[object regionalDivisions] objectAtIndex:i] toData:data];
	}
	
	bbuffer = [object hasUEFACoefficient];
	[data appendBytes:&bbuffer length:1];
	
	if ([object hasUEFACoefficient]) {
//		cbuffer = [object UEFAPoints];
//		[data appendBytes:&cbuffer length:1];
//		cbuffer = [object UEFAMatches];
//		[data appendBytes:&cbuffer length:1];
		
		[data appendData:[object unknownData5]];
		
		fbuffer = [object UEFATempCoefficient];
		[data appendBytes:&fbuffer length:4];
		ibuffer = [object UEFA5YearTotal];
		[data appendBytes:&ibuffer length:4];
		cbuffer = [[object coefficients] count];
		[data appendBytes:&cbuffer length:1];
		for (int i = 0; i<[[object coefficients] count]; i++) {
			ibuffer = [[[object coefficients] objectAtIndex:i] intValue];
			[data appendBytes:&ibuffer length:4];
		}
	}
	
	bbuffer = [object hasScoutingKnowledges];
	[data appendBytes:&bbuffer length:1];
	
	if ([object hasScoutingKnowledges]) {
		cbuffer = [object unknownChar2];
		[data appendBytes:&cbuffer length:1];
		
		sbuffer = [[object scoutingKnowledges] count];
		[data appendBytes:&sbuffer length:2];
		for (int i = 0; i<[[object scoutingKnowledges] count]; i++) {
			[ScoutingKnowledgeSaver saveKnowledge:[[object scoutingKnowledges] objectAtIndex:i] toData:data];
		}
	}
	
	cbuffer = [object unknownChar3];
	[data appendBytes:&cbuffer length:1];
	ibuffer = [object seasonTicketHolders];
	[data appendBytes:&ibuffer length:4];
	[FMDateSaver saveDate:[object seasonEndDate] toData:data];
	[FMDateSaver saveDate:[object preSeasonStartDate] toData:data];
	[FMDateSaver saveDate:[object seasonStartDate] toData:data];
	
	cbuffer = [object unknownChar4];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object unknownChar5];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object unknownChar6];
	[data appendBytes:&cbuffer length:1];
	
	[FMDateSaver saveDate:[object unknownDate1] toData:data];
	
	cbuffer = [object unknownChar7];
	[data appendBytes:&cbuffer length:1];
	
	[FMDateSaver saveDate:[object unknownDate2] toData:data];
	
	cbuffer = [object unknownChar8];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object unknownChar9];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object unknownChar10];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object unknownChar11];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object unknownChar12];
	[data appendBytes:&cbuffer length:1];
	[data appendData:[object unknownData6]];
	
	[TeamContainerSaver saveTeamContainer:[object teamContainer] toData:data];
	
	ibuffer = [object rowID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object UID];
	[data appendBytes:&ibuffer length:4];
}

@end
