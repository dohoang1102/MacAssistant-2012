//
//  ClubSponsor.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/26.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "FMDate.h"

// Sponsor Types
#define CST_MAIN_KIT_SPONSOR			1
#define CST_GOVERNMENT_COUNCIL_GRANT	2
#define	CST_STADIUM_SPONSOR				3
#define CST_GENERAL_SPONSOR				4
#define CST_INDIVIDUAL_TV_DEAL			5
#define CST_OTHER_INCOME				6
#define CST_CLUB_MEMBERSHIP				7
#define CST_SECONDARY_KIT_SPONSOR		8
#define CST_OTHER_KIT_SPONSOR			9
#define CST_PARACHUTE_PAYMENT			10

@interface ClubSponsor : NSObject {
	char type, unknownChar1, unknownChar2, unknownChar3;
	BOOL fixedValue, renewIncome;
	int cash;
	
	FMDate *startDate, *endDate;
	NSString *name;
}

@property(assign,readwrite) char type, unknownChar1, unknownChar2, unknownChar3;
@property(assign,readwrite) BOOL fixedValue, renewIncome;
@property(assign,readwrite) int cash;
@property(assign,readwrite) FMDate *startDate, *endDate;
@property(copy,readwrite) NSString *name;

- (NSArray *)typeStrings;

@end
