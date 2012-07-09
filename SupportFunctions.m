//
//  SupportFunctions.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/23.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "SupportFunctions.h"


@implementation SupportFunctions

+ (NSString *)readCStringFromData:(NSData *)data atOffset:(unsigned int *)byteOffset length:(int)length
{
	unsigned char bytes[length];
	[data getBytes:bytes range:NSMakeRange(*byteOffset, length)];
	
	NSString *str = [[NSString alloc] initWithBytes:bytes length:length encoding:NSUTF8StringEncoding];
	
	*byteOffset += length;
	return str;
}

+ (void)saveCString:(NSString *)str toData:(NSMutableData *)data
{
	if (![str isEqualToString:@"---"]) 
	{
		[data appendData:[str dataUsingEncoding:NSASCIIStringEncoding]];
	}
}

+ (void)showErrorWindow:(NSString *)title withInfo:(NSString *)info
{
	NSAlert *alert = [[NSAlert alloc] init];
	
	[alert setMessageText:title];
	[alert setInformativeText:info];
	[alert runModal];
	
	[alert release];
}

+ (NSString *)reverseString:(NSString *)str
{
	NSMutableString *reversedStr;
	int len = [str length];
	
	// Auto released string
	reversedStr = [NSMutableString stringWithCapacity:len];     
	
	// Probably woefully inefficient...
	while (len > 0)
		[reversedStr appendString:
         [NSString stringWithFormat:@"%C", [str characterAtIndex:--len]]];   
	
	return reversedStr;
}

@end
