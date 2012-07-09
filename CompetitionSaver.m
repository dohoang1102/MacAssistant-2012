//
//  CompetitionSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/31.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ColourSaver.h"
#import "CompetitionSaver.h"
#import "GeneralInfoSaver.h"
#import "FMString.h"
#import "Unknown3Saver.h"

@implementation CompetitionSaver

+ (void)saveCompetition:(Competition *)object toData:(NSMutableData *)data
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
	[ColourSaver saveColour:[object colour] toData:data extended:NO];
	cbuffer = [object unknownChar1];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object unknownChar2];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object unknownChar3];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object unknownChar4];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object nameType];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object level];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object unknownChar5];
	[data appendBytes:&cbuffer length:1];
	if ([object nameType]==CNT_NAME_ON_SERVER_ONLY) {
		[FMString saveString:[object shortName] toData:data];
		[FMString saveString:[object name] toData:data];
	}
	ibuffer = [object continentID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object nationID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object leagueBodyClubID];
	[data appendBytes:&ibuffer length:4];
	sbuffer = [object reputation];
	[data appendBytes:&sbuffer length:2];
	cbuffer = [object unknownChar6];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object unknownChar7];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object unknownChar8];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object unknownChar9];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object unknownChar10];
	[data appendBytes:&cbuffer length:1];
	
	sbuffer = [object unknownShort1];
	[data appendBytes:&sbuffer length:2];
	
	ibuffer = [object lastHistoryID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object historyIndexID];
	[data appendBytes:&ibuffer length:4];
	cbuffer = [object flags];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object type];
	[data appendBytes:&cbuffer length:1];
	bbuffer = [object hasInfos];
	[data appendBytes:&bbuffer length:1];
	if ([object hasInfos]) {
		ibuffer = [[object rules] count];
		[data appendBytes:&ibuffer length:4];
		for (int i = 0; i<[[object rules] count]; i++) {
			[GeneralInfoSaver saveInfo:[[object rules] objectAtIndex:i] toData:data saveInfo:NO];
		}
	}
	
	ibuffer = [[object unknowns] count];
	[data appendBytes:&ibuffer length:4];
	for (int i = 0; i<[[object unknowns] count]; i++) {
		[Unknown3Saver saveUnknown:[[object unknowns] objectAtIndex:i] toData:data];
	}
	
	ibuffer = [object averageClubCashAtStart];
	[data appendBytes:&ibuffer length:4];
	sbuffer = [object averageClubReputationAtStart];
	[data appendBytes:&sbuffer length:2];
	sbuffer = [object minPitchLength];
	[data appendBytes:&sbuffer length:2];
	sbuffer = [object minPitchWidth];
	[data appendBytes:&sbuffer length:2];
	sbuffer = [object maxPitchLength];
	[data appendBytes:&sbuffer length:2];
	sbuffer = [object maxPitchWidth];
	[data appendBytes:&sbuffer length:2];
	ibuffer = [object northBoundaryCityID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object southBoundaryCityID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object eastBoundaryCityID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object westBoundaryCityID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object rowID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object UID];
	[data appendBytes:&ibuffer length:4];
}

@end
