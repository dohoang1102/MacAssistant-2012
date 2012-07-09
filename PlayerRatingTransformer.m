//
//  PlayerRatingTransformer.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/27.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PlayerRatingTransformer.h"


@implementation PlayerRatingTransformer

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
	
	int oldRating;
	float newRating;
	
	if ([object respondsToSelector: @selector(intValue)]) {
		oldRating = [object intValue];
    }
	else { NSLog (@"isnt a number!"); }
	
	newRating = oldRating;
	NSLog(@"%f %d",newRating, oldRating);
	newRating = newRating / 10;
	NSLog(@"%f",newRating);
	if (newRating > 10) { newRating = 10; }
	else if (newRating < 0) { newRating = 0; }
	
    return [NSNumber numberWithFloat:newRating];
}

- (id)reverseTransformedValue:(id)object
{
	if (object == nil) return nil;
	
	float oldRating;
	int newRating;
	
	if ([object respondsToSelector: @selector(floatValue)]) {
		oldRating = [object floatValue];
    }
	else { NSLog (@"isnt a number!"); }
	
	newRating = oldRating * 10;
	
	if (newRating > 100) { newRating = 100; }
	else if (newRating < 0) { newRating = 0; }
	
    return [NSNumber numberWithInt:newRating];
}

@end
