//
//  StaffTendencySaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 10/07/25.
//  Copyright 2010 littleblue. All rights reserved.
//

#import "StaffTendencySaver.h"

@implementation StaffTendencySaver

+ (void)saveStaffTendency:(StaffTendency *)object toData:(NSMutableData *)data
{
	char cbuffer;
	
	cbuffer = [object type];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object level];
	[data appendBytes:&cbuffer length:1];
}

@end
