//
//  MediaClubSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/31.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "MediaClubSaver.h"
#import "FMString.h"

@implementation MediaClubSaver

+ (void)saveClub:(MediaClub *)object toData:(NSMutableData *)data
{
	int ibuffer;
	
	ibuffer = [object clubID];
	[data appendBytes:&ibuffer length:4];
	[FMString saveString:[object URL] toData:data];
}

@end
