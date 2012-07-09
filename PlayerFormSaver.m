//
//  PlayerFormSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 10/07/26.
//  Copyright 2010 littleblue. All rights reserved.
//

#import "PlayerFormSaver.h"
#import "MatchFormSaver.h"

@implementation PlayerFormSaver

+ (void)savePlayerForm:(PlayerForm *)object toData:(NSMutableData *)data
{
	char cbuffer;
	int ibuffer;
	
	ibuffer = [object teamID];
	[data appendBytes:&ibuffer length:4];
	
	cbuffer = [[object matchForms] count];
	[data appendBytes:&cbuffer length:1];
	for (int i = 0; i<[[object matchForms] count]; i++) {
		[MatchFormSaver saveMatchForm:[[object matchForms] objectAtIndex:i] toData:data];
	}
}

@end
