//
//  ActualPersonSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 10/07/25.
//  Copyright 2010 littleblue. All rights reserved.
//

#import "ActualPersonSaver.h"
#import "FMString.h"
#import "FMDateSaver.h"
#import "RelationshipSaver.h"
#import "PersonNicknameSaver.h"
#import "LocationDaysSaver.h"

@implementation ActualPersonSaver

+ (void)saveActualPerson:(ActualPerson *)object toData:(NSMutableData *)data
{
	char cbuffer;
	int ibuffer;
	unsigned int uibuffer;
	BOOL bbuffer;
	
	ibuffer = [object firstNameID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object surnameID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object commonNameID];
	[data appendBytes:&ibuffer length:4];
	[FMString saveString:[object fullName] toData:data];
	[FMDateSaver saveDate:[object dateOfBirth] toData:data];
	cbuffer = [object ethnicity];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object hairColour];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object skinTone];
	[data appendBytes:&cbuffer length:1];
	ibuffer = [object nationID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object personStatsID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object cityOfBirthID];
	[data appendBytes:&ibuffer length:4];
	bbuffer = [object hasRelationships];
	[data appendBytes:&bbuffer length:1];
	
	if ([object hasRelationships]) {
		cbuffer = [[object relationships] count];
		[data appendBytes:&cbuffer length:1];
		for (int i = 0; i<[[object relationships] count]; i++) {
			[RelationshipSaver saveRelationship:[[object relationships] objectAtIndex:i] toData:data];
		}
		
		ibuffer = [[object unknowns1] count];
		[data appendBytes:&ibuffer length:4];
		for (int i = 0; i<[[object unknowns1] count]; i++) {
			[RelationshipSaver saveRelationship:[[object unknowns1] objectAtIndex:i] toData:data];
		}
		
		[data appendData:[object unknownData1]];
		
		cbuffer = [[object locationDays] count];
		[data appendBytes:&cbuffer length:1];
		for (int i = 0; i<[[object locationDays] count]; i++) {
			[LocationDaysSaver saveDays:[[object locationDays] objectAtIndex:i] toData:data];
		}
	}
	
	cbuffer = [[object nicknames] count];
	[data appendBytes:&cbuffer length:1];
	for (int i = 0; i<[[object nicknames] count]; i++) {
		[PersonNicknameSaver saveNickname:[[object nicknames] objectAtIndex:i] toData:data];
	}
	
	[FMDateSaver saveDate:[object unknownDate1] toData:data];
	uibuffer = [object flags];
	[data appendBytes:&uibuffer length:4];
}

@end
