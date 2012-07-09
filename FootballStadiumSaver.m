//
//  FootballStadiumSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 10/07/25.
//  Copyright 2010 EnjoyLocally.co.uk. All rights reserved.
//

#import "FootballStadiumSaver.h"
#import "FMDateSaver.h"
#import "FMString.h"

@implementation FootballStadiumSaver

+ (void)saveStadium:(Stadium *)object toData:(NSMutableData *)data
{
	char cbuffer;
	unsigned char ucbuffer;
	short sbuffer;
	int ibuffer;
	float fbuffer;
	BOOL bbuffer;
	
	cbuffer = [object databaseClass];
	[data appendBytes:&cbuffer length:1];
	ibuffer = [object capacity];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object seatingCapacity];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object expansionCapacity];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object allSeaterCompetitionCapacity];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object ownerID];
	[data appendBytes:&ibuffer length:4];
	cbuffer = [object decay];
	[data appendBytes:&cbuffer length:1];
	ibuffer = [object usedCapacity];
	[data appendBytes:&ibuffer length:4];
	sbuffer = [object pitchLength];
	[data appendBytes:&sbuffer length:2];
	sbuffer = [object pitchWidth];
	[data appendBytes:&sbuffer length:2];
	cbuffer = [object pitchType];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object state];
	[data appendBytes:&cbuffer length:1];
	bbuffer = [object extinct];
	[data appendBytes:&bbuffer length:1];
	[FMDateSaver saveDate:[object buildDate] toData:data];
	cbuffer = [object usedByNationalTeam];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object usedByU21NationalTeam];
	[data appendBytes:&cbuffer length:1];
	sbuffer = [object minPitchLength];
	[data appendBytes:&sbuffer length:2];
	sbuffer = [object minPitchWidth];
	[data appendBytes:&sbuffer length:2];
	sbuffer = [object maxPitchLength];
	[data appendBytes:&sbuffer length:2];
	sbuffer = [object maxPitchWidth];
	[data appendBytes:&sbuffer length:2];
	cbuffer = [object pitchDeteriorationRate];
	[data appendBytes:&cbuffer length:1];
	[data appendData:[object unknownData1]];
	cbuffer = [object pitchRecoveryRate];
	[data appendBytes:&cbuffer length:1];
	[FMDateSaver saveDate:[object pitchLastRelaidDate] toData:data];
	[FMDateSaver saveDate:[object pitchRelayRequiredDate] toData:data];
	[data appendData:[object unknownData2]];
	ucbuffer = [object flags];
	[data appendBytes:&ucbuffer length:1];
	if ([object flags] & SF_STADIUM_NAME_SAVED_LOCALLY) { [FMString saveString:[object name] toData:data]; }
	cbuffer = [object nameGender];
	[data appendBytes:&cbuffer length:1];
	ibuffer = [object cityID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object nearbyStadiumID];
	[data appendBytes:&ibuffer length:4];
	sbuffer = [object pitchCondition];
	[data appendBytes:&sbuffer length:2];
	[FMDateSaver saveDate:[object unknownDate1] toData:data];
	fbuffer = [object latitude];
	[data appendBytes:&fbuffer length:4];
	fbuffer = [object longitude];
	[data appendBytes:&fbuffer length:4];
	ibuffer = [object rowID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object UID];
	[data appendBytes:&ibuffer length:4];
}

@end
