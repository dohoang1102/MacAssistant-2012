//
//  SpokenLanguageSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 10/01/15.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SpokenLanguageSaver.h"

@implementation SpokenLanguageSaver

+ (void)saveLanguage:(SpokenLanguage *)object toData:(NSMutableData *)data
{
	char cbuffer;
	int ibuffer;
	
	ibuffer = [object languageID];
	[data appendBytes:&ibuffer length:4];
	cbuffer = [object speakersPercentage];
	[data appendBytes:&cbuffer length:1];
}

@end
