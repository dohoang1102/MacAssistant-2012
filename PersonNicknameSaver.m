//
//  PersonNicknameSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 10/07/25.
//  Copyright 2010 littleblue. All rights reserved.
//

#import "PersonNicknameSaver.h"
#import "FMString.h"

@implementation PersonNicknameSaver

+ (void)saveNickname:(PersonNickname *)object toData:(NSMutableData *)data
{
	int ibuffer;
	
	[FMString saveString:[object nickname] toData:data];
	ibuffer = [object nicknamerID];
	[data appendBytes:&ibuffer length:4];
}

@end
