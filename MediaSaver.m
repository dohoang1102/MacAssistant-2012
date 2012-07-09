//
//  MediaSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/31.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "MediaSaver.h"
#import "FMDateSaver.h"
#import "FMString.h"
#import "MediaClubSaver.h"

@implementation MediaSaver

+ (void)saveMedia:(Media *)object toData:(NSMutableData *)data
{
	char cbuffer;
	BOOL bbuffer;
	int ibuffer;
	
	cbuffer = [object databaseClass];
	[data appendBytes:&cbuffer length:1];
	[FMString saveString:[object name] toData:data];
	cbuffer = [object nameGender];
	[data appendBytes:&cbuffer length:1];
	
	ibuffer = [[object types] count];
	[data appendBytes:&ibuffer length:4];
	for (int i = 0; i<[[object types] count]; i++) {
		cbuffer = [[[object types] objectAtIndex:i] charValue];
		[data appendBytes:&cbuffer length:1];
	}
	
	[FMString saveString:[object URL] toData:data];
	bbuffer = [object fake];
	[data appendBytes:&bbuffer length:1];
	
	ibuffer = [[object competitions] count];
	[data appendBytes:&ibuffer length:4];
	for (int i = 0; i<[[object competitions] count]; i++) {
		ibuffer = [[[object competitions] objectAtIndex:i] intValue];
		[data appendBytes:&ibuffer length:4];
	}
	
	ibuffer = [object cityID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object localAreaID];
	[data appendBytes:&ibuffer length:4];
	
	ibuffer = [[object nations] count];
	[data appendBytes:&ibuffer length:4];
	for (int i = 0; i<[[object nations] count]; i++) {
		ibuffer = [[[object nations] objectAtIndex:i] intValue];
		[data appendBytes:&ibuffer length:4];
	}
	
	ibuffer = [object continentID];
	[data appendBytes:&ibuffer length:4];
	
	cbuffer = [[object clubs] count];
	[data appendBytes:&cbuffer length:1];
	for (int i = 0; i<[[object clubs] count]; i++) {
		[MediaClubSaver saveClub:[[object clubs] objectAtIndex:i] toData:data];
	}
	
	cbuffer = [object period];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object scope];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object style];
	[data appendBytes:&cbuffer length:1];
	[FMDateSaver saveDate:[object lastPublishedDate] toData:data];
	
	cbuffer = [[object journalists] count];
	[data appendBytes:&cbuffer length:1];
	for (int i = 0; i<[[object journalists] count]; i++) {
		ibuffer = [[[object journalists] objectAtIndex:i] intValue];
		[data appendBytes:&ibuffer length:4];
	}
	ibuffer = [[object linkedMedia] count];
	[data appendBytes:&ibuffer length:4];
	for (int i = 0; i<[[object linkedMedia] count]; i++) {
		ibuffer = [[[object linkedMedia] objectAtIndex:i] intValue];
		[data appendBytes:&ibuffer length:4];
	}
	
	ibuffer = [object rowID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object UID];
	[data appendBytes:&ibuffer length:4];
}

@end
