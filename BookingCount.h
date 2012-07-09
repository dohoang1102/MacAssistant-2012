//
//  BookingCount.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/21.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

// player booking count types
#define PBC_BASE_TYPE				0
#define PBC_POINTS_TYPE				1
#define PBC_LAST_10_GAMES_TYPE		2
#define PBC_LAST_3_SEASONS_TYPE		3
#define PBC_LAST_5_GAMES_TYPE		4

// last ten games mask
#define LTGM_GAME_1					0x0001
#define LTGM_GAME_2					0x0002
#define LTGM_GAME_3					0x0004
#define LTGM_GAME_4					0x0008
#define LTGM_GAME_5					0x0010
#define LTGM_GAME_6					0x0020
#define LTGM_GAME_7					0x0040
#define LTGM_GAME_8					0x0080
#define LTGM_GAME_9					0x0100
#define LTGM_GAME_10				0x0200

@interface BookingCount : NSObject {
	char yellowCards, redCards, season1, season2, season3, last5Games, type;
	short disciplineRulesIndex, points, last10Games;
}

@property(readwrite,assign) char yellowCards, redCards, season1, season2, season3, last5Games, type;
@property(readwrite,assign) short disciplineRulesIndex, points, last10Games;


@end
