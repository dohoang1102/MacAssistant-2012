//
//  Relationship.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/14.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Relationship.h"


@implementation Relationship

@synthesize recordType, relationshipType, level, info, associatedID, permanent;

- (NSString *)associatedIDString
{
	if (recordType==RRT_CLUB) { return [NSString stringWithFormat:@"cl%d",associatedID]; }
	else if (recordType==RRT_NATION) { return [NSString stringWithFormat:@"na%d",associatedID]; }
	else if (recordType==RRT_PERSON) { return [NSString stringWithFormat:@"pe%d",associatedID]; }
	else if (recordType==RRT_TEAM) { return [NSString stringWithFormat:@"te%d",associatedID]; }
	else if (recordType==RRT_STADIUM) { return [NSString stringWithFormat:@"st%d",associatedID]; }
	else { return [NSString stringWithFormat:@"Unknown: %d",associatedID]; }
}

- (NSString *)recordTypeString
{
	if (recordType==RRT_RECORD_NOT_USED) { return @"None"; }
	else if (recordType==RRT_CLUB) { return @"Club"; }
	else if (recordType==RRT_NATION) { return @"Nation"; }
	else if (recordType==RRT_PERSON) { return @"Person"; }
	else if (recordType==RRT_TEAM) { return @"Team"; }
	else if (recordType==RRT_STADIUM) { return @"Stadium"; }
	else { return [NSString stringWithFormat:@"Unknown Type: %d",recordType]; }
}

- (NSString *)relationshipTypeString 
{
	if (relationshipType==RT_FAVOURITE_PERSON) { return @"Favourite Person"; }
	else if (relationshipType==RT_DISLIKED_PERSON) { return @"Disliked Person"; }
	else if (relationshipType==RT_FAVOURITE_CLUB) { return @"Favourite Club"; }
	else if (relationshipType==RT_DISLIKED_CLUB) { return @"Disliked Club"; }
	else if (relationshipType==RT_RIVAL_CLUB) { return @"Rival Club"; }
	else if (relationshipType==RT_RIVAL_NATION) { return @"Rival Nation"; }
	else if (relationshipType==RT_RELATIVE_BORN_IN_NATION) { return @"Relative Born In Nation"; }
	else if (relationshipType==RT_BORN_IN_NATION) { return @"Born In Nation"; }
	else if (relationshipType==RT_HAS_NATIONALITY) { return @"Has Nationality"; }
	else if (relationshipType==RT_INTERNATIONAL_RETIREMENT) { return @"International Retirement"; }
	else if (relationshipType==RT_TRAINED_IN_NATION) { return @"Trained In Nation"; }
	else if (relationshipType==RT_TRAINED_AT_CLUB) { return @"Trained At Club"; }
	else { return [NSString stringWithFormat:@"Unknown Type: %d",relationshipType]; }
}
@end
