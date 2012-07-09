//
//  TransferPreferenceSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 10/01/15.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TransferPreferenceSaver.h"

@implementation TransferPreferenceSaver

+ (void)savePreference:(TransferPreference *)object toData:(NSMutableData *)data
{
	char cbuffer;
	int ibuffer;
	
	ibuffer = [object nationID];
	[data appendBytes:&ibuffer length:4];
	cbuffer = [object rating];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object scoutingKnowledge];
	[data appendBytes:&cbuffer length:1];
}

@end
