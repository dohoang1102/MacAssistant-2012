//
//  CompetitionLoader.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/30.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "CompetitionLoader.h"
#import "ColourLoader.h"
#import "GeneralInfoLoader.h"
#import "Unknown3Loader.h"

@implementation Loader (CompetitionLoader)

+ (id)readCompetitionFromData:(NSData *)data atOffset:(unsigned int *)byteOffset
{
	char cbuffer;
	short sbuffer;
	int ibuffer;
	BOOL debug = NO;
	NSMutableArray *tempArray;
	
	unsigned int offset = *byteOffset;
	
	Competition *object = [[Competition alloc] init];
    
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setDatabaseClass:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setNameGender:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setShortNameGender:cbuffer];
	
	id colour = [ColourLoader readColourFromData:data atOffset:&offset extended:NO];
	if ([[colour className] isEqualToString:@"Colour"]) {
		[object setColour:colour];
	}
	else { return [NSString stringWithFormat:@"Colour - %@",colour]; }
	
	// ??? (might be an int, not chars....might not be
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar1:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar2:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar3:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar4:cbuffer];
	
//	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
//	[object setNationalReputation:sbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setNameType:cbuffer];
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setLevel:cbuffer];
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar5:cbuffer];

	if ([object nameType]==CNT_NAME_ON_SERVER_ONLY) {
		[object setShortName:[FMString readFromData:data atOffset:&offset]];
		[object setName:[FMString readFromData:data atOffset:&offset]];
	}
    
    // FM 2012
    // 14 Unknown bytes
	offset += 14;
    
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setContinentID:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setNationID:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setLeagueBodyClubID:ibuffer];
    // FM 2012
    // Skip 4 bytes (2x 4bytes??)
    offset += 4;
    
    // Skip unknown 2x shorts 0x4 ??
    offset += 2;
    [data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setUnknownShort1:sbuffer];
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar6:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar7:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar8:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar9:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar10:cbuffer];
	
	// same as reputation? Maybe this one's the reputation?
    [data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setReputation:sbuffer];
	
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setLastHistoryID:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setHistoryIndexID:ibuffer];
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setFlags:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setType:cbuffer];
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setHasInfos:cbuffer];
	
	if ([object hasInfos]) {
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		tempArray = [[NSMutableArray alloc] init];
		for (int i=0;i<ibuffer;i++) {
			id info = [GeneralInfoLoader readFromData:data atOffset:&offset readInfo:NO];
			if ([[info className] isEqualToString:@"GeneralInfo"]) {
				[tempArray addObject:info];
			}
			else { return [NSString stringWithFormat:@"Info - %@",info]; }
		}
		[object setRules:tempArray];
		[tempArray release];
	}
	
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	if (ibuffer>0 && debug) { NSLog(@"mystery count > 0 at %d",offset); }
	tempArray = [[NSMutableArray alloc] init];
	for (int i=0;i<ibuffer;i++) {
		[tempArray addObject:[Unknown3Loader readFromData:data atOffset:&offset]];
	}
	[object setUnknowns:tempArray];
	[tempArray release];
	
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setAverageClubCashAtStart:ibuffer];
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setAverageClubReputationAtStart:sbuffer];
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setMinPitchLength:sbuffer];
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setMinPitchWidth:sbuffer];
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setMaxPitchLength:sbuffer];
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setMaxPitchWidth:sbuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setNorthBoundaryCityID:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setSouthBoundaryCityID:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setEastBoundaryCityID:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setWestBoundaryCityID:ibuffer];
    
    // FM 2012
    // Unknown 2x 0x1 bytes
    offset += 1;
    offset += 1;
    
    // Unknown 2 dates
    offset += 4; // Date
    offset += 4; // Date
    
    // Unknown 2 bytes
    offset += 2;
    
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setRowID:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 8; // Double ID in FM 2012
	[object setUID:ibuffer];
	
	if (debug) { NSLog(@"comp %d (%d) at %d",[object rowID], [object UID], offset); }
	
	*byteOffset = offset;
	
	return object;
}

@end
