//
//  DerbySaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/14.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "DerbySaver.h"
#import "FMString.h"
#import "FMDateSaver.h"

@implementation DerbySaver

+ (void)saveDerby:(Derby *)object toData:(NSMutableData *)data
{
	char cbuffer;
	short sbuffer;
	int ibuffer;
	
	cbuffer = [object databaseClass];
	[data appendBytes:&cbuffer length:1];
	[FMString saveString:[object name] toData:data];
	[FMString saveString:[object shortName] toData:data];
	[FMString saveString:[object alternativeName] toData:data];
	[FMString saveString:[object alternativeShortName] toData:data];
	[FMDateSaver saveDate:[object firstMatchDate] toData:data];
	ibuffer = [object team1ID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object team2ID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object firstMatchCompetitionID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object firstMatchStadiumID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object firstMatchAttendance];
	[data appendBytes:&ibuffer length:4];
	sbuffer = [object team1TotalGamesWon];
	[data appendBytes:&sbuffer length:2];
	sbuffer = [object team1TotalGamesDrawn];
	[data appendBytes:&sbuffer length:2];
	sbuffer = [object team1TotalGamesLost];
	[data appendBytes:&sbuffer length:2];
	cbuffer = [object firstMatchTeam1Goals];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object firstMatchTeam2Goals];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object unknownChar1];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object unknownChar2];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object unknownChar3];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object unknownChar4];
	[data appendBytes:&cbuffer length:1];
	
	cbuffer = [object worldReputation];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object nationalReputation];
	[data appendBytes:&cbuffer length:1];
	
	ibuffer = [object rowID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object UID];
	[data appendBytes:&ibuffer length:4];
}

@end
