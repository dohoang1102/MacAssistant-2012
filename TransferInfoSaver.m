//
//  TransferInfoSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/23.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TransferInfoSaver.h"
#import "FMString.h"
#import "FMDateSaver.h"

@implementation TransferInfoSaver

+ (void)saveInfo:(TransferInfo *)object toData:(NSMutableData *)data
{
	BOOL bbuffer;
	char cbuffer;
	short sbuffer;
	int ibuffer;
	
	cbuffer = [object type];
	[data appendBytes:&cbuffer length:1];
	
	if ([object type]==TI_MAX_PLAYERS_ON_LOAN_IN_SEASON) {
		cbuffer = [object playersBeenOnLoan];
		[data appendBytes:&cbuffer length:1];
		ibuffer = [object info];
		[data appendBytes:&ibuffer length:4];
	}
	else if ([object type]==TI_NO_OF_DISCOVERY_PLAYERS_IN_SEASON) {
		cbuffer = [object discoveryPlayersSigned];
		[data appendBytes:&cbuffer length:1];
	}
	else if ([object type]==TI_MONTHLY_INSTALLMENT_INFO) {
		ibuffer = [object cash];
		[data appendBytes:&ibuffer length:4];
		cbuffer = [object paymentsRemaining];
		[data appendBytes:&cbuffer length:1];
	}
	else if ([object type]==TI_UNKNOWN_15) {
		/*
		bbuffer = [object totalValuesExist];
		[data appendBytes:&bbuffer length:1];
		
		if ([object totalValuesExist]) {
			cbuffer = [[object totalValues] count];
			[data appendBytes:&cbuffer length:1];
			for (int i = 0; i<[[object totalValues] count]; i++) {
				ibuffer = [[[object totalValues] objectAtIndex:i] intValue];
				[data appendBytes:&ibuffer length:4];
			}
		}
		
		cbuffer = [object unknownChar1];
		[data appendBytes:&cbuffer length:1];
		[FMDateSaver saveDate:[object lastUpdateDate] toData:data];
		 */
		
		ibuffer = [object unknownInt1];
		[data appendBytes:&ibuffer length:4];
		[FMDateSaver saveDate:[object unknownDate1] toData:data];
	}
	else if ([object type]==TI_PLAYER_FIRST_OPTION_INFO) {
		ibuffer = [object playerID];
		[data appendBytes:&ibuffer length:4];
		ibuffer = [object futureCash];
		[data appendBytes:&ibuffer length:4];
		ibuffer = [object buyingClubID];
		[data appendBytes:&ibuffer length:4];
		[FMDateSaver saveDate:[object firstOptionEndDate] toData:data];
	}
	else if ([object type]==TI_NEXT_SALE_PERCENTAGE_INFO) {
		ibuffer = [object playerID];
		[data appendBytes:&ibuffer length:4];
		ibuffer = [object sellingClubID];
		[data appendBytes:&ibuffer length:4];
		cbuffer = [object percentage];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object feesToCheck];
		[data appendBytes:&cbuffer length:1];
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
		cbuffer = [object unknownChar6];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar7];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar8];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar9];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar10];
		[data appendBytes:&cbuffer length:1];
	}
	else if ([object type]==TI_APPEARANCE_MONEY_INFO) {
		ibuffer = [object playerID];
		[data appendBytes:&ibuffer length:4];
		ibuffer = [object sellingClubID];
		[data appendBytes:&ibuffer length:4];
		ibuffer = [object cash];
		[data appendBytes:&ibuffer length:4];
		cbuffer = [object appearances];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object appearancesSoFar];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object appearanceInfoType];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar1];
		[data appendBytes:&cbuffer length:1];
	}
	else if ([object type]==TI_BUY_BACK_INFO) {
		ibuffer = [object playerID];
		[data appendBytes:&ibuffer length:4];
		ibuffer = [object cash];
		[data appendBytes:&ibuffer length:4];
		ibuffer = [object buyingClubID];
		[data appendBytes:&ibuffer length:4];
	}
	else if ([object type]==TI_MAX_NON_EEC_PLAYERS_INFO) {
		cbuffer = [object maxNumberNonECPlayers];
		[data appendBytes:&cbuffer length:1];
		
		for (int i = 0; i<[[object players] count]; i++) {
			ibuffer = [[[object players] objectAtIndex:i] intValue];
			[data appendBytes:&ibuffer length:4];
		}
	}
	else if ([object type]==TI_STARTING_PLAYER_RECORD_INFO) {
		ibuffer = [object mostAppsPersonID];
		[data appendBytes:&ibuffer length:4];
		sbuffer = [object mostApps];
		[data appendBytes:&sbuffer length:2];
		ibuffer = [object mostGoalsPersonID];
		[data appendBytes:&ibuffer length:4];
		sbuffer = [object mostGoals];
		[data appendBytes:&sbuffer length:2];
		[FMString saveString:[object mostAppsFirstName] toData:data];
		[FMString saveString:[object mostAppsSurname] toData:data];
		[FMString saveString:[object mostGoalsFirstName] toData:data];
		[FMString saveString:[object mostGoalsSurname] toData:data];
	}
	else if ([object type]==TI_ARRANGED_FRIENDLY_INFO) {
		ibuffer = [object playerID];
		[data appendBytes:&ibuffer length:4];
		[FMDateSaver saveDate:[object deadline] toData:data];
		ibuffer = [object buyingClubID];
		[data appendBytes:&ibuffer length:4];
		bbuffer = [object teamHasBeenInvited];
		[data appendBytes:&bbuffer length:1];
		cbuffer = [object unknownChar1];
		[data appendBytes:&cbuffer length:1];
	}
	else if ([object type]==TI_NO_OF_NON_EU_PLAYERS_SIGNED_FROM_ABROAD_PER_SEASON) {
		cbuffer = [object playersSigned];
		[data appendBytes:&cbuffer length:1];
	}
	else if ([object type]==TI_PROMOTION_CASH_INFO) {
		ibuffer = [object playerID];
		[data appendBytes:&ibuffer length:4];
		ibuffer = [object cash];
		[data appendBytes:&ibuffer length:4];
		ibuffer = [object sellingClubID];
		[data appendBytes:&ibuffer length:4];
	}
	else if ([object type]==TI_MAX_PLAYERS_ON_SHORT_TERM_LOAN_IN_SEASON) {
		cbuffer = [object playersBeenOnLoan];
		[data appendBytes:&cbuffer length:1];
		ibuffer = [object info];
		[data appendBytes:&ibuffer length:4];
	}
	else if ([object type]==TI_MAX_PLAYERS_ON_LONG_TERM_LOAN_IN_SEASON) {
		cbuffer = [object playersBeenOnLoan];
		[data appendBytes:&cbuffer length:1];
		ibuffer = [object info];
		[data appendBytes:&ibuffer length:4];
	}
	else if ([object type]==TI_UNKNOWN_1_MLS) {
		ibuffer = [object unknownInt1];
		[data appendBytes:&ibuffer length:4];
		cbuffer = [object unknownChar1];
		[data appendBytes:&cbuffer length:1];
	}
	else if ([object type]==TI_UNKNOWN_2) {
		cbuffer = [[object unknownDates] count];
		[data appendBytes:&cbuffer length:1];
		for (int i = 0; i<[[object unknownDates] count]; i++) {
			[FMDateSaver saveDate:[[object unknownDates] objectAtIndex:i] toData:data];
		}
	}
	else if ([object type]==TI_UNKNOWN_3) {
		ibuffer = [object unknownInt1];
		[data appendBytes:&ibuffer length:4];
		[FMDateSaver saveDate:[object unknownDate1] toData:data];
		cbuffer = [object unknownChar1];
		[data appendBytes:&cbuffer length:1];
	}
	else if ([object type]==TI_UNKNOWN_4) {
		ibuffer = [object unknownInt1];
		[data appendBytes:&ibuffer length:4];
	}
	else if ([object type]==TI_UNKNOWN_5) {
		ibuffer = [object unknownInt1];
		[data appendBytes:&ibuffer length:4];
	}
	else if ([object type]==TI_UNKNOWN_6) {
		ibuffer = [object unknownInt1];
		[data appendBytes:&ibuffer length:4];
		cbuffer = [object unknownChar1];
		[data appendBytes:&cbuffer length:1];
	}
	else if ([object type]==TI_UNKNOWN_7) {
		cbuffer = [object unknownChar1];
		[data appendBytes:&cbuffer length:1];
		[data appendData:[object unknownData1]];
		cbuffer = [object unknownChar2];
		[data appendBytes:&cbuffer length:1];
		[data appendData:[object unknownData2]];
		[data appendData:[object unknownData3]];
	}
	else if ([object type]==TI_UNKNOWN_8) {
		cbuffer = [object unknownChar1];
		[data appendBytes:&cbuffer length:1];
	}
	else if ([object type]==TI_UNKNOWN_9) {
		cbuffer = [object unknownChar1];
		[data appendBytes:&cbuffer length:1];
		ibuffer = [object unknownInt1];
		[data appendBytes:&ibuffer length:4];
	}
	else if ([object type]==TI_UNKNOWN_10) {
		ibuffer = [object unknownInt1];
		[data appendBytes:&ibuffer length:4];
		cbuffer = [object unknownChar1];
		[data appendBytes:&cbuffer length:1];
	}
	else if ([object type]==TI_UNKNOWN_11) {
		ibuffer = [object unknownInt1];
		[data appendBytes:&ibuffer length:4];
		cbuffer = [object unknownChar1];
		[data appendBytes:&cbuffer length:1];
	}
	else if ([object type]==TI_UNKNOWN_12) {
		cbuffer = [object unknownChar1];
		[data appendBytes:&cbuffer length:1];
	}
	else if ([object type]==TI_UNKNOWN_13) {
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
		cbuffer = [object unknownChar6];
		[data appendBytes:&cbuffer length:1];
	}
	else if ([object type]==TI_UNKNOWN_14) {
		cbuffer = [object unknownChar1];
		[data appendBytes:&cbuffer length:1];
		[data appendData:[object unknownData1]];
		cbuffer = [object unknownChar2];
		[data appendBytes:&cbuffer length:1];
	}
	else if ([object type]==TI_UNKNOWN_16) {
		ibuffer = [object unknownInt1];
		[data appendBytes:&ibuffer length:4];
	}
}

@end
