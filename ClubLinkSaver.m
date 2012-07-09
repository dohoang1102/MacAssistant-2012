//
//  ClubLinkSaver.m
//  FM11SX
//
//  Created by Amy Kettlewell on 10/11/27.
//  Copyright 2010 littleblue. All rights reserved.
//

#import "ClubLinkSaver.h"
#import "FMDateSaver.h"

@implementation ClubLinkSaver

+ (void)saveClubLink:(ClubLink *)object toData:(NSMutableData *)data
{
	char cbuffer;
	int ibuffer;
	
	ibuffer = [object parentClubID];
	[data appendBytes:&ibuffer length:4];
	cbuffer = [object type];
	[data appendBytes:&cbuffer length:1];
	ibuffer = [object flags];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object affiliateClubID];
	[data appendBytes:&ibuffer length:4];
	[FMDateSaver saveDate:[object startDate] toData:data];
	[FMDateSaver saveDate:[object renewedDate] toData:data];
	ibuffer = [object benefits];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object annualFee];
	[data appendBytes:&ibuffer length:4];
	cbuffer = [object unknownChar1];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object unknownChar2];
	[data appendBytes:&cbuffer length:1];
	[FMDateSaver saveDate:[object canCancelFromDate] toData:data];
}

@end
