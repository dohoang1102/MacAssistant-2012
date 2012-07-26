//
//  Staff.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/20.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Staff.h"
#import "Contract.h"

@implementation Staff

@synthesize lastClubID, nationalTeamID, clubTeamID, contractOfferDecisionDateUniqueID, 
historyID, fullCaps, fullGoals, u21Caps, u21Goals, nationalJob, clubJob, transferOffers,
currentLanguageProficiency, contracts, contractOffers, interestedClubs, clubTeamJoinDate,
nationalTeamJoinDate, currentNationJoinDate, unknownData2, unknownDate1,
unknownChar1, unknownChar2, unknownChar4, unknownChar5, unknownChar6,
unknownShort1, unknownData3, unknownChar7, hasStaffRoles,
managerRole, assistantManagerRole, coachRole, physioRole, scoutRole, goalkeepingCoachRole, fitnessCoachRole;

- (int)mainContractWage
{
	if ([contracts count] > 0) {
		return [[contracts objectAtIndex:0] weeklyWage];
	}
	
	return 0;
}

- (BOOL)hasYouthContract
{
	for (Contract *item in contracts) {
		if ([item isYouthContract]) { return TRUE; }
	}
	
	return FALSE;
}

- (NSString *)weeklyWageString
{
	if ([contracts count]>0) {
		int wage = [[contracts objectAtIndex:0] weeklyWage];
		NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
		[formatter setNumberStyle:NSNumberFormatterDecimalStyle];
		NSString *str = [formatter stringFromNumber:[NSNumber numberWithInt:wage]];
		[formatter release];
		
		return [NSString stringWithFormat:@"£ %@ per week",str];
	}
	return @"---";
}

- (NSString *)contractEndString
{
	if ([contracts count]>0) {
		NSCalendar *gregorian = [[NSCalendar alloc]
								 initWithCalendarIdentifier:NSGregorianCalendar];
		
		NSDateComponents *components =
		[gregorian components:(NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit) fromDate:[[[contracts objectAtIndex:0] endDate] date]];
		
		NSString *str = [[NSString alloc] initWithFormat:@"%ld.%ld.%ld",[components day],[components month],[components year]];
		[gregorian release];
		return str;
	}
	return @"---";
}

@end
