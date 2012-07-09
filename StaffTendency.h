//
//  StaffTendency.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/26.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

// tendency type
#define NPTT_SIGNS_DOMESTIC_BASED_PLAYERS						1
#define NPTT_SPENDS_ALOT_ON_YOUTH_SIGNINGS						2
#define NPTT_SIGNS_ALOT_OF_YOUTH_PLAYERS						3
#define NPTT_SIGNS_YOUNG_PLAYERS_FOR_FIRST_TEAM					4
#define NPTT_USES_BUDGET_ON_ONE_PLAYER							5
#define NPTT_HAS_A_LARGE_SENIOR_SQUAD							6
#define NPTT_WILL_USE_YOUNG_PLAYERS_IN_LOW_PRIORITY_CUP_MATCHES	15
#define NPTT_WILL_NOT_HAVE_SUBSTITUTE_GOALKEEPER				16
#define NPTT_WILL_MAKE_EARLY_TACTICAL_CHANGES					17
#define NPTT_WILL_USE_ZONAL_MARKING_FOR_SET_PIECES				18
#define NPTT_WILL_FIT_PLAYERS_INTO_PREFERRED_TACTIC				19
#define NPTT_WILL_USE_TARGET_MAN								20
#define NPTT_WILL_USE_COUNTER_ATTACKING							21

@interface StaffTendency : NSObject {
	char type, level;
}

@property(assign,readwrite) char type, level;

@end
