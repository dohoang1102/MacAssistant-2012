//
//  FixtureSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/31.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "FixtureSaver.h"
#import "FMDateSaver.h"

@implementation FixtureSaver

+ (void)saveFixture:(Fixture *)object toData:(NSMutableData *)data
{
	char cbuffer;
	unsigned char ucbuffer;
	int ibuffer;

	cbuffer = [object teamType1];
	[data appendBytes:&cbuffer length:1];
	
	if ([object teamType1]==1) { // nation
		cbuffer = [object unknownChar11];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar12];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar13];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar14];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar15];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar16];
		[data appendBytes:&cbuffer length:1];
	}
	else if ([object teamType1]==50) { // club
		ibuffer = [object unknownInt5];
		[data appendBytes:&ibuffer length:4];
		ibuffer = [object unknownInt6];
		[data appendBytes:&ibuffer length:4];
	}
	
	[FMDateSaver saveDate:[object unknownDate1] toData:data];
	
	ibuffer = [object unknownInt1];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object unknownInt2];
	[data appendBytes:&ibuffer length:4];
	cbuffer = [object unknownChar1];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object unknownChar2];
	[data appendBytes:&cbuffer length:1];
	
	cbuffer = [object teamType2];
	[data appendBytes:&cbuffer length:1];
	
	if ([object teamType2]==1) { // nation
		cbuffer = [object unknownChar17];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar18];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar19];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar20];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar21];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar22];
		[data appendBytes:&cbuffer length:1];
	}
	else if ([object teamType2]==50) { // club
		ibuffer = [object unknownInt7];
		[data appendBytes:&ibuffer length:4];
		ibuffer = [object unknownInt8];
		[data appendBytes:&ibuffer length:4];
	}
	
	ibuffer = [object unknownInt3];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object unknownInt4];
	[data appendBytes:&ibuffer length:4];
	cbuffer = [object unknownChar3];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object unknownChar4];
	[data appendBytes:&cbuffer length:1];
	
	cbuffer = [object teamType3];
	[data appendBytes:&cbuffer length:1];
	
	if ([object teamType3]==1) { // nation
		cbuffer = [object unknownChar23];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar24];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar25];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar26];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar27];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar28];
		[data appendBytes:&cbuffer length:1];
	}
	else if ([object teamType3]==50) { // club
		ibuffer = [object unknownInt9];
		[data appendBytes:&ibuffer length:4];
		ibuffer = [object unknownInt10];
		[data appendBytes:&ibuffer length:4];
	}
	
	cbuffer = [object unknownChar5];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object unknownChar6];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object unknownChar7];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object unknownChar8];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object unknownChar9];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object unknownChar10];
	[data appendBytes:&cbuffer length:1];
	
	ucbuffer = [object nameFlags];
	[data appendBytes:&ucbuffer length:1];
	
	if ([object nameFlags] & FIXTURE_NAME_MAIN_STAGE_NAME) { 
		cbuffer = [object unknownChar51];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar52];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar53];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar54];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar55];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar56];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar57];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar58];
		[data appendBytes:&cbuffer length:1];
	}
	if ([object nameFlags] & FIXTURE_NAME_SUB_STAGE_NAME) { 
		cbuffer = [object unknownChar45];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar46];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar47];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar48];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar49];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar50];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar60];
		[data appendBytes:&cbuffer length:1];
	}
	if ([object nameFlags] & FIXTURE_NAME_EXTRA_STAGE_NAME) {
		cbuffer = [object unknownChar39];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar40];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar41];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar42];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar43];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar44];
		[data appendBytes:&cbuffer length:1];
	}
	if ([object nameFlags] & FIXTURE_NAME_OTHER_NAME) {
		cbuffer = [object unknownChar33];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar34];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar35];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar36];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar37];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object unknownChar38];
		[data appendBytes:&cbuffer length:1];
	}
	if ([object nameFlags] & FIXTURE_NAME_ANOTHER_NAME) {
		cbuffer = [object unknownChar59];
		[data appendBytes:&cbuffer length:1];
	}
	
	cbuffer = [object unknownChar29];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object unknownChar30];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object unknownChar31];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object unknownChar32];
	[data appendBytes:&cbuffer length:1];
	
}

@end
