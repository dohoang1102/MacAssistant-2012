//
//  ClubDebt.h
//  FM10SX
//
//  Created by Amy Kettlewell on 10/10/17.
//  Copyright 2010 littleblue. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "FMDate.h"

// debt source
#define CDS_BANK							1
#define CDS_CHAIRMAN						2
#define CDS_CVA								3
#define CDS_PFA								4
#define CDS_STATE							5
#define CDS_SUPPORTERS_TRUST				6
#define CDS_GIFT_REPAYABLE_WHEN_PROFITABLE	7
#define CDS_GIFT_REPAYABLE_ON_DEPARTURE		8
#define CDS_GIFT_NON_REPAYABLE				9

@interface ClubDebt : NSObject {
	char source;
	int amount, clubID;
	float interestRate;
	FMDate *startDate, *endDate;	
}

@property(assign,readwrite) char source;
@property(assign,readwrite) int amount, clubID;
@property(assign,readwrite) float interestRate;
@property(assign,readwrite) FMDate *startDate, *endDate;

@end
