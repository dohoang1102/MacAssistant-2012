//
//  ClubDebtSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 10/10/17.
//  Copyright 2010 littleblue. All rights reserved.
//

#import "ClubDebtSaver.h"
#import "FMDateSaver.h"

@implementation ClubDebtSaver

+ (void)saveDebt:(ClubDebt *)object toData:(NSMutableData *)data
{
	char cbuffer;
	float fbuffer;
	int ibuffer;
	
	ibuffer = [object clubID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object amount];
	[data appendBytes:&ibuffer length:4];
	fbuffer = [object interestRate];
	[data appendBytes:&fbuffer length:4];
	[FMDateSaver saveDate:[object endDate] toData:data];
	cbuffer = [object source];
	[data appendBytes:&cbuffer length:1];
	[FMDateSaver saveDate:[object startDate] toData:data];
}

@end
