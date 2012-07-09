//
//  FifaRankingMatchSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 10/01/15.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "FifaRankingMatchSaver.h"

@implementation FifaRankingMatchSaver

+ (void)saveMatch:(FifaRankingMatch *)object toData:(NSMutableData *)data
{
	char cbuffer;
	short sbuffer;
	
	cbuffer = [object unknownChar];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object points];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object month];
	[data appendBytes:&cbuffer length:1];
	sbuffer = [object year];
	[data appendBytes:&sbuffer length:2];
}

@end
