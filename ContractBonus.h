//
//  ContractBonus.h
//  FM11SX
//
//  Created by Amy Kettlewell on 10/11/15.
//  Copyright 2010 littleblue. All rights reserved.
//

#import <Cocoa/Cocoa.h>

// contract bonus type
#define CBT_APPEARANCE_FEE					0
#define CBT_GOAL_BONUS						1
#define CBT_CLEAN_SHEET_BONUS				2
#define CBT_TEAM_OF_THE_YEAR_BONUS_DIVISION	3

#define CBT_MAX	3

@interface ContractBonus : NSObject {
	char type;
	int fee;
}

@property(assign,readwrite) char type;
@property(assign,readwrite) int fee;

- (NSArray *)typeStrings;

@end
