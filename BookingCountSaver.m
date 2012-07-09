//
//  BookingCountSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 10/07/26.
//  Copyright 2010 littleblue. All rights reserved.
//

#import "BookingCountSaver.h"

@implementation BookingCountSaver

+ (void)saveCount:(BookingCount *)object toData:(NSMutableData *)data
{
	char cbuffer;
	short sbuffer;
	
	cbuffer = [object type];
	[data appendBytes:&cbuffer length:1];
	
	if ([object type]==PBC_BASE_TYPE) {
		sbuffer = [object disciplineRulesIndex];
		[data appendBytes:&sbuffer length:2];
		cbuffer = [object yellowCards];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object redCards];
		[data appendBytes:&cbuffer length:1];
	}
	else if ([object type]==PBC_POINTS_TYPE) {
		sbuffer = [object points];
		[data appendBytes:&sbuffer length:2];
		sbuffer = [object disciplineRulesIndex];
		[data appendBytes:&sbuffer length:2];
		cbuffer = [object yellowCards];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object redCards];
		[data appendBytes:&cbuffer length:1];
	}
	else if ([object type]==PBC_LAST_10_GAMES_TYPE) {
		sbuffer = [object last10Games];
		[data appendBytes:&sbuffer length:2];
		sbuffer = [object disciplineRulesIndex];
		[data appendBytes:&sbuffer length:2];
		cbuffer = [object yellowCards];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object redCards];
		[data appendBytes:&cbuffer length:1];
	}
	else if ([object type]==PBC_LAST_3_SEASONS_TYPE) {
		cbuffer = [object season1];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object season2];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object season3];
		[data appendBytes:&cbuffer length:1];
		sbuffer = [object points];
		[data appendBytes:&sbuffer length:2];
		sbuffer = [object disciplineRulesIndex];
		[data appendBytes:&sbuffer length:2];
		cbuffer = [object yellowCards];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object redCards];
		[data appendBytes:&cbuffer length:1];
	}
	else if ([object type]==PBC_LAST_5_GAMES_TYPE) {
		cbuffer = [object last5Games];
		[data appendBytes:&cbuffer length:1];
		sbuffer = [object disciplineRulesIndex];
		[data appendBytes:&sbuffer length:2];
		cbuffer = [object yellowCards];
		[data appendBytes:&cbuffer length:1];
		cbuffer = [object redCards];
		[data appendBytes:&cbuffer length:1];
	}
}

@end
