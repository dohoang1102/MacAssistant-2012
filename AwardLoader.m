//
//  AwardLoader.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/24.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "AwardLoader.h"
#import "ColourLoader.h"
#import "FMDateLoader.h"
#import "DatabaseTypes.h"
#import "SupportFunctions.h"

@implementation Loader (AwardLoader)

+ (id)readAwardFromData:(NSData *)data atOffset:(unsigned int *)byteOffset
{
	char cbuffer;
	short sbuffer;
	int ibuffer;
	BOOL debug = NO;
	
	unsigned int offset = *byteOffset;
	
	Award *object = [[Award alloc] init];
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setDatabaseClass:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setNameGender:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setShortNameGender:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setVoting:cbuffer];
	if ([object voting]>AV_MAX) { 
		return [NSString stringWithFormat:@"Invalid voting value - %d",[object voting]]; 
	}
	
	id colour = [ColourLoader readColourFromData:data atOffset:&offset extended:NO];
	if ([[colour className] isEqualToString:@"Colour"]) {
		[object setColour:colour];
	}
	else { return [NSString stringWithFormat:@"Colour - %@",colour]; }

	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar1:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar2:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar3:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar4:cbuffer];
	
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setAwardReputation:sbuffer];
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setNationalReputation:sbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setType:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setPeriod:cbuffer];
	if ([object period]>AP_MAX) { 
		return [NSString stringWithFormat:@"Invalid period value - %d",[object period]];
	}
	[object setAwardDate:[FMDateLoader readFromData:data atOffset:&offset]];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setContinentID:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setNationID:ibuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setRunBy:cbuffer];
	if ([object runBy]>ARB_MAX) { 
	//	return [NSString stringWithFormat:@"Invalid run by value - %d",[object runBy]]; 
	}
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setFormation:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setMaximumAge:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setWinnerHomeReputation:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setWinnerWorldReputation:cbuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setCompetitionID:ibuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setBased:cbuffer];
	if ([object based]>AB_MAX && [object based]!=100) { 
		return [NSString stringWithFormat:@"Invalid based value - %d",[object based]]; 
	}
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setSide:cbuffer];
	if ([object side]>AS_MAX) { 
		return [NSString stringWithFormat:@"Invalid side value - %d",[object side]]; 
	}
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUseStatsFrom:cbuffer];

	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar5:cbuffer];

	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUseSubsForTeamAward:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setAllowPreviousWinner:cbuffer];
	if ([object allowPreviousWinner]>APW_MAX) { 
		return [NSString stringWithFormat:@"Invalid allows previous winner value - %d",[object allowPreviousWinner]]; 
	}
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setRecipientType:cbuffer];
	if ([object recipientType]>ART_MAX) { 
		return [NSString stringWithFormat:@"Invalid recipient type - %d",[object recipientType]]; 
	}
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setVotingFormat:cbuffer];
	if ([object votingFormat]>AVF_MAX) { 
		return [NSString stringWithFormat:@"Invalid voting format - %d",[object votingFormat]]; 
	}
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setMinPercentGamesPlayed:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setMinimumAge:cbuffer];
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setPosition:sbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setPlacings:cbuffer];
	if ([object placings]>ANP_MAX) { 
	//	return [NSString stringWithFormat:@"Invalid placings value - %d",[object placings]]; 
	}
	
	// ???
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar6:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar7:cbuffer];
	
	[object setAnnouncementDate:[FMDateLoader readFromData:data atOffset:&offset]];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setRowID:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setUID:ibuffer];
	*byteOffset = offset;
	
	if (debug) { NSLog(@"Award %d at %d",[object rowID],offset); }
	
	return object;
}

@end