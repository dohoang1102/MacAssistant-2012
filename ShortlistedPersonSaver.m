//
//  ShortlistedPersonSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/23.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ShortlistedPersonSaver.h"
#import "FMDateSaver.h"

@implementation ShortlistedPersonSaver

+ (void)savePerson:(ShortlistedPerson *)object toData:(NSMutableData *)data
{
	int ibuffer;
	
	[FMDateSaver saveDate:[object fromDate] toData:data];
	ibuffer = [object personID];
	[data appendBytes:&ibuffer length:4];
}

@end
