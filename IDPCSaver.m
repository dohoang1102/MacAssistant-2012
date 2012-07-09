//
//  IDPCSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/18.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "IDPCSaver.h"
#import "FMDateSaver.h"

@implementation IDPCSaver

+ (void)saveIDPC:(IDPC *)object toData:(NSMutableData *)data
{
	char cbuffer;
	
	[FMDateSaver saveDate:[object date] toData:data];
	cbuffer = [object playerCount];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object unknownChar1];
	[data appendBytes:&cbuffer length:1];
}

@end
