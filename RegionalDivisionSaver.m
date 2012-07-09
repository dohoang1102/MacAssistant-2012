//
//  RegionalDivisionSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/23.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "RegionalDivisionSaver.h"


@implementation RegionalDivisionSaver

+ (void)saveDivision:(RegionalDivision *)object toData:(NSMutableData *)data
{
	char cbuffer;
	int ibuffer;
	
	cbuffer = [object level];
	[data appendBytes:&cbuffer length:1];
	ibuffer = [object divisionID];
	[data appendBytes:&ibuffer length:4];
}

@end
