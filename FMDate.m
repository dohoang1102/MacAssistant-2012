//
//  FMDate.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/24.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "FMDate.h"

@implementation FMDate

@synthesize day, year, date;

- (NSDate *)date
{
	NSDateComponents *comps = [[NSDateComponents alloc] init];
	[comps setYear:year];
	[comps setMonth:1];
	[comps setDay:(day+1)];
	NSDate *newDate = [[NSCalendar currentCalendar] dateFromComponents:comps];
	[comps release];
	
	return newDate;
}
- (void)setDate:(NSDate *)val
{
	unsigned short newYear = [[val descriptionWithCalendarFormat:@"%Y" timeZone:nil locale:nil] intValue];
	
	NSDate *tempDate = [[NSDate alloc] initWithString:[NSString stringWithFormat:@"2001-%d-%d 10:45:32 +0000",
													   [[val descriptionWithCalendarFormat:@"%m" timeZone:nil locale:nil] intValue],
													   [[val descriptionWithCalendarFormat:@"%d" timeZone:nil locale:nil] intValue]]];
	
	unsigned short newDay = [tempDate timeIntervalSinceReferenceDate] / 86400;
	[tempDate release];
	
	[self setDay:newDay];
	[self setYear:newYear];
}

@end
