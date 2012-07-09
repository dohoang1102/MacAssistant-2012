//
//  ContractOffer.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/20.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Contract.h"
#import "FMDate.h"

// contract offer decision
#define COD_NOT_OFFERED				0
#define COD_OFFERED					1
#define COD_ACCEPTED				2
#define COD_REJECTED				3
#define COD_NEGOTIATING				4
#define COD_BLOCKED					5
#define COD_ACCEPTED_PROVISIONALLY	6

@interface ContractOffer : NSObject {
	char type, decision, workPermitState;
	int transferOfferIndex, weeklyWageFromOldClub;
	Contract *contract;
	FMDate *unknownDate1;
	NSData *unknownData1, *unknownData2;
}

@property(assign,readwrite) char type, decision, workPermitState;
@property(assign,readwrite) int transferOfferIndex, weeklyWageFromOldClub;
@property(assign,readwrite) Contract *contract;
@property(copy,readwrite) NSData *unknownData1, *unknownData2;
@property(assign,readwrite) FMDate *unknownDate1;

@end
