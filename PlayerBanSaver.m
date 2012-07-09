//
//  PlayerBanSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 10/07/25.
//  Copyright 2010 littleblue. All rights reserved.
//

#import "PlayerBanSaver.h"
#import "ShortFixtureSaver.h"
#import "FMDateSaver.h"

@implementation PlayerBanSaver

+ (void)saveBan:(PlayerBan *)object toData:(NSMutableData *)data
{
	char cbuffer;
	short sbuffer;
	BOOL bbuffer;
	
	sbuffer = [object disciplineRulesIndex];
	[data appendBytes:&sbuffer length:2];
	cbuffer = [object gamesBannedFor];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object gamesMissed];
	[data appendBytes:&cbuffer length:1];
	sbuffer = [object daysBanned];
	[data appendBytes:&sbuffer length:2];
	cbuffer = [object reason];
	[data appendBytes:&cbuffer length:1];
	sbuffer = [object pointsCount];
	[data appendBytes:&sbuffer length:2];
	[FMDateSaver saveDate:[object startDate] toData:data];
	cbuffer = [object scope];
	[data appendBytes:&cbuffer length:1];
	[data appendData:[object unknownData1]];
	cbuffer = [object decision];
	[data appendBytes:&cbuffer length:1];
	bbuffer = [object hasFixture];
	[data appendBytes:&bbuffer length:1];
	
	if ([object hasFixture]) {
		[ShortFixtureSaver saveFixture:[object fixture] toData:data];
	}
}

@end
