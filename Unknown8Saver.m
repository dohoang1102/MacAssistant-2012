//
//  Unknown8Saver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 10/01/15.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Unknown8Saver.h"

@implementation Unknown8Saver

+ (void)saveUnknown:(Unknown8 *)object toData:(NSMutableData *)data
{
	[data appendData:[object unknownData1]];
}

@end
