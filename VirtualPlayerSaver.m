//
//  VirtualPlayerSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 10/07/25.
//  Copyright 2010 littleblue. All rights reserved.
//

#import "VirtualPlayerSaver.h"

@implementation VirtualPlayerSaver

+ (void)savePlayer:(VirtualPlayer *)object toData:(NSMutableData *)data
{
	unsigned int uibuffer;
	
	uibuffer = [object unknownInt1];
	[data appendBytes:&uibuffer length:4];
	[data appendData:[object unknownData1]];
}

@end
