//
//  GeneralInfoSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/31.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "FMString.h"
#import "FMDateSaver.h"
#import "FixtureSaver.h"
#import "GeneralInfoSaver.h"
#import "SupportFunctions.h"

@implementation GeneralInfoSaver

+ (void)saveInfo:(GeneralInfo *)object toData:(NSMutableData *)data saveInfo:(BOOL)saveInfo
{
	char cbuffer;
	int ibuffer;
	
	if (saveInfo) { [SupportFunctions saveCString:[object name] toData:data]; }
	
	cbuffer = [object type];
	[data appendBytes:&cbuffer length:1];
	
	if ([object type]==0) { /* do nothing */ }
	else if ([object type]==1) {
		ibuffer = [object intValue];
		[data appendBytes:&ibuffer length:4];
	}
	else if ([object type]==2) {
		cbuffer = [object unknownChar1];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar2];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar3];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar4];
		[data appendBytes:&cbuffer length:1];
	}
	else if ([object type]==3) {
		cbuffer = [object charValue];
		[data appendBytes:&cbuffer length:1];
	}
	else if ([object type]==4) {
		cbuffer = [object unknownChar1];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar2];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar3];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar4];
		[data appendBytes:&cbuffer length:1];
	}
	else if ([object type]==5) {
		cbuffer = [object unknownChar1];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar2];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar3];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar4];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar5];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar6];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar7];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar8];
		[data appendBytes:&cbuffer length:1];
	}
	else if ([object type]==6) {
		[FMString saveString:[object stringValue] toData:data];
	}
	else if ([object type]==10) {
		ibuffer = [[object infos] count];
		[data appendBytes:&ibuffer length:4];
		for (int i = 0; i<[[object infos] count]; i++) {
			[GeneralInfoSaver saveInfo:[[object infos] objectAtIndex:i] toData:data saveInfo:YES];
		}
	}
	else if ([object type]==11) {
		ibuffer = [[object infos] count];
		[data appendBytes:&ibuffer length:4];
		for (int i = 0; i<[[object infos] count]; i++) {
			[GeneralInfoSaver saveInfo:[[object infos] objectAtIndex:i] toData:data saveInfo:NO];
		}
	}
	else if ([object type]==13) {
		cbuffer = [object charValue];
		[data appendBytes:&cbuffer length:1];
		[FMDateSaver saveDate:[object dateValue] toData:data];
	}
	else if ([object type]==14) {
		[FMString saveString:[object stringValue] toData:data];
	}
	else if ([object type]==16) {
		if ([[object name] isEqualToString:@"lsdm"]) {
			[data appendData:[object unknownData1]];
			[FixtureSaver saveFixture:[object unknownFixture1] toData:data];
		}
	}
}

@end
