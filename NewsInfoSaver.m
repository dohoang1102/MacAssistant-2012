//
//  NewsInfoSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 10/07/26.
//  Copyright 2010 littleblue. All rights reserved.
//

#import "NewsInfoSaver.h"
#import "SupportFunctions.h"
#import "GeneralInfoSaver.h"
#import "FMString.h"

@implementation NewsInfoSaver

+ (void)saveInfo:(NewsInfo *)object toData:(NSMutableData *)data inType:(NSString *)type
{
	char cbuffer;
	int ibuffer;
	
	[SupportFunctions saveCString:[object type] toData:data];
	
	if ([[object type] isEqualToString:@"sopp"]) {
		[data appendData:[object unknownData1]];
	}
	else if ([[object type] isEqualToString:@"rfip"]) {
		[data appendData:[object unknownData1]];
	}
	else if ([[object type] isEqualToString:@"roip"]) { 
		cbuffer = [object unknownChar1];
		[data appendBytes:&cbuffer length:1];
	}
	else if ([[object type] isEqualToString:@"nfvp"]) { 
		cbuffer = [object unknownChar1];
		[data appendBytes:&cbuffer length:1];
	}
	else if ([[object type] isEqualToString:@"rcmp"]) { 
		cbuffer = [object unknownChar1];
		[data appendBytes:&cbuffer length:1];
	}
	else if ([[object type] isEqualToString:@"rfqs"]) {
		[data appendData:[object unknownData1]];
	}
	else if ([[object type] isEqualToString:@"rfst"]) {
		[data appendData:[object unknownData1]];
	}
	else if ([[object type] isEqualToString:@"rfcs"]) { 
		cbuffer = [object unknownChar1];
		[data appendBytes:&cbuffer length:1];
	}
	else if ([[object type] isEqualToString:@"rfca"]) { 
		cbuffer = [object unknownChar1];
		[data appendBytes:&cbuffer length:1];
	}
	else if ([[object type] isEqualToString:@"rfsp"]) {
		[data appendData:[object unknownData1]];
	}
	else if ([[object type] isEqualToString:@"rfpv"]) {
		[data appendData:[object unknownData1]];
	}
	else if ([[object type] isEqualToString:@"rfle"]) {
		[data appendData:[object unknownData1]];
	}
	else if ([[object type] isEqualToString:@"rfdt"]) { 
		cbuffer = [object unknownChar1];
		[data appendBytes:&cbuffer length:1];
	}
	else if ([[object type] isEqualToString:@"rftt"]) {
		[data appendData:[object unknownData1]];
	}
	else if ([[object type] isEqualToString:@"rfbj"]) {
		[data appendData:[object unknownData1]];
	}
	else if ([[object type] isEqualToString:@"bojp"]) {
		[data appendData:[object unknownData1]];
	}
	else if ([[object type] isEqualToString:@"lrtp"]) {
		[data appendData:[object unknownData1]];
	}
	else if ([[object type] isEqualToString:@"tanp"]) {
		[data appendData:[object unknownData1]];
	}
	else if ([[object type] isEqualToString:@"rfcp"]) {
		[data appendData:[object unknownData1]];
	}
	else if ([[object type] isEqualToString:@"rfcn"]) {
		[data appendData:[object unknownData1]];
	}
	else if ([[object type] isEqualToString:@"sabp"]) {
		[data appendData:[object unknownData1]];
	}
	else if ([[object type] isEqualToString:@"rfct"]) { 
		cbuffer = [object unknownChar1];
		[data appendBytes:&cbuffer length:1];
	}
	else if ([[object type] isEqualToString:@"rfsn"]) { 
		cbuffer = [object unknownChar1];
		[data appendBytes:&cbuffer length:1];
	}
	else if ([[object type] isEqualToString:@"rtfp"]) {
		[data appendData:[object unknownData1]];
	}
	else if ([[object type] isEqualToString:@"lavp"]) {
		[data appendData:[object unknownData1]];
	}
	else if ([[object type] isEqualToString:@"tadp"]) {
		[data appendData:[object unknownData1]];
	}
	else if ([[object type] isEqualToString:@"pmep"]) {
		[data appendData:[object unknownData1]];
	}
	else if ([[object type] isEqualToString:@"gawp"]) {
		[data appendData:[object unknownData1]];
	}
	else if ([[object type] isEqualToString:@"ksap"]) {
		[data appendData:[object unknownData1]];
	}
	else if ([[object type] isEqualToString:@"rfnc"]) {
		[data appendData:[object unknownData1]];
		
		ibuffer = [object unknownInt1];
		[data appendBytes:&ibuffer length:4];
		
		[data appendData:[object unknownData2]];
		[data appendData:[object unknownData3]];
	}
	else if ([[object type] isEqualToString:@"rftn"]) {
		if ([type isEqualToString:@"etontlif"]) {
			
			ibuffer = [[object infos] count];
			[data appendBytes:&ibuffer length:4];
			for (int i = 0; i<[[object infos] count]; i++) {
				[GeneralInfoSaver saveInfo:[[object infos] objectAtIndex:i] toData:data saveInfo:NO];
			}
			
			[data appendData:[object unknownData1]];
		}
		else {
			[data appendData:[object unknownData1]];
			
			ibuffer = [object unknownInt1];
			[data appendBytes:&ibuffer length:4];
			
			[data appendData:[object unknownData2]];
			[data appendData:[object unknownData3]];
		}
	}
	else if ([[object type] isEqualToString:@"rfvd"]) {
		[data appendData:[object unknownData1]];
		
		ibuffer = [object unknownInt1];
		[data appendBytes:&ibuffer length:4];
		
		[data appendData:[object unknownData2]];
		[data appendData:[object unknownData3]];
	}
	else if ([[object type] isEqualToString:@"manp"]) {
		[data appendData:[object unknownData1]];
	
		ibuffer = [[object infos] count];
		[data appendBytes:&ibuffer length:4];
		for (int i = 0; i<[[object infos] count]; i++) {
			[GeneralInfoSaver saveInfo:[[object infos] objectAtIndex:i] toData:data saveInfo:YES];
		}
	}
	else if ([[object type] isEqualToString:@"vafp"]) {
		[data appendData:[object unknownData1]];
		
		ibuffer = [[object infos] count];
		[data appendBytes:&ibuffer length:4];
		for (int i = 0; i<[[object infos] count]; i++) {
			[GeneralInfoSaver saveInfo:[[object infos] objectAtIndex:i] toData:data saveInfo:YES];
		}
	}
	else if ([[object type] isEqualToString:@"perp"]) {
		[data appendData:[object unknownData1]];
		
		ibuffer = [[object infos] count];
		[data appendBytes:&ibuffer length:4];
		for (int i = 0; i<[[object infos] count]; i++) {
			[GeneralInfoSaver saveInfo:[[object infos] objectAtIndex:i] toData:data saveInfo:YES];
		}
	}
}

@end
