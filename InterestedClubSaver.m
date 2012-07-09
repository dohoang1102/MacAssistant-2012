//
//  InterestedClubSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 10/07/25.
//  Copyright 2010 littleblue. All rights reserved.
//

#import "InterestedClubSaver.h"
#import "FMDateSaver.h"

@implementation InterestedClubSaver

+ (void)saveInterestedClub:(InterestedClub *)object toData:(NSMutableData *)data
{
	int ibuffer;
	
	[FMDateSaver saveDate:[object interestedSinceDate] toData:data];
	ibuffer = [object clubID];
	[data appendBytes:&ibuffer length:4];
}

@end
