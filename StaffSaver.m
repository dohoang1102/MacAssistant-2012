//
//  StaffSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 10/07/25.
//  Copyright 2010 littleblue. All rights reserved.
//

#import "GameVersions.h"
#import "StaffSaver.h"
#import "Contract.h"
#import "ContractSaver.h"
#import "ContractOfferSaver.h"
#import "FMDateSaver.h"
#import "InterestedClubSaver.h"

@implementation StaffSaver

+ (void)saveStaff:(Staff *)object toData:(NSMutableData *)data version:(short)version
{
	char cbuffer;
	short sbuffer;
	int ibuffer;
	BOOL bbuffer;
	
	cbuffer = [object unknownChar1];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object unknownChar2];
	[data appendBytes:&cbuffer length:1];
	ibuffer = [object lastClubID];
	[data appendBytes:&ibuffer length:4];
	cbuffer = [object fullCaps];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object fullGoals];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object u21Caps];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object u21Goals];
	[data appendBytes:&cbuffer length:1];
	ibuffer = [object nationalTeamID];
	[data appendBytes:&ibuffer length:4];
	cbuffer = [object nationalJob];
	[data appendBytes:&cbuffer length:1];
	[FMDateSaver saveDate:[object nationalTeamJoinDate] toData:data];
	ibuffer = [object clubTeamID];
	[data appendBytes:&ibuffer length:4];
	cbuffer = [object clubJob];
	[data appendBytes:&cbuffer length:1];
	[FMDateSaver saveDate:[object clubTeamJoinDate] toData:data];
	cbuffer = [object currentLanguageProficiency];
	[data appendBytes:&cbuffer length:1];
	
	cbuffer = [[object transferOffers] count];
	[data appendBytes:&cbuffer length:1];
	for (int i = 0; i<[[object transferOffers] count]; i++) {
		ibuffer = [[[object transferOffers] objectAtIndex:i] intValue];
		[data appendBytes:&ibuffer length:4];
	}
	
	ibuffer = [object contractOfferDecisionDateUniqueID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object historyID];
	[data appendBytes:&ibuffer length:4];
	
	cbuffer = [[object contracts] count];
	[data appendBytes:&cbuffer length:1];
	for (int i = 0; i<[[object contracts] count]; i++) {
		[ContractSaver saveContract:[[object contracts] objectAtIndex:i] toData:data type:0 offer:NO];
	}
	
	cbuffer = [[object contractOffers] count];
	[data appendBytes:&cbuffer length:1];
	for (int i = 0; i<[[object contractOffers] count]; i++) {
		[ContractOfferSaver saveContractOffer:[[object contractOffers] objectAtIndex:i] toData:data];
	}
	
	bbuffer = [object hasStaffRoles];
	[data appendBytes:&bbuffer length:1];
	
	if ([object hasStaffRoles]) {
		cbuffer = [object managerRole];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object assistantManagerRole];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object coachRole];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object physioRole];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object scoutRole];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object goalkeepingCoachRole];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object fitnessCoachRole];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar7];
		[data appendBytes:&cbuffer length:1];
		
	}
	
	sbuffer = [object unknownShort1];
	[data appendBytes:&sbuffer length:2];
	
	[data appendData:[object unknownData2]];
	
	cbuffer = [object unknownChar4];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object unknownChar5];
	[data appendBytes:&cbuffer length:1];
	
	[FMDateSaver saveDate:[object currentNationJoinDate] toData:data];
	
	cbuffer = [object unknownChar6];
	[data appendBytes:&cbuffer length:1];
	
	[FMDateSaver saveDate:[object unknownDate1] toData:data];
	
	[data appendData:[object unknownData3]];
}

@end
