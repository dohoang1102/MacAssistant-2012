//
//  PersonNicknameLoader.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/20.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PersonNicknameLoader.h"
#import "FMString.h"

@implementation PersonNicknameLoader

+ (PersonNickname *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset
{
	int ibuffer;
	
	unsigned int offset = *byteOffset;
	
	PersonNickname *object = [[PersonNickname alloc] init];
	
	[object setNickname:[FMString readFromData:data atOffset:&offset]];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setNicknamerID:ibuffer];
	
	*byteOffset = offset;
	
	return object;
}

@end
