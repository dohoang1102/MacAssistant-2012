//
//  RelationshipSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/23.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "RelationshipSaver.h"

@implementation RelationshipSaver

+ (void)saveRelationship:(Relationship *)object toData:(NSMutableData *)data
{
	char cbuffer;
	BOOL bbuffer;
	int ibuffer;
	
	cbuffer = [object recordType];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object relationshipType];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object level];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object info];
	[data appendBytes:&cbuffer length:1];
	ibuffer = [object associatedID];
	[data appendBytes:&ibuffer length:4];
	bbuffer = [object permanent];
	[data appendBytes:&bbuffer length:1];
}

@end
