//
//  StadiumChangeSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 10/07/25.
//  Copyright 2010 EnjoyLocally.co.uk. All rights reserved.
//

#import "StadiumChangeSaver.h"
#import "FMDateSaver.h"

@implementation StadiumChangeSaver

+ (void)saveStadiumChange:(StadiumChange *)object toData:(NSMutableData *)data
{
	char cbuffer;
	int ibuffer;
	
	cbuffer = [object databaseClass];
	[data appendBytes:&cbuffer length:1];
	ibuffer = [object teamID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object oldStadiumID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object newStadiumID];
	[data appendBytes:&ibuffer length:4];
	[FMDateSaver saveDate:[object leaveDate] toData:data];
	[FMDateSaver saveDate:[object moveInDate] toData:data];
	ibuffer = [object newCapacity];
	[data appendBytes:&ibuffer length:4];
	cbuffer = [object type];
	[data appendBytes:&cbuffer length:1];
	ibuffer = [object alternativeStadiumID];
	[data appendBytes:&ibuffer length:4];
	[data appendData:[object unknownData1]];
	ibuffer = [object rowID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object UID];
	[data appendBytes:&ibuffer length:4];
}

@end
