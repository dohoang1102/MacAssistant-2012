//
//  ClubLinkLoader.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/18.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ClubLinkLoader.h"
#import "FMDateLoader.h"

@implementation Loader (ClubLinkLoader)

+ (ClubLink *)readClubLinkFromData:(NSData *)data atOffset:(unsigned int *)byteOffset
{
	char cbuffer;
	int ibuffer;
	
	unsigned int offset = *byteOffset;
	
	ClubLink *object = [[ClubLink alloc] init];
	
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setParentClubID:ibuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setType:cbuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setFlags:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setAffiliateClubID:ibuffer];
	[object setStartDate:[FMDateLoader readFromData:data atOffset:&offset]];
	
	// ???  (renewed date?)
	[object setRenewedDate:[FMDateLoader readFromData:data atOffset:&offset]];
	
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setBenefits:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setAnnualFee:ibuffer];
	
	// ???
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar1:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar2:cbuffer];
	
	[object setCanCancelFromDate:[FMDateLoader readFromData:data atOffset:&offset]];
	
    // ???
    offset += 1;
    
	*byteOffset = offset;
	
	return object;
}

@end
