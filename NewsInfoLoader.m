//
//  NewsInfoLoader.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/22.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "GeneralInfoLoader.h"
#import "NewsInfoLoader.h"
#import "FMString.h"
#import "SupportFunctions.h"

@implementation NewsInfoLoader

+ (NewsInfo *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset inType:(NSString *)type
{
	char cbuffer;
	int ibuffer;
	
	unsigned int offset = *byteOffset;
	
	NewsInfo *object = [[NewsInfo alloc] init];
	
	[object setType:[SupportFunctions readCStringFromData:data atOffset:&offset length:4]];
	NSLog(@"Info Type: %@ at %d",[object type],offset);
	
	if ([[object type] isEqualToString:@"sopp"]) {
		[object setUnknownData1:[data subdataWithRange:NSMakeRange(offset, 21)]]; 
		offset += 21;
	}
	else if ([[object type] isEqualToString:@"rfip"]) {
		[object setUnknownData1:[data subdataWithRange:NSMakeRange(offset, 2)]]; 
		offset += 2;
	}
	else if ([[object type] isEqualToString:@"rfcn"]) {
		[object setUnknownData1:[data subdataWithRange:NSMakeRange(offset, 2)]]; 
		offset += 2;
		NSLog(@"NIT: rfcn (unconfirmed new length)");
	}
	else if ([[object type] isEqualToString:@"roip"]) { 
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar1:cbuffer]; 
	}
	else if ([[object type] isEqualToString:@"nfvp"]) { 
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar1:cbuffer]; 
	}
	else if ([[object type] isEqualToString:@"rcmp"]) { 
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar1:cbuffer]; 
	}
	else if ([[object type] isEqualToString:@"rfqs"]) {
		[object setUnknownData1:[data subdataWithRange:NSMakeRange(offset, 10)]]; 
		offset += 10;
	}
	else if ([[object type] isEqualToString:@"rfst"]) {
		[object setUnknownData1:[data subdataWithRange:NSMakeRange(offset, 15)]]; 
		offset += 15;
	}
	else if ([[object type] isEqualToString:@"rfcs"]) { 
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar1:cbuffer]; 
	}
	else if ([[object type] isEqualToString:@"rfca"]) { 
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar1:cbuffer]; 
	}
	else if ([[object type] isEqualToString:@"rfsp"]) {
		[object setUnknownData1:[data subdataWithRange:NSMakeRange(offset, 11)]]; 
		offset += 11;
	}
	else if ([[object type] isEqualToString:@"rfpv"]) {
		[object setUnknownData1:[data subdataWithRange:NSMakeRange(offset, 5)]]; 
		offset += 5;
	}
	else if ([[object type] isEqualToString:@"rfle"]) {
		[object setUnknownData1:[data subdataWithRange:NSMakeRange(offset, 7)]]; 
		offset += 7;
	}
	else if ([[object type] isEqualToString:@"rfdt"]) { 
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar1:cbuffer]; 
	}
	else if ([[object type] isEqualToString:@"rfsn"]) { 
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar1:cbuffer]; 
		NSLog(@"NIT: rfsn (unconfirmed new length)");
	}
	else if ([[object type] isEqualToString:@"rftt"]) {
		[object setUnknownData1:[data subdataWithRange:NSMakeRange(offset, 11)]]; 
		offset += 11;
	}
	else if ([[object type] isEqualToString:@"rfbj"]) {
		[object setUnknownData1:[data subdataWithRange:NSMakeRange(offset, 10)]]; 
		offset += 10;
	}
	else if ([[object type] isEqualToString:@"bojp"]) {
		[object setUnknownData1:[data subdataWithRange:NSMakeRange(offset, 21)]]; 
		offset += 21;
	}
	else if ([[object type] isEqualToString:@"lrtp"]) {
		[object setUnknownData1:[data subdataWithRange:NSMakeRange(offset, 21)]]; 
		offset += 21;
	}
	else if ([[object type] isEqualToString:@"tanp"]) {
		[object setUnknownData1:[data subdataWithRange:NSMakeRange(offset, 21)]]; 
		offset += 21;
	}
	else if ([[object type] isEqualToString:@"rfcp"]) {
		[object setUnknownData1:[data subdataWithRange:NSMakeRange(offset, 21)]]; 
		offset += 21;
	}
	else if ([[object type] isEqualToString:@"sabp"]) {
		[object setUnknownData1:[data subdataWithRange:NSMakeRange(offset, 21)]]; 
		offset += 21;
	}
	else if ([[object type] isEqualToString:@"pmep"]) {
		[object setUnknownData1:[data subdataWithRange:NSMakeRange(offset, 21)]]; 
		offset += 21;
	}
	else if ([[object type] isEqualToString:@"rfct"]) { 
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar1:cbuffer]; 
	}
	else if ([[object type] isEqualToString:@"rtfp"]) {
		[object setUnknownData1:[data subdataWithRange:NSMakeRange(offset, 30)]]; 
		offset += 30;
	}
	else if ([[object type] isEqualToString:@"lavp"]) {
		[object setUnknownData1:[data subdataWithRange:NSMakeRange(offset, 30)]]; 
		offset += 30;
	}
	else if ([[object type] isEqualToString:@"gawp"]) {
		[object setUnknownData1:[data subdataWithRange:NSMakeRange(offset, 30)]]; 
		offset += 30;
		NSLog(@"NIT: gawp (unconfirmed new length)");
	}
	else if ([[object type] isEqualToString:@"tadp"]) {
		[object setUnknownData1:[data subdataWithRange:NSMakeRange(offset, 40)]];
		offset += 40;
	}
	else if ([[object type] isEqualToString:@"ksap"]) {
		[object setUnknownData1:[data subdataWithRange:NSMakeRange(offset, 30)]];
		offset += 30;
	}
	else if ([[object type] isEqualToString:@"rfnc"]) {
		[object setUnknownData1:[data subdataWithRange:NSMakeRange(offset, 2)]];
		offset += 2;
		
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setUnknownInt1:ibuffer];
		[object setUnknownData2:[data subdataWithRange:NSMakeRange(offset, (ibuffer*8))]];
		offset += (ibuffer*8);
		
		[object setUnknownData3:[data subdataWithRange:NSMakeRange(offset, 8)]];
		offset += 8;
	}
	else if ([[object type] isEqualToString:@"rftn"]) {
		if ([type isEqualToString:@"etontlif"]) {
			[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
			NSMutableArray *tempArray = [[NSMutableArray alloc] init];
			for (int i=0;i<ibuffer;i++) {
				[tempArray addObject:[GeneralInfoLoader readFromData:data atOffset:&offset readInfo:NO]];
			}
			[object setInfos:tempArray];
			[tempArray release];
			
			[object setUnknownData1:[data subdataWithRange:NSMakeRange(offset, 5)]];
			offset += 5;
		}
		else {
			[object setUnknownData1:[data subdataWithRange:NSMakeRange(offset, 2)]];
			offset += 2;
			[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
			[object setUnknownInt1:ibuffer];
			[object setUnknownData2:[data subdataWithRange:NSMakeRange(offset, (ibuffer*8))]];
			offset += (ibuffer*8);
		
			[object setUnknownData3:[data subdataWithRange:NSMakeRange(offset, 9)]];
			offset += 9;
		}
	}
	else if ([[object type] isEqualToString:@"rfvd"]) {
		[object setUnknownData1:[data subdataWithRange:NSMakeRange(offset, 2)]];
		offset += 2;
		
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		[object setUnknownInt1:ibuffer];
		[object setUnknownData2:[data subdataWithRange:NSMakeRange(offset, (ibuffer*8))]];
		offset += (ibuffer*8);
		
		[object setUnknownData3:[data subdataWithRange:NSMakeRange(offset, 8)]];
		offset += 8;
	}
	else if ([[object type] isEqualToString:@"manp"]) {
		[object setUnknownData1:[data subdataWithRange:NSMakeRange(offset, 9)]];
		offset += 9;
		
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		NSMutableArray *tempArray = [[NSMutableArray alloc] init];
		for (int i=0;i<ibuffer;i++) {
			[tempArray addObject:[GeneralInfoLoader readFromData:data atOffset:&offset readInfo:YES]];
		}
		[object setInfos:tempArray];
		[tempArray release];
	}
	else if ([[object type] isEqualToString:@"vafp"]) {
		[object setUnknownData1:[data subdataWithRange:NSMakeRange(offset, 9)]];
		offset += 9;
		
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		NSMutableArray *tempArray = [[NSMutableArray alloc] init];
		for (int i=0;i<ibuffer;i++) {
			[tempArray addObject:[GeneralInfoLoader readFromData:data atOffset:&offset readInfo:YES]];
		}
		[object setInfos:tempArray];
		[tempArray release];
	}
	else if ([[object type] isEqualToString:@"perp"]) {
		[object setUnknownData1:[data subdataWithRange:NSMakeRange(offset, 9)]];
		offset += 9;
		
		[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
		NSMutableArray *tempArray = [[NSMutableArray alloc] init];
		for (int i=0;i<ibuffer;i++) {
			[tempArray addObject:[GeneralInfoLoader readFromData:data atOffset:&offset readInfo:YES]];
		}
		[object setInfos:tempArray];
		[tempArray release];
	}
	else {
		[SupportFunctions showErrorWindow:@"Error Loading News Filter Infos" withInfo:[NSString stringWithFormat:@"Unknown News Info Type - %@",[object type]]]; 
	}
	
	/*
	 else if ([type isEqualToString:@"plng"] || [type isEqualToString:@"gnlp"]) {
	 unknownData1 = [SupportFunctions readUnknownData:fp length:18]; }
	*/
	
	*byteOffset = offset;
	
	return object;
}

@end
