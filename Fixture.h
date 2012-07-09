//
//  Fixture.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/24.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "FMDate.h"

// define fixture name flags
#define FIXTURE_NAME_MAIN_STAGE_NAME	0x01
#define FIXTURE_NAME_SUB_STAGE_NAME		0x02
#define FIXTURE_NAME_EXTRA_STAGE_NAME	0x04
#define FIXTURE_NAME_OTHER_NAME			0x08
#define FIXTURE_NAME_ANOTHER_NAME		0x10

@interface Fixture : NSObject {
	char unknownChar1, unknownChar2, unknownChar3, unknownChar4, unknownChar5, unknownChar6, unknownChar7, 
	unknownChar8, unknownChar9, unknownChar10, unknownChar11, unknownChar12, unknownChar13, unknownChar14, 
	unknownChar15, unknownChar16, unknownChar17, unknownChar18, unknownChar19, unknownChar20, unknownChar21, 
	unknownChar22, unknownChar23, unknownChar24, unknownChar25, unknownChar26, unknownChar27, unknownChar28, 
	unknownChar29, unknownChar30, unknownChar31, unknownChar32, unknownChar33, unknownChar34, unknownChar35, 
	unknownChar36, unknownChar37, unknownChar38, unknownChar39, unknownChar40, unknownChar41, unknownChar42, 
	unknownChar43, unknownChar44, unknownChar45, unknownChar46, unknownChar47, unknownChar48, unknownChar49, 
	unknownChar50, unknownChar51, unknownChar52, unknownChar53, unknownChar54, unknownChar55, unknownChar56, 
	unknownChar57, unknownChar58, unknownChar59, unknownChar60, teamType1, teamType2, teamType3;
	unsigned char nameFlags;
	int unknownInt1, unknownInt2, unknownInt3, unknownInt4, unknownInt5, unknownInt6, unknownInt7, unknownInt8, 
	unknownInt9, unknownInt10;
	FMDate *unknownDate1;
}

@property(assign,readwrite) char unknownChar1, unknownChar2, unknownChar3, unknownChar4, unknownChar5, unknownChar6, unknownChar7, 
unknownChar8, unknownChar9, unknownChar10, unknownChar11, unknownChar12, unknownChar13, unknownChar14, 
unknownChar15, unknownChar16, unknownChar17, unknownChar18, unknownChar19, unknownChar20, unknownChar21, 
unknownChar22, unknownChar23, unknownChar24, unknownChar25, unknownChar26, unknownChar27, unknownChar28, 
unknownChar29, unknownChar30, unknownChar31, unknownChar32, unknownChar33, unknownChar34, unknownChar35, 
unknownChar36, unknownChar37, unknownChar38, unknownChar39, unknownChar40, unknownChar41, unknownChar42, 
unknownChar43, unknownChar44, unknownChar45, unknownChar46, unknownChar47, unknownChar48, unknownChar49, 
unknownChar50, unknownChar51, unknownChar52, unknownChar53, unknownChar54, unknownChar55, unknownChar56, 
unknownChar57, unknownChar58, unknownChar59, unknownChar60, teamType1, teamType2, teamType3;
@property(assign,readwrite) unsigned char nameFlags;
@property(assign,readwrite) int unknownInt1, unknownInt2, unknownInt3, unknownInt4, unknownInt5, unknownInt6, unknownInt7, unknownInt8, 
unknownInt9, unknownInt10;
@property(assign,readwrite) FMDate *unknownDate1;

@end
