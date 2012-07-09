//
//  GeneralInfoLoader.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/31.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "GeneralInfoLoader.h"
#import "FixtureLoader.h"
#import "FMString.h"
#import "FMDateLoader.h"
#import "SupportFunctions.h"

@implementation GeneralInfoLoader

+ (id)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset readInfo:(BOOL)readInfo
{
	char cbuffer;
	int ibuffer;
	NSMutableArray *tempArray;
	
	unsigned int offset = *byteOffset;
	
	GeneralInfo *object = [[GeneralInfo alloc] init];
	
	if (readInfo) { [object setName:[SupportFunctions readCStringFromData:data atOffset:&offset length:4]]; }
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setType:cbuffer];
	
//	NSLog(@"%d - %@ at %d",[object type],[object name],offset);
	
	if ([object type]==0) { /* do nothing */ }
	else if ([object type]==1) {
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setIntValue:ibuffer];
	}
	else if ([object type]==2) {
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar1:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar2:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar3:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar4:cbuffer];
	}
	else if ([object type]==3) {
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setCharValue:cbuffer];
	}
	else if ([object type]==4) {
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar1:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar2:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar3:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar4:cbuffer];
	}
	else if ([object type]==5) {
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar1:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar2:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar3:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar4:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar5:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar6:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar7:cbuffer];
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar8:cbuffer];
	}
	else if ([object type]==6) {
		[object setStringValue:[FMString readFromData:data atOffset:&offset]];
	}
	else if ([object type]==10) {
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		tempArray = [[NSMutableArray alloc] init];
		for (int i=0;i<ibuffer;i++) {
			[tempArray addObject:[GeneralInfoLoader readFromData:data atOffset:&offset readInfo:YES]];
		}
		[object setInfos:tempArray];
		[tempArray release];
//		NSLog(@"---end array---");
	}
	else if ([object type]==11) {
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		tempArray = [[NSMutableArray alloc] init];
		for (int i=0;i<ibuffer;i++) {
			[tempArray addObject:[GeneralInfoLoader readFromData:data atOffset:&offset readInfo:NO]];
		}
		[object setInfos:tempArray];
		[tempArray release];
//		NSLog(@"---end array---");
	}
	else if ([object type]==13) {
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setCharValue:cbuffer];
		[object setDateValue:[FMDateLoader readFromData:data atOffset:&offset]];
	}
	else if ([object type]==14) {
		[object setStringValue:[FMString readFromData:data atOffset:&offset]];
	}
	else if ([object type]==16) {
		if ([[object name] isEqualToString:@"lsdm"]) {
			[object setUnknownData1:[data subdataWithRange:NSMakeRange(offset, 21)]]; 
			offset += 21;
			[object setUnknownFixture1:[FixtureLoader readFromData:data atOffset:&offset]];
		}
		else {
			return [NSString stringWithFormat:@"Unknown Info 16 Type - %@ at offset %d",[object name],offset];
		}
	}
	else {
		return [NSString stringWithFormat:@"Unknown Info Type - %d at offset %d",[object type],offset];
	}
	
//	NSLog(@"%@ (%d) - %@ - %d",[SupportFunctions reverseString:[object name]],[object type], [object stringValue], [object intValue]);
	
	*byteOffset = offset;
	
	return object;
}

+ (void)readobjectFromData:(NSData *)data atOffset:(unsigned int *)byteOffset
{
	char cbuffer;
	
	unsigned int offset = *byteOffset;
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	
	if (cbuffer==32) { offset += 8; }
	
	*byteOffset = offset;
}

@end
