//
//  LangDB.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/27.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "LangDB.h"
#import "SupportFunctions.h"
#import "SXzlib.h"

@implementation LangDB

@synthesize offsets, cityLang, clubLang, continentLang, injuryLang, nationLang, awardLang, 
stadiumLang, compLang, regionLang, descriptionLang, mediaLang, stageNameLang, localAreaLang,
agreementLang, derbyLang;

+ (void)extractLangDB:(NSString *)path
{
	unsigned int byteOffset = 0;
	unsigned int i;
	
	NSString *decompressPath = [NSString stringWithFormat:@"%@",[path stringByDeletingPathExtension]];
	[[NSFileManager defaultManager] createDirectoryAtPath:decompressPath withIntermediateDirectories:YES attributes:nil error:nil];
	
	// load the file into memory
	NSData *fileData = [[NSData alloc] initWithContentsOfFile:path];
	
	byteOffset +=2;
	
	// read the file type - it's .dat so always compressed
	[SupportFunctions readCStringFromData:fileData atOffset:&byteOffset length:4];
	
	NSData *decompressedData; 
		
	byteOffset += 3;
	unsigned char languageCount;
	unsigned int languageLocation = 0;
	unsigned int language = 0;
		
	[fileData getBytes:&languageCount range:NSMakeRange(byteOffset,1)];	byteOffset +=1;
		
	for (i=0;i<languageCount;i++) {
		[fileData getBytes:&language range:NSMakeRange(byteOffset,4)];	byteOffset +=4;
		[fileData getBytes:&languageLocation range:NSMakeRange(byteOffset,4)];	byteOffset +=4;
		
		decompressedData = [[NSData alloc] initWithData:[[fileData subdataWithRange:NSMakeRange((languageLocation + 9), ([fileData length] - (languageLocation + 9)))] zlibInflate]];
		
		[[NSFileManager defaultManager] createFileAtPath:[NSString stringWithFormat:@"%@/lang_db(Language %d).dat",decompressPath,language] contents:decompressedData attributes:nil];
		[decompressedData release];	
	}
	
	[fileData release];
}

@end
