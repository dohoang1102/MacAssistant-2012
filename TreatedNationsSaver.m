//
//  TreatedNationsSaver.m
//  FM11SX
//
//  Created by Amy Kettlewell on 10/11/27.
//  Copyright 2010 littleblue. All rights reserved.
//

#import "TreatedNationsSaver.h"

@implementation TreatedNationsSaver

+ (void)saveNations:(TreatedNations *)object toData:(NSMutableData *)data
{
	int ibuffer;
	
	ibuffer = [object nationID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object continentID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object excludedNationID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object regionID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object agreementID];
	[data appendBytes:&ibuffer length:4];
	
}

@end
