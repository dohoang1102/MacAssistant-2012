//
//  PlayerStatsTransformer.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/05.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PlayerStatsTransformer.h"
#import "PlayerStats.h"

@implementation PlayerStatsTransformer

+ (Class)transformedValueClass
{
    return [NSNumber class];
}

+ (BOOL)allowsReverseTransformation
{
    return YES;
}

- (id)transformedValue:(id)object
{
	if (object == nil) return nil;
	
	int DBRating, FMRating;
	
	if ([object respondsToSelector: @selector(intValue)]) {
		 DBRating = [object intValue];
    }
	else { NSLog (@"isnt a number!"); }
	
	FMRating = DBRating * 0.2;
	if (FMRating<1) { FMRating = 1; }
	
    return [NSNumber numberWithInt:FMRating];
}

- (id)reverseTransformedValue:(id)object
{
	if (object == nil) return nil;
	
	int FMRating, DBRating;
	
	if ([object respondsToSelector: @selector(intValue)]) {
		FMRating = [object intValue];
    }
	else { NSLog (@"VT Oh No 2"); }
	
	DBRating = FMRating / 0.2;
	
    return [NSNumber numberWithInt:DBRating];
}

@end
