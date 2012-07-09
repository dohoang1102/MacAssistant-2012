//
//  JournalistSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 10/07/25.
//  Copyright 2010 littleblue. All rights reserved.
//

#import "JournalistSaver.h"

@implementation JournalistSaver

+ (void)saveJournalist:(Journalist *)object toData:(NSMutableData *)data
{
	char cbuffer;
	int ibuffer;
	
	ibuffer = [object favouriteClubID];
	[data appendBytes:&ibuffer length:4];
	[data appendData:[object unknownData1]];
	ibuffer = [object media];
	[data appendBytes:&ibuffer length:4];
	cbuffer = [object unknownChar1];
	[data appendBytes:&cbuffer length:1];
}

@end
