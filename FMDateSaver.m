//
//  FMDateSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/14.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "FMDateSaver.h"

@implementation FMDateSaver

+ (void)saveDate:(FMDate *)object toData:(NSMutableData *)data
{
	short sbuffer;
	
	sbuffer = [object day];
	[data appendBytes:&sbuffer length:2];
	sbuffer = [object year];
	[data appendBytes:&sbuffer length:2];
}

@end
