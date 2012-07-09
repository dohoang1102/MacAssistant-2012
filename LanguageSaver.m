//
//  LanguageSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/31.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "LanguageSaver.h"
#import "FMString.h"

@implementation LanguageSaver

+ (void)saveLanguage:(Language *)object toData:(NSMutableData *)data
{
	char cbuffer;
	short sbuffer;
	int ibuffer;
	
	cbuffer = [object databaseClass];
	[data appendBytes:&cbuffer length:1];
	[FMString saveString:[object name] toData:data];
	cbuffer = [object nameGender];
	[data appendBytes:&cbuffer length:1];
	ibuffer = [object databaseFileOffset];
	[data appendBytes:&ibuffer length:4];
	cbuffer = [object influence];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object difficulty];
	[data appendBytes:&cbuffer length:1];
	sbuffer = [object family];
	[data appendBytes:&sbuffer length:2];
	sbuffer = [object group];
	[data appendBytes:&sbuffer length:2];
	sbuffer = [object subGroup];
	[data appendBytes:&sbuffer length:2];
	ibuffer = [object nationID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object rowID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object UID];
	[data appendBytes:&ibuffer length:4];
}

@end
