//
//  ContinentLoader.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/31.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ContinentLoader.h"
#import "GeneralInfoLoader.h"

@implementation Loader (ContinentLoader)

+ (Continent *)readContinentFromData:(NSData *)data atOffset:(unsigned int *)byteOffset
{
	char cbuffer;
	float fbuffer;
	int ibuffer;
	NSMutableArray *tempArray;
	
	unsigned int offset = *byteOffset;
	
	Continent *object = [[Continent alloc] init];
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setDatabaseClass:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setNameGender:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setFederationNameGender:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setShortFederationNameGender:cbuffer];
	[data getBytes:&fbuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setRegionalStrength:fbuffer];
	
	//	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	//	[object setContinentSelected:cbuffer];
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setUnknownChar1:cbuffer];
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setHasInfos:cbuffer];
	
	if ([object hasInfos]) {
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		tempArray = [[NSMutableArray alloc] init];
		for (int i=0;i<ibuffer;i++) {
			id info = [GeneralInfoLoader readFromData:data atOffset:&offset readInfo:NO];
			if ([[info className] isEqualToString:@"GeneralInfo"]) {
				[tempArray addObject:info];
			}
			else { return [NSString stringWithFormat:@"Info - %@",info]; }
		}
		[object setInfos:tempArray];
		[tempArray release];
	}
		
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setRowID:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setUID:ibuffer];
	
	*byteOffset = offset;
	
	return object;
}

@end
