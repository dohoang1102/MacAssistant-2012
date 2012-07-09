//
//  AlliterationSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/18.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "AlliterationSaver.h"
#import "FMString.h"

@implementation AlliterationSaver

+ (void)saveAlliteration:(Alliteration *)object toData:(NSMutableData *)data
{
	[FMString saveString:[object name] toData:data];
}

@end
