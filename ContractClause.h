//
//  ContractClause.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/20.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

// contract clause types
#define CCT_MIN_FEE_RELEASE										0
#define CCT_RELEGATION_RELEASE									1
#define CCT_NON_PROMOTION_RELEASE								2
#define CCT_YEARLY_WAGE_RISE_PERCENTAGE							3
#define CCT_PROMOTION_WAGE_INCREASE								4
#define CCT_RELEGATION_WAGE_DECREASE							5
#define CCT_MANAGER_COACH_JOB_RELEASE							6
#define CCT_SELL_ON_FEE_PERCENTAGE								8
#define CCT_SELL_ON_FEE_PROFIT_PERCENTAGE						9
#define CCT_SEASONAL_LANDMARK_GOAL_BONUS						10
#define CCT_ONE_YEAR_EXTENSION_AFTER_LEAGUE_GAMES_FINAL_SEASON	11
#define CCT_MATCH_HIGHEST_EARNER								12
#define CCT_WAGE_AFTER_REACHING_CLUB_CAREER_LEAGUE_GAMES		13
#define CCT_TOP_DIVISION_PROMOTION_WAGE_RISE					14
#define CCT_TOP_DIVISION_RELEGATION_WAGE_DROP					15
#define CCT_MIN_FEE_RELEASE_FOREIGN_CLUBS						16
#define CCT_MIN_FEE_RELEASE_HIGHER_DIVISION_CLUBS				17

#define CCT_MAX		17

/*

#define CCT_MANAGER_COACH_RELEASE			6			
#define CCT_NUMBER_OF_CLAUSES				7
// following types are used when clauses are active
#define CCT_RELEGATION_RELEASE_ACTIVATED	9		
#define CCT_NON_PROMOTION_RELEASE_ACTIVATED	10
// used for transfer offer screen when player has clause in loan contract
#define CCT_LOAN_MIN_FEE_RELEASE			12
#define CCT_FIRST_OPTION_MIN_FEE_RELEASE	13
#define CCT_BUY_BACK_RELEASE				14				// buy back for normal transfers
#define CCT_CALL_BACK_RELEASE				15				// call back for coownerships
*/

@interface ContractClause : NSObject {
	char type, info;
	int fee;
}

@property(assign,readwrite) char type, info;
@property(assign,readwrite) int fee;

- (NSArray *)typeStrings;

@end
