//
//  Staff.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/20.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "FMDate.h"

@interface Staff : NSObject {
	BOOL hasStaffRoles;
	unsigned char nationalJob, clubJob;
	char fullCaps, fullGoals, u21Caps, u21Goals, currentLanguageProficiency, unknownChar1, unknownChar2, 
	unknownChar4, unknownChar5, unknownChar6, unknownChar7,
	managerRole, assistantManagerRole, coachRole, physioRole, scoutRole, goalkeepingCoachRole, fitnessCoachRole;
	short unknownShort1;
	int lastClubID, nationalTeamID, clubTeamID, contractOfferDecisionDateUniqueID, historyID;
	FMDate *clubTeamJoinDate, *nationalTeamJoinDate, *currentNationJoinDate, *unknownDate1;
	NSData *unknownData2, *unknownData3;
	NSMutableArray *transferOffers, *contracts, *contractOffers, *interestedClubs;
}
@property(readwrite,assign) BOOL hasStaffRoles;
@property(readwrite,assign) char fullCaps, fullGoals, u21Caps, u21Goals, currentLanguageProficiency,
unknownChar1, unknownChar2, unknownChar4, unknownChar5, unknownChar6, unknownChar7,
managerRole, assistantManagerRole, coachRole, physioRole, scoutRole, goalkeepingCoachRole, fitnessCoachRole;
@property(readwrite,assign) unsigned char  nationalJob, clubJob;
@property(readwrite,assign) short unknownShort1;
@property(readwrite,assign) int lastClubID, nationalTeamID, clubTeamID, contractOfferDecisionDateUniqueID, historyID;
@property(readwrite,assign) FMDate *clubTeamJoinDate, *nationalTeamJoinDate, *currentNationJoinDate, *unknownDate1;
@property(readwrite,copy) NSMutableArray *transferOffers, *contracts, *contractOffers, *interestedClubs;
@property(readwrite,copy) NSData *unknownData2, *unknownData3;

- (int)mainContractWage;
- (BOOL)hasYouthContract;
- (NSString *)weeklyWageString;
- (NSString *)contractEndString;

@end
