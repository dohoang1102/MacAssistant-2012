//
//  SpokespersonSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 10/07/25.
//  Copyright 2010 littleblue. All rights reserved.
//

#import "SpokespersonSaver.h"

@implementation SpokespersonSaver

+ (void)saveSpokesperson:(Spokesperson *)object toData:(NSMutableData *)data
{
	int ibuffer;
	
	ibuffer = [object unknownInt1];
	[data appendBytes:&ibuffer length:4];
}

@end
