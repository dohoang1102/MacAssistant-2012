//
//  StadiumLoader.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/03.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "FootballStadiumLoader.h"
#import "FMDateLoader.h"

@implementation Loader (FootballStadiumLoader)

+ (Stadium *)readStadiumFromData:(NSData *)data atOffset:(unsigned int *)byteOffset
{
	char cbuffer;
	short sbuffer;
	int ibuffer;
	float fbuffer;
	
	unsigned int offset = *byteOffset;
	
	Stadium *object = [[Stadium alloc] init];
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setDatabaseClass:cbuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setCapacity:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setSeatingCapacity:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setExpansionCapacity:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setAllSeaterCompetitionCapacity:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setOwnerID:ibuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setDecay:cbuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setUsedCapacity:ibuffer];
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setPitchLength:sbuffer];
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setPitchWidth:sbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setPitchType:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setState:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setExtinct:cbuffer];
	[object setBuildDate:[FMDateLoader readFromData:data atOffset:&offset]];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUsedByNationalTeam:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUsedByU21NationalTeam:cbuffer];
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setMinPitchLength:sbuffer];
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setMinPitchWidth:sbuffer];
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setMaxPitchLength:sbuffer];
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setMaxPitchWidth:sbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setPitchDeteriorationRate:cbuffer];

	// ???
	[object setUnknownData1:[data subdataWithRange:NSMakeRange(offset, 40)]]; 
	offset += 40;
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setPitchRecoveryRate:cbuffer];	
	[object setPitchLastRelaidDate:[FMDateLoader readFromData:data atOffset:&offset]];
	[object setPitchRelayRequiredDate:[FMDateLoader readFromData:data atOffset:&offset]];
	
	// ???
	[object setUnknownData2:[data subdataWithRange:NSMakeRange(offset, 7)]]; 
	offset += 7;
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setFlags:cbuffer];
	
	if ([object flags] & SF_STADIUM_NAME_SAVED_LOCALLY) { [object setName:[FMString readFromData:data atOffset:&offset]]; }
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setNameGender:cbuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setCityID:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setNearbyStadiumID:ibuffer];
	
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setPitchCondition:sbuffer];
	
	// ???
	[object setUnknownDate1:[FMDateLoader readFromData:data atOffset:&offset]];
	
	[data getBytes:&fbuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setLatitude:fbuffer];	
	[data getBytes:&fbuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setLongitude:fbuffer];
	
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setRowID:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 8; // FM 2012 Double ID
	[object setUID:ibuffer];
	
	*byteOffset = offset;
	
	return object;
}

@end
