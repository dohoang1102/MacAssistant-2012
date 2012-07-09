//
//  AwardSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/14.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "AwardSaver.h"
#import "ColourSaver.h"
#import "FMDateSaver.h"
#import "DatabaseTypes.h"
#import "SupportFunctions.h"

@implementation AwardSaver

+ (void)saveAward:(Award *)object toData:(NSMutableData *)data
{
	BOOL bbuffer;
	char cbuffer;
	short sbuffer;
	int ibuffer;
	
	cbuffer = [object databaseClass];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object nameGender];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object shortNameGender];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object voting];
	[data appendBytes:&cbuffer length:1];
	[ColourSaver saveColour:[object colour] toData:data extended:NO];
	cbuffer = [object unknownChar1];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object unknownChar2];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object unknownChar3];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object unknownChar4];
	[data appendBytes:&cbuffer length:1];
	sbuffer = [object awardReputation];
	[data appendBytes:&sbuffer length:2];
	sbuffer = [object nationalReputation];
	[data appendBytes:&sbuffer length:2];
	cbuffer = [object type];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object period];
	[data appendBytes:&cbuffer length:1];
	[FMDateSaver saveDate:[object awardDate] toData:data];
	ibuffer = [object continentID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object nationID];
	[data appendBytes:&ibuffer length:4];
	cbuffer = [object runBy];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object formation];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object maximumAge];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object winnerHomeReputation];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object winnerWorldReputation];
	[data appendBytes:&cbuffer length:1];
	ibuffer = [object competitionID];
	[data appendBytes:&ibuffer length:4];
	cbuffer = [object based];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object side];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object useStatsFrom];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object unknownChar5];
	[data appendBytes:&cbuffer length:1];
	bbuffer = [object useSubsForTeamAward];
	[data appendBytes:&bbuffer length:1];
	cbuffer = [object allowPreviousWinner];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object recipientType];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object votingFormat];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object minPercentGamesPlayed];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object minimumAge];
	[data appendBytes:&cbuffer length:1];
	sbuffer = [object position];
	[data appendBytes:&sbuffer length:2];
	cbuffer = [object placings];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object unknownChar6];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object unknownChar7];
	[data appendBytes:&cbuffer length:1];
	[FMDateSaver saveDate:[object announcementDate] toData:data];
	ibuffer = [object rowID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object UID];
	[data appendBytes:&ibuffer length:4];
}

@end
