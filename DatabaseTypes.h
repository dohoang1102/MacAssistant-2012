//
//  DatabaseTypes.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/24.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#define SIZE_OF_FILE_HEADER		9

// database class types
#define DBC_NON_PLAYER				1
#define DBC_PLAYER					2
#define DBC_PLAYER_AND_NON_PLAYER	3
#define DBC_OFFICIAL				4
#define DBC_RETIRED_PERSON			5
#define DBC_JOURNALIST				6
#define DBC_VIRTUAL_PLAYER			7
#define DBC_SPOKESPERSON			8
#define DBC_HUMAN					9
#define DBC_TEAM					10
#define DBC_NATIONAL_TEAM			11
#define DBC_LEAGUE_BODY_CLUB		12
#define DBC_UNKNOWN_PERSON_TYPE_1	16
#define DBC_UNKNOWN_PERSON_TYPE_2	17
#define DBC_AGENT					18

// person job definitions
#define JOB_INVALID_JOB						0
#define JOB_PLAYER							0x01
#define JOB_COACH							0x02
#define JOB_PLAYER_COACH					0x03
#define JOB_CHAIRMAN						0x04
#define JOB_DIRECTOR						0x06
#define JOB_MANAGING_DIRECTOR				0x08
#define JOB_DIRECTOR_OF_FOOTBALL			0x0A
#define JOB_PHYSIO							0x0C
#define JOB_SCOUT							0x0E
#define JOB_MANAGER							0x10
#define JOB_PLAYER_MANAGER					0x11
#define JOB_HEAD_COACH						0x12
#define JOB_ASSISTANT_MANAGER				0x14
#define JOB_MEDIA_PUNDIT					0x16
#define JOB_GENERAL_MANAGER					0x18
#define JOB_FITNESS_COACH					0x1A
#define JOB_PLAYER_FITNESS_COACH			0x1B
#define JOB_CARETAKER_COACH					0x1C
#define JOB_PLAYER_ASSISTANT_MANAGER		0x15
#define JOB_GOALKEEPING_COACH				0x22
#define JOB_PLAYER_GOALKEEPING_COACH		0x23
#define JOB_YOUTH_TEAM_COACH				0x30
#define JOB_PLAYER_YOUTH_TEAM_COACH			0x31
#define JOB_FIRST_TEAM_COACH				0x36
#define JOB_PLAYER_FIRST_TEAM_COACH			0x37

// formations
#define FO_NOT_SET						0
#define FO_5_3_2_SWEEPER				1
#define FO_5_3_2						2
#define FO_4_4_2						3
#define FO_4_3_3						4
#define FO_4_2_4						5
#define FO_3_5_2						6
#define FO_4_1_2_1_2					7
#define FO_4_5_1						8
#define FO_3_4_3						9
#define FO_3_4_1_2						10
#define FO_3_4_2_1						11
#define FO_4_3_2_1						12
#define FO_3_5_2_SWEEPER				13
#define FO_4_3_1_2						14
#define FO_5_4_1						15
#define FO_4_4_1_1						16
#define FO_4_4_2_SWEEPER				17
#define FO_4_2_3_1						18
#define FO_4_1_3_1_1					19
#define FO_4_1_3_2						20
#define FO_4_2_3_1_DENMARK				21
#define FO_4_4_2_DEFENSIVE_MIDFIELDER	22
#define FO_4_5_1_DEFENSIVE_MIDFIELDER	23
#define FO_4_2_2_2						24
#define FO_4_4_2_DIAMOND				25
#define FO_3_1_3_1_2					26
#define FO_4_1_2_3_ATTACKING			27
#define FO_4_1_2_2_1					28
#define FO_4_2_2_2_DEFENSIVE_MIDFIELDER	29
#define FO_4_2_3_1_DEFENSIVE_MIDFIELDER	30
#define FO_5_3_2_SERBIA_MONTENEGRO		31
#define FO_3_6_1						32
#define FO_UNKNOWN_1					33
#define FO_UNKNOWN_2					34
#define FO_UNKNOWN_3					35

#define FO_MAX							35