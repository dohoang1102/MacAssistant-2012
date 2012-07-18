//
//  DerbyLoader.m
//  FM10SX
//
//  Created by Amy Kettlewell on 10/11/14.
//  Copyright 2010 littleblue. All rights reserved.
//

#import "DerbyLoader.h"
#import "FMString.h"
#import "FMDateLoader.h"

@implementation Loader (DerbyLoader)

+ (Derby *)readDerbyFromData:(NSData *)data atOffset:(unsigned int *)byteOffset
{
	char cbuffer;
	short sbuffer;
	int ibuffer;
    unsigned char ucbuffer;
	BOOL debug = FALSE;
	
	unsigned int offset = *byteOffset;
	
	Derby *object = [[Derby alloc] init];
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setDatabaseClass:cbuffer];
	[object setName:[FMString readFromData:data atOffset:&offset]];
	[object setShortName:[FMString readFromData:data atOffset:&offset]];
	[object setAlternativeName:[FMString readFromData:data atOffset:&offset]];
	[object setAlternativeShortName:[FMString readFromData:data atOffset:&offset]];
	[object setFirstMatchDate:[FMDateLoader readFromData:data atOffset:&offset]];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setTeam1ID:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setTeam2ID:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setFirstMatchCompetitionID:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setFirstMatchStadiumID:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setFirstMatchAttendance:ibuffer];
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setTeam1TotalGamesWon:sbuffer];
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setTeam1TotalGamesDrawn:sbuffer];
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setTeam1TotalGamesLost:sbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setFirstMatchTeam1Goals:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setFirstMatchTeam2Goals:cbuffer];
	
	// ???
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar1:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar2:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar3:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar4:cbuffer];
	
	[data getBytes:&ucbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setWorldReputation:ucbuffer];
	[data getBytes:&ucbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setNationalReputation:ucbuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setRowID:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 8; // FM 2012 Double ID
	[object setUID:ibuffer];
	
	if (debug) { NSLog(@"%@ (%d) at %d",[object name],[object rowID], offset); }
	
	*byteOffset = offset;
	
	return object;
}

@end
