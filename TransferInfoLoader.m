//
//  TransferInfoLoader.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/14.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TransferInfoLoader.h"
#import "FMDateLoader.h"
#import "FMString.h"

@implementation TransferInfoLoader

+ (id)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset
{
	char cbuffer;
	short sbuffer;
	int ibuffer;
	unsigned int uibuffer;
	BOOL debug = FALSE;
	NSMutableArray *tempArray;
	
	unsigned int offset = *byteOffset;
	
	TransferInfo *object = [[TransferInfo alloc] init];
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setType:cbuffer];
	
	if ([object type]==TI_MAX_PLAYERS_ON_LOAN_IN_SEASON) {
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setPlayersBeenOnLoan:cbuffer];
		[data getBytes:&uibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setInfo:uibuffer];
	}
	else if ([object type]==TI_NO_OF_DISCOVERY_PLAYERS_IN_SEASON) {
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setDiscoveryPlayersSigned:cbuffer];
	}
	else if ([object type]==TI_MONTHLY_INSTALLMENT_INFO) {
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setCash:ibuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setPaymentsRemaining:cbuffer];
	}
	else if ([object type]==TI_UNKNOWN_15) {
		/*
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setTotalValuesExist:cbuffer];
		if ([object totalValuesExist]) {
			[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
			tempArray = [[NSMutableArray alloc] init];
			for (int i = 0; i < cbuffer; i++) {
				[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
				[tempArray addObject:[NSNumber numberWithInt:ibuffer]];
			}
			[object setTotalValues:tempArray];
			[tempArray release];
		}
		
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar1:cbuffer];
		[object setLastUpdateDate:[FMDateLoader readFromData:data atOffset:&offset]];
		 */
		
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 8; // Double Relationship ID in 2012
		[object setUnknownInt1:ibuffer];
		[object setUnknownDate1:[FMDateLoader readFromData:data atOffset:&offset]];
		
	}
	else if ([object type]==TI_PLAYER_FIRST_OPTION_INFO) {
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setPlayerID:ibuffer];
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setFutureCash:ibuffer];
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setBuyingClubID:ibuffer];
		[object setFirstOptionEndDate:[FMDateLoader readFromData:data atOffset:&offset]];
	}
	else if ([object type]==TI_NEXT_SALE_PERCENTAGE_INFO) {
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 8; // Double Relationship ID in 2012
		[object setPlayerID:ibuffer];
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setSellingClubID:ibuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setPercentage:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setFeesToCheck:cbuffer];
		
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
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar6:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar7:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar8:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar9:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar10:cbuffer];
	}
	else if ([object type]==TI_APPEARANCE_MONEY_INFO) {
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 8; // Double Relationship ID in 2012
		[object setPlayerID:ibuffer];
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setSellingClubID:ibuffer];
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setCash:ibuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setAppearances:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setAppearancesSoFar:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setAppearanceInfoType:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar1:cbuffer];
	}
	else if ([object type]==TI_BUY_BACK_INFO) {
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 8; // Double Relationship ID in 2012
		[object setPlayerID:ibuffer];
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setCash:ibuffer];
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setBuyingClubID:ibuffer];
	}
	else if ([object type]==TI_MAX_NON_EEC_PLAYERS_INFO) {
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setMaxNumberNonECPlayers:cbuffer];
		
		// players
		tempArray = [[NSMutableArray alloc] init];
		for (int i=0;i<cbuffer;i++) {
			[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
			[tempArray addObject:[NSNumber numberWithInt:ibuffer]];
		}
		[object setPlayers:tempArray];
		[tempArray release];
	}
	else if ([object type]==TI_STARTING_PLAYER_RECORD_INFO) {
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 8; // Double Relationship ID in 2012
		[object setMostAppsPersonID:ibuffer];
		[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
		[object setMostApps:sbuffer];
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 8; // Double Relationship ID in 2012
		[object setMostGoalsPersonID:ibuffer];
		[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
		[object setMostGoals:sbuffer];
		[object setMostAppsFirstName:[FMString readFromData:data atOffset:&offset]];
		[object setMostAppsSurname:[FMString readFromData:data atOffset:&offset]];
		[object setMostGoalsFirstName:[FMString readFromData:data atOffset:&offset]];
		[object setMostGoalsSurname:[FMString readFromData:data atOffset:&offset]];
	}
	else if ([object type]==TI_ARRANGED_FRIENDLY_INFO) {
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setPlayerID:ibuffer];
		[object setDeadline:[FMDateLoader readFromData:data atOffset:&offset]];
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setBuyingClubID:ibuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setTeamHasBeenInvited:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar1:cbuffer];
	}
	else if ([object type]==TI_NO_OF_NON_EU_PLAYERS_SIGNED_FROM_ABROAD_PER_SEASON) {
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setPlayersSigned:cbuffer];
	}
	else if ([object type]==TI_PROMOTION_CASH_INFO) {
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 8; // Double Relationship ID in 2012
		[object setPlayerID:ibuffer];
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setCash:ibuffer];
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setSellingClubID:ibuffer];
	}
	else if ([object type]==TI_MAX_PLAYERS_ON_SHORT_TERM_LOAN_IN_SEASON) {
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setPlayersBeenOnLoan:cbuffer];
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setInfo:ibuffer];
	}
	else if ([object type]==TI_MAX_PLAYERS_ON_LONG_TERM_LOAN_IN_SEASON) {
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setPlayersBeenOnLoan:cbuffer];
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setInfo:ibuffer];
	}
	else if ([object type]==TI_UNKNOWN_1_MLS) {
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setUnknownInt1:ibuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar1:cbuffer];
		if (debug) { NSLog(@"UTI1:%d - %d",ibuffer,cbuffer); }
	}
	else if ([object type]==TI_UNKNOWN_2) {
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		tempArray = [[NSMutableArray alloc] init];
		if (debug) { NSLog(@"-----UTI2 dates-----"); }
		for (int i=0;i<cbuffer;i++) {
			[tempArray addObject:[FMDateLoader readFromData:data atOffset:&offset]];
			if (debug) { NSLog(@"%@",[[tempArray objectAtIndex:i] date]); }
		}
		[object setUnknownDates:tempArray];
		[tempArray release];
	}
	else if ([object type]==TI_UNKNOWN_3) {
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setUnknownInt1:ibuffer];
		[object setUnknownDate1:[FMDateLoader readFromData:data atOffset:&offset]];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar1:cbuffer];
		if (debug) { NSLog(@"UTI3:%d - %@ - %d",ibuffer,[[object unknownDate1] date],cbuffer); }
	}
	else if ([object type]==TI_UNKNOWN_4) {
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setUnknownInt1:ibuffer];
		if (debug) { NSLog(@"UTI4:%d",ibuffer); }
	}
	else if ([object type]==TI_UNKNOWN_5) {
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setUnknownInt1:ibuffer];
		if (debug) { NSLog(@"UTI5:%d",ibuffer); }
	}
	else if ([object type]==TI_UNKNOWN_6) {
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setUnknownInt1:ibuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar1:cbuffer];
		if (debug) { NSLog(@"UTI6:%d - %d",ibuffer,cbuffer); }
	}
	else if ([object type]==TI_UNKNOWN_7) {
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar1:cbuffer];
		
		[object setUnknownData1:[data subdataWithRange:NSMakeRange(offset, ((cbuffer*16)+6))]]; 
		offset += ((cbuffer*16) + 6);
		
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar2:cbuffer];
		
		[object setUnknownData2:[data subdataWithRange:NSMakeRange(offset, (cbuffer*4))]]; 
		offset += (cbuffer*4);
		
		[object setUnknownData3:[data subdataWithRange:NSMakeRange(offset, 12)]]; 
		offset += 12;
		
		NSLog(@"UTI7");
	}
	else if ([object type]==TI_UNKNOWN_8) {
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar1:cbuffer];
		if (debug) { NSLog(@"UTI8:%d",cbuffer); }
	}
	else if ([object type]==TI_UNKNOWN_9) {
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar1:cbuffer];
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setUnknownInt1:ibuffer];
		if (debug) { NSLog(@"UTI9:%d - %d",ibuffer,cbuffer); }
	}
	else if ([object type]==TI_UNKNOWN_10) {
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setUnknownInt1:ibuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar1:cbuffer];
		if (debug) { NSLog(@"UTI10:%d - %d",ibuffer,cbuffer); }
	}
	else if ([object type]==TI_UNKNOWN_11) {
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setUnknownInt1:ibuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar1:cbuffer];
		if (debug) { NSLog(@"UTI11:%d - %d",ibuffer,cbuffer); }
	}
	else if ([object type]==TI_UNKNOWN_12) {
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar1:cbuffer];
		if (debug) { NSLog(@"UTI12:%d",cbuffer); }
	}
	else if ([object type]==TI_UNKNOWN_13) {
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
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar6:cbuffer];
		if (debug) { NSLog(@"UTI13:%d - %d - %d - %d - %d - %d",[object unknownChar1],[object unknownChar2],[object unknownChar3],[object unknownChar4],[object unknownChar5],[object unknownChar6]); }
	}
	else if ([object type]==TI_UNKNOWN_14) {
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar1:cbuffer];
		
		[object setUnknownData1:[data subdataWithRange:NSMakeRange(offset, (cbuffer*4))]]; 
		offset += (cbuffer*4);
	
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar2:cbuffer];
	}
	else if ([object type]==TI_UNKNOWN_16) {
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setUnknownInt1:ibuffer];
		if (debug) { NSLog(@"UTI16:%d",ibuffer); }
	}
	
	
	else {
		return [NSString stringWithFormat:@"Unknown Type - %d at offset %d",[object type],offset];
	}
			
	*byteOffset = offset;
	return object;
}

@end
