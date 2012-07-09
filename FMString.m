//
//  FMString.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/24.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "FMString.h"

@implementation FMString

+ (NSString *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset
{
	unsigned int length;
	
	unsigned int offset = *byteOffset;
	
	NSString *str;
	
	[data getBytes:&length range:NSMakeRange(offset, 4)]; offset += 4;
	
	if (length>0 && length < 100000) { 
		char *tempBytes = malloc(((length*2)+2));
		tempBytes[0] = 0xFF;
		tempBytes[1] = 0xFE;
		
		[data getBytes:tempBytes+2 range:NSMakeRange(offset,(length*2))]; offset += (length * 2);
		
		// skip null byte
		offset += 2; 
		
		str = [[NSString alloc] initWithBytes:tempBytes length:((length*2)+2) encoding:NSUnicodeStringEncoding];
		free (tempBytes);
	}
	else { str = @"---"; }
		
	*byteOffset = offset;
	
	return str;
}

+ (void)saveString:(NSString *)string toData:(NSMutableData *)data
{
	short sbuffer;
	int length;
	
	if ([string isEqualToString:@"---"]) { string = @""; }
	
	length = [string length];
	[data appendBytes:&length length:4];
	
	if (length > 0) {
		for (int i = 0; i < length; i++) {
			unichar letter = [string characterAtIndex:i];
			[data appendBytes:&letter length:2];
		}
		sbuffer = 0;
		[data appendBytes:&sbuffer length:2];
	}
}

@end
