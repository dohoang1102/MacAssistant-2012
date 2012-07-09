//
//  AlternativeStadiumSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/23.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "AlternativeStadiumSaver.h"
#import "FMDateSaver.h"

@implementation AlternativeStadiumSaver

+ (void)saveStadium:(AlternativeStadium *)object toData:(NSMutableData *)data
{
	char cbuffer;
	int ibuffer;
	
	ibuffer = [object stadiumID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object clubID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object competitionID];
	[data appendBytes:&ibuffer length:4];
	cbuffer = [object unknownChar1];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object unknownChar2];
	[data appendBytes:&cbuffer length:1];
	[FMDateSaver saveDate:[object unknownDate1] toData:data];
	[FMDateSaver saveDate:[object unknownDate2] toData:data];
}

@end
