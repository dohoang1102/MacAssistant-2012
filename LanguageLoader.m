//
//  LanguageLoader.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/31.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "LanguageLoader.h"
#import "FMString.h"

@implementation Loader (LanguageLoader)

+ (Language *)readLanguageFromData:(NSData *)data atOffset:(unsigned int *)byteOffset
{
	char cbuffer;
	short sbuffer;
	int ibuffer;
	
	unsigned int offset = *byteOffset;
	
	Language *object = [[Language alloc] init];
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setDatabaseClass:cbuffer];
	[object setName:[FMString readFromData:data atOffset:&offset]];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setNameGender:cbuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setDatabaseFileOffset:ibuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setInfluence:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setDifficulty:cbuffer];
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setFamily:sbuffer];
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setGroup:sbuffer];
	[data getBytes:&sbuffer range:NSMakeRange(offset, 2)]; offset += 2;
	[object setSubGroup:sbuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setNationID:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setRowID:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 8; //FM 2012 Double ID
	[object setUID:ibuffer];
	
	*byteOffset = offset;
	
	return object;
}

@end
