//
//  GeneralInfo.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/31.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "GeneralInfo.h"


@implementation GeneralInfo

@synthesize intValue, stringValue, infos, type, name, charValue, dateValue, unknownChar1, unknownChar2, 
unknownChar3, unknownChar4, unknownChar5, unknownChar6, unknownChar7, unknownChar8, unknownData1,
unknownFixture1;

- (id)init
{
	[super init];
	
	name = @"---";
	
	return self;
}

- (NSString *)value
{
	NSMutableString *val = [[NSMutableString alloc] init];
	[val appendFormat:@"(%d) ",type];
	if (type==1) {
		[val appendFormat:@"%d",intValue];
	}
	else if (type==2) {
		[val appendFormat:@"%d-%d-%d-%d",unknownChar1,unknownChar2,unknownChar3,unknownChar4];
	}
	else if (type==3) {
		[val appendFormat:@"%d",charValue];
	}
	else if (type==4) {
		[val appendFormat:@"%d-%d-%d-%d",unknownChar1,unknownChar2,unknownChar3,unknownChar4];
	}
	else if (type==5) {
		[val appendFormat:@"%d-%d-%d-%d-%d-%d-%d-%d",unknownChar1,unknownChar2,unknownChar3,unknownChar4,unknownChar5,unknownChar6,unknownChar7,unknownChar8];
	}
	else if (type==6) {
		[val appendFormat:@"%@",stringValue];
	}
	else if (type==10) {
		[val appendFormat:@"Array (%ld objects)",[infos count]];
	}
	else if (type==11) {
		[val appendFormat:@"Array (%ld objects)",[infos count]];
	}
	else if (type==13) {
		[val appendFormat:@"%d - %@",charValue,[dateValue date]];
	}
	else if (type==14) {
		[val appendFormat:@"%@",stringValue];
	}
	NSLog(@"%@",val);
	return val;
}

@end
