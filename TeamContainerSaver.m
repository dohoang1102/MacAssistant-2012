//
//  TeamContainerSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/23.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TeamContainerSaver.h"
#import "FMString.h"
#import "ColourSaver.h"
#import "AlternativeKitSaver.h"
#import "AlternativeStadiumSaver.h"
#import "RelationshipSaver.h"
#import "Unknown1Saver.h"
#import "TransferInfoSaver.h"

@implementation TeamContainerSaver

+ (void)saveTeamContainer:(TeamContainer *)object toData:(NSMutableData *)data
{
	char cbuffer;
	short sbuffer;
	int ibuffer;
	
	cbuffer = [object teamContainerType];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object nameGender];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object shortNameGender];
	[data appendBytes:&cbuffer length:1];
	[FMString saveString:[object name] toData:data];
	[FMString saveString:[object shortName] toData:data];
	
	cbuffer = [[object colours] count];
	[data appendBytes:&cbuffer length:1];
	for (int i = 0; i<[[object colours] count]; i++) {
		[ColourSaver saveColour:[[object colours] objectAtIndex:i] toData:data extended:YES];
	}
	cbuffer = [[object teams] count];
	[data appendBytes:&cbuffer length:1];
	for (int i = 0; i<[[object teams] count]; i++) {
		ibuffer = [[[object teams] objectAtIndex:i] intValue];
		[data appendBytes:&ibuffer length:4];
	}
	cbuffer = [[object unknowns1] count];
	[data appendBytes:&cbuffer length:1];
	for (int i = 0; i<[[object unknowns1] count]; i++) {
		ibuffer = [[[object unknowns1] objectAtIndex:i] intValue];
		[data appendBytes:&ibuffer length:4];
	}
	cbuffer = [[object unknowns3] count];
	[data appendBytes:&cbuffer length:1];
	for (int i = 0; i<[[object unknowns3] count]; i++) {
		ibuffer = [[[object unknowns3] objectAtIndex:i] intValue];
		[data appendBytes:&ibuffer length:4];
	}
	cbuffer = [[object unknowns4] count];
	[data appendBytes:&cbuffer length:1];
	for (int i = 0; i<[[object unknowns4] count]; i++) {
		ibuffer = [[[object unknowns4] objectAtIndex:i] intValue];
		[data appendBytes:&ibuffer length:4];
	}
	cbuffer = [[object relationships] count];
	[data appendBytes:&cbuffer length:1];
	for (int i = 0; i<[[object relationships] count]; i++) {
		[RelationshipSaver saveRelationship:[[object relationships] objectAtIndex:i] toData:data];
	}
	sbuffer = [[object alternativeStadiums] count];
	[data appendBytes:&sbuffer length:2];
	for (int i = 0; i<[[object alternativeStadiums] count]; i++) {
		[AlternativeStadiumSaver saveStadium:[[object alternativeStadiums] objectAtIndex:i] toData:data];
	}
	cbuffer = [[object unknowns2] count];
	[data appendBytes:&cbuffer length:1];
	for (int i = 0; i<[[object unknowns2] count]; i++) {
		[Unknown1Saver saveUnknown:[[object unknowns2] objectAtIndex:i] toData:data];
	}
	
	cbuffer = [object attacking];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object depth];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object directness];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object flamboyancy];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object flexibility];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object freeRoles];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object marking];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object offside];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object pressing];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object sittingBack];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object tempo];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object useOfPlaymaker];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object width];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object preferredFormation];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object preferredFormation2];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object defensiveFormation];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object attackingFormation];
	[data appendBytes:&cbuffer length:1];
	
	sbuffer = [[object transferInfos] count];
	[data appendBytes:&sbuffer length:2];
	for (int i = 0; i<[[object transferInfos] count]; i++) {
		[TransferInfoSaver saveInfo:[[object transferInfos] objectAtIndex:i] toData:data];
	}
}

@end
