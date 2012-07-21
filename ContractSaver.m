//
//  ContractSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 10/07/25.
//  Copyright 2010 littleblue. All rights reserved.
//

#import "ContractSaver.h"
#import "ContractClauseSaver.h"
#import "ContractBonusSaver.h"
#import "FMDateSaver.h"

@implementation ContractSaver

+ (void)saveContract:(Contract *)object toData:(NSMutableData *)data type:(char)type offer:(BOOL)isOffer
{
	char cbuffer;
	int ibuffer;
	
	if (!isOffer) {
		cbuffer = [object type];
		[data appendBytes:&cbuffer length:1];
	}
	
	if ([object type]==CT_FULL_CONTRACT) {
		cbuffer = [object status];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object leavingOnBosman];
		[data appendBytes:&cbuffer length:1];
		
		[data appendData:[object unknownData1]];
		cbuffer = [object job];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar1];
		[data appendBytes:&cbuffer length:1];
		
		cbuffer = [[object clauses] count];
		[data appendBytes:&cbuffer length:1];
		for (int i = 0; i<[[object clauses] count]; i++) {
			[ContractClauseSaver saveClause:[[object clauses] objectAtIndex:i] toData:data];
		}
		
		cbuffer = [[object bonuses] count];
		[data appendBytes:&cbuffer length:1];
		for (int i = 0; i<[[object bonuses] count]; i++) {
			[ContractBonusSaver saveBonus:[[object bonuses] objectAtIndex:i] toData:data];
		}
		
		cbuffer = [object unknownChar2];
		[data appendBytes:&cbuffer length:1];
	}
	else if ([object type]==CT_LOAN_CONTRACT) {
		cbuffer = [object unknownChar3];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar4];
		[data appendBytes:&cbuffer length:1];
		ibuffer = [object agreedPrice];
		[data appendBytes:&ibuffer length:4];
		[data appendData:[object unknownData1]];
	}
	
	if ([object type]!=CT_INVALID_CONTRACT) {
		ibuffer = [object personID];
		[data appendBytes:&ibuffer length:4];
		cbuffer = [object teamContainerType];
		[data appendBytes:&cbuffer length:1];
		ibuffer = [object clubID];
		[data appendBytes:&ibuffer length:4];
		ibuffer = [object weeklyWage];
		[data appendBytes:&ibuffer length:4];
		[FMDateSaver saveDate:[object endDate] toData:data];
		[FMDateSaver saveDate:[object unknownDate1] toData:data];
		cbuffer = [object currentSquadStatus];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object perceivedSquadStatus];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object transferStatus];
		[data appendBytes:&cbuffer length:1];
		
		/*
		llbuffer = [object happiness];
		[data appendBytes:&llbuffer length:8];
		*/
		
		ibuffer = [object unknownInt1];
		[data appendBytes:&ibuffer length:4];
		[data appendData:[object unknownData3]];
		cbuffer = [object unknownChar6];
		[data appendBytes:&cbuffer length:1];
		
		[FMDateSaver saveDate:[object startDate] toData:data];
		cbuffer = [object happinessLevel];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar5];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object squadNumber];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object clubChoiceFactor];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object transferOfferOptions];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object gamesMissedInARow];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object gamesPlayedInARow];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar7];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar8];
		[data appendBytes:&cbuffer length:1];
	}
}

@end
