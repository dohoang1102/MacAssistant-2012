//
//  MediaClubLoader.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/31.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "MediaClubLoader.h"
#import "FMString.h"

@implementation MediaClubLoader

+ (MediaClub *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset
{
	int ibuffer;
	
	unsigned int offset = *byteOffset;
	
	MediaClub *object = [[MediaClub alloc] init];
	
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 8; // FM 2012 Double ID
	[object setClubID:ibuffer];
	[object setURL:[FMString readFromData:data atOffset:&offset]];
	
	*byteOffset = offset;
	
	return object;
}

@end
