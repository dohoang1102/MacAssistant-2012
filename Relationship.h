//
//  Relationship.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/14.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

// relationship types
#define RT_FAVOURITE_PERSON				1	// record is favourite person
#define RT_DISLIKED_PERSON				2	// record is disliked person
#define RT_FAVOURITE_CLUB				3	// record is favourite club
#define RT_DISLIKED_CLUB				4	// record is disliked club
#define RT_RIVAL_CLUB					5	// record is a rival club
#define RT_RIVAL_NATION					6	// record is a rival nation
#define RT_RELATIVE_BORN_IN_NATION		7	// record is a nation which a relative was born in
#define RT_BORN_IN_NATION				8	// record is a nation which the person was born in
#define RT_HAS_NATIONALITY				9	// record is a nation which the person has nationality of
#define RT_INTERNATIONAL_RETIREMENT		10  // record not used person has retired from all nations

#define RT_TRAINED_IN_NATION			70	// record is the nation in which the person was trained
#define RT_TRAINED_AT_CLUB				72	// record is the first team of the club at which the person was trained

/*
#define RT_PLAYER_IN_TEMPORARY_TEAM		11	// record is a team which the person has been picked for temporarily - for levels see below
#define RT_MANAGER_IN_TEMPORARY_TEAM	12	// record is a team which the person is managing temporarily - for levels see below
#define RT_SUPER_DRAFT_ALLOCATION		13	// record is a team which has a superdraft allocation
#define RT_FAMOUS_OLD_STAR				14
#define RT_PUNDIT_FOR_NATION			15
#define RT_DISLIKED_TEAMMATE			16
#define RT_DISLIKED_ASSISTANT_MANAGER	17
#define RT_DISLIKED_MANAGER				18
#define RT_SOLD_STAR_PLAYER				19
#define RT_SOLD_YOUNGSTER				20
#define RT_WAIVER_DRAFT_ALLOCATION		21	// record is a team which has a waiver draft allocation
#define RT_RIVAL_PERSON					22
#define RT_RESERVE_STADIUM				23	// record is a stadium to use as a reserve stadium


// squad selection types
#define RT_SELECTED_IN_SQUAD_NEW				26	// record is a club which the person has just been selected for
#define RT_UNSELECTED_FROM_SQUAD_NEW			27	// record is a club which the person has just been unselected for
#define RT_INELGIBLE_SELECTED_FOR_OTHER_TEAM	28	// record is a club which the person cannot be selected for this club as he has played for another team
#define RT_CLUB_HAS_SQUAD_SELECTION				29	// no record - this club has a squad selection currently active
// media relationships
#define RT_MEDIA_PLAYER_FORM						30
#define RT_MEDIA_BIG_NAME_PURCHASE					31
#define RT_MEDIA_PLAYER_UNHAPPY_AT_SALE_OF_PLAYER	32
#define RT_MEDIA_LONG_SERVING_PLAYER_LEAVES			33
#define RT_MEDIA_TRANSFER_RUMOUR					34
#define RT_MEDIA_PLAYER_REQUESTS_LEAVE				35
#define RT_MEDIA_WAIT								36
#define RT_MEDIA_PLAYER_CONTRACT					37
#define RT_MEDIA_POLL								38
#define RT_MEDIA_PLAYER_MORALE						39
#define RT_MEDIA_REMOVE_PLAYER_MORALE				40
#define RT_MEDIA_TRANSFER_SPECULATION				41
#define RT_MEDIA_RPS								42
#define RT_MEDIA_AGENT_APPROACH						43
#define RT_MEDIA_PLAYER_CONFLICT					44
// job relationships
#define RT_JOB_APPLICATION			50

#define RT_SELL_PLAYER_END_OF_SEASON						60
#define RT_PLAYER_GETTING_IMPROVED_CONTRACT_IF_PLAY_WELL	61
#define RT_PLAYER_IMPROVED_CONTRACT_END_OF_SEASON			62
#define RT_PLAYER_WILL_GET_OPPORTUNITIES_END_OF_SEASON		63
#define RT_NOT_SELLING_PLAYER								64
#define RT_PLAYER_NOT_GETTING_IMPROVED_CONTRACT				65
#define RT_PLAYER_WILL_BE_SELECTED_WHEN_CHOSEN				66

//international friendly instructions
#define RT_IFI_45				80
#define RT_IFI_WITHDRAWN		81
#define RT_IFI_UNHAPPY_AT_BEING_WITHDRAWN	82

//players who have moaned recently in the press
#define RT_PRAT_PLAYER			85
#define RT_RECENT_MEDIA			86
#define RT_TRANSFER_RUMOUR		87

//serious career threatening injury to a player
#define RT_SERIOUS_INJURY		88

//team form news relationships
#define RT_TFN_UNBEATEN_RUN			90
#define RT_TFN_STRAIGHT_WINS		91
#define RT_TFN_GAMES_WITHOUT_WIN	92
#define RT_TFN_STRAIGHT_DEFEATS		93

//injury crisis at club
#define RT_INJURY_CRISIS		95

//player praise criticise
#define RT_PLAYER_PRAISE		96
*/

// record types
#define RRT_RECORD_NOT_USED			0
#define RRT_CLUB					1
#define RRT_NATION					2
#define RRT_PERSON					3
#define RRT_TEAM					4
#define RRT_STADIUM					5

@interface Relationship : NSObject {
	BOOL permanent;
	char recordType, relationshipType, level, info;
	int associatedID;
}

@property(readwrite,assign) BOOL permanent;
@property(readwrite,assign) char recordType, relationshipType, level, info;
@property(readwrite,assign) int associatedID;

- (NSString *)associatedIDString;
- (NSString *)recordTypeString;
- (NSString *)relationshipTypeString;

@end
