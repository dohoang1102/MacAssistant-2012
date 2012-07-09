//
//  ActualPersonLoader.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/20.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ActualPersonLoader.h"
#import "LocationDaysLoader.h"
#import "PersonNicknameLoader.h"
#import "RelationshipLoader.h"
#import "FMDateLoader.h"
#import "FMString.h"

@implementation ActualPersonLoader

+ (ActualPerson *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset
{
	char cbuffer;
	int ibuffer;
	BOOL debug = NO;
	NSMutableArray *tempArray;
	
	unsigned int offset = *byteOffset;
	
	ActualPerson *object = [[ActualPerson alloc] init];
	
	if (debug) { NSLog(@"in AP at %d",offset); }
	
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setFirstNameID:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setSurnameID:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setCommonNameID:ibuffer];
	[object setFullName:[FMString readFromData:data atOffset:&offset]];
	[object setDateOfBirth:[FMDateLoader readFromData:data atOffset:&offset]];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setEthnicity:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setHairColour:cbuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setSkinTone:cbuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setNationID:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setPersonStatsID:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setCityOfBirthID:ibuffer];
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setHasRelationships:cbuffer];
	
	if ([object hasRelationships]) {
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		tempArray = [[NSMutableArray alloc] init];
		for (int i=0;i<cbuffer;i++) {
			[tempArray addObject:[RelationshipLoader readFromData:data atOffset:&offset]];
		}
		[object setRelationships:tempArray];
		[tempArray release];
		
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		tempArray = [[NSMutableArray alloc] init];
		for (int i=0;i<ibuffer;i++) {
			[tempArray addObject:[RelationshipLoader readFromData:data atOffset:&offset]];
		}
		[object setUnknowns1:tempArray];
		[tempArray release];
		
		// ??
		[object setUnknownData1:[data subdataWithRange:NSMakeRange(offset, 3)]]; 
		offset += 3;
	
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		tempArray = [[NSMutableArray alloc] init];
		for (int i=0;i<cbuffer;i++) {
			[tempArray addObject:[LocationDaysLoader readFromData:data atOffset:&offset]];
		}
		[object setLocationDays:tempArray];
		[tempArray release];
	}
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	tempArray = [[NSMutableArray alloc] init];
	for (int i=0;i<cbuffer;i++) {
		[tempArray addObject:[PersonNicknameLoader readFromData:data atOffset:&offset]];
	}
	[object setNicknames:tempArray];
	[tempArray release];
	
	// ??
	[object setUnknownDate1:[FMDateLoader readFromData:data atOffset:&offset]];
	
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setFlags:ibuffer];
	
	if (debug) { NSLog(@"end of AP at %d",offset); }
	
	*byteOffset = offset;
	
	return object;
}

@end
