//
//  InterestedClubLoader.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/20.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "InterestedClubLoader.h"
#import "FMDateLoader.h"

@implementation InterestedClubLoader

+ (InterestedClub *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset
{
	int ibuffer;
	
	unsigned int offset = *byteOffset;
	
	InterestedClub *object = [[InterestedClub alloc] init];
	
	[object setInterestedSinceDate:[FMDateLoader readFromData:data atOffset:&offset]];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setClubID:ibuffer];
	
	*byteOffset = offset;
	
	return object;
}

@end
