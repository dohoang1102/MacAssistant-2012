//
//  Unknown6Saver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 10/01/15.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Unknown6Saver.h"

@implementation Unknown6Saver

+ (void)saveUnknown:(Unknown6 *)object toData:(NSMutableData *)data
{
	[data appendData:[object unknownData1]];
}

@end
