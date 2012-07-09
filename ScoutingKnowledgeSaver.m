//
//  ScoutingKnowledgeSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/23.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ScoutingKnowledgeSaver.h"
#import "FMDateSaver.h"

@implementation ScoutingKnowledgeSaver

+ (void)saveKnowledge:(ScoutingKnowledge *)object toData:(NSMutableData *)data
{
	char cbuffer;
	int ibuffer;
	
	cbuffer = [object unknownChar1];
	[data appendBytes:&cbuffer length:1];
	ibuffer = [object nationID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object sourceStaffID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object sourceClubID];
	[data appendBytes:&ibuffer length:4];
	cbuffer = [object percentComplete];
	[data appendBytes:&cbuffer length:1];
	[FMDateSaver saveDate:[object date] toData:data];
	ibuffer = [object sourcePlayerID];
	[data appendBytes:&ibuffer length:4];
}

@end
