//
//  RetiredPersonSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 10/07/25.
//  Copyright 2010 littleblue. All rights reserved.
//

#import "RetiredPersonSaver.h"
#import "FMString.h"

@implementation RetiredPersonSaver

+ (void)saveRetiredPerson:(RetiredPerson *)object toData:(NSMutableData *)data
{
	char cbuffer;
	
	[FMString saveString:[object firstName] toData:data];
	[FMString saveString:[object surname] toData:data];
	cbuffer = [object job];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object unknownChar1];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object unknownChar2];
	[data appendBytes:&cbuffer length:1];
}

@end
