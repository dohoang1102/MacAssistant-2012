//
//  ClubLink.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/18.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "FMDate.h"

// affiliation types
#define CAT_NORMAL_AFFILIATED_CLUB	1
#define CAT_SUB_TEAM				2
#define CAT_FEEDER_TEAM				3
#define CAT_B_CLUB					4
#define CAT_C_CLUB					5
#define CAT_2_CLUB					6
#define CAT_3_CLUB					7
#define CAT_II_CLUB					8
#define CAT_GOOD_RELATIONS			16

// flags
// feeder club flags
#define CAF_PLAYERS_MOVE_FREELY							0x00000001
#define CAF_PLAYERS_GO_ON_LOAN							0x00000002
#define CAF_FIRST_OPTION_TO_BUY							0x00000004
#define CAF_PLAY_FRIENDLIES								0x00000008
#define CAF_RENEWABLE									0x00000010

#define CAF_SAME_BOARD									0x00000040
#define CAF_FINANCIAL_HELP								0x00000080
#define CAF_PARENT_PAYS_ANNUAL_FEE						0x00000100
#define CAF_PARENT_WILL_HELP_FACILITIES_UPGRADE			0x00000200

#define CAF_PARENT_PRESENCE_WILL_BE_BENEFIIT_TO_SALES	0x00000800

// benefits
#define CAB_MB_LOCAL_PLAYER_LOAN_PARTNERSHIP			0x00000020
#define CAB_MB_NATIONAL_PLAYER_LOAN_PARTNERSHIP			0x00000040
#define CAB_MB_TO_AVOID_WORK_PERMIT_REGULATIONS			0x00000080
#define CAB_MB_FIRST_OPTION_ON_FEEDERS_PLAYERS			0x00000100
#define CAB_MB_FINANCIAL_BENEFITS_FOR_BOTH_TEAMS		0x00000200
#define CAB_MB_INTERNATIONAL_PLAYER_LOAN_PARTNERSHIP	0x00000400

@interface ClubLink : NSObject {
	char type, unknownChar1, unknownChar2;
	int parentClubID, affiliateClubID, annualFee;
	unsigned int flags, benefits;
	FMDate *canCancelFromDate, *startDate, *renewedDate;
}

@property(assign,readwrite) char type, unknownChar1, unknownChar2;
@property(assign,readwrite) int parentClubID, affiliateClubID, annualFee;
@property(assign,readwrite) unsigned int flags, benefits;
@property(assign,readwrite) FMDate *canCancelFromDate, *startDate, *renewedDate;

@end
