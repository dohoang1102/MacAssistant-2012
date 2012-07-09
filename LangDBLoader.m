//
//  LangDBLoader.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/27.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "LangDBLoader.h"
#import "DatabaseTypes.h"
#import "LanguageIDs.h"
#import "FMString.h"
#import "SXzlib.h"

@implementation LangDBLoader

+ (LangDB *)readFromFile:(NSString *)path
{
	char cbuffer;
	int ibuffer, ibuffer2;
	
	unsigned int byteOffset = 0;
	unsigned int fileOffset = 0;
	unsigned int i, count;
	
	LangDB *object = [[LangDB alloc] init];
	
	// Load the file into memory
	NSData *fileData = [[NSData alloc] initWithContentsOfFile:path];
	
	if ([fileData length]==0) {
		NSAlert *alert = [NSAlert alertWithMessageText:@"Error Loading LangDB" defaultButton:@"OK" alternateButton:nil 
										   otherButton:nil informativeTextWithFormat:@"Please report this as a bug"];
		[alert runModal];
		return object;
	}
	
	// 0x01	?
	// 0x01	endianness
	// 0x04 file type
	// 0x02 game version
	// 0x01	???
	byteOffset += SIZE_OF_FILE_HEADER;
	
	NSMutableDictionary *offsets = [[NSMutableDictionary alloc] init];
	[fileData getBytes:&cbuffer range:NSMakeRange(byteOffset, 1)]; byteOffset += 1;
	
	for (i=0;i<cbuffer;i++)
	{
		[fileData getBytes:&ibuffer range:NSMakeRange(byteOffset, 4)]; byteOffset += 4;
		[fileData getBytes:&ibuffer2 range:NSMakeRange(byteOffset, 4)]; byteOffset += 4;
		[offsets setObject:[NSNumber numberWithInt:(ibuffer2 + SIZE_OF_FILE_HEADER)] forKey:[NSNumber numberWithInt:ibuffer]];
	}
	[object setOffsets:offsets];
	
	if ([offsets objectForKey:[NSNumber numberWithInt:[[[NSUserDefaults standardUserDefaults] objectForKey:@"langDBLanguage"] intValue]]]!=nil) {
		byteOffset = [[offsets objectForKey:[NSNumber numberWithInt:[[[NSUserDefaults standardUserDefaults] objectForKey:@"langDBLanguage"] intValue]]] intValue];
	}
	else if ([offsets objectForKey:[NSNumber numberWithInt:LID_ENGLISH]]!=nil) {
		byteOffset = [[offsets objectForKey:[NSNumber numberWithInt:LID_ENGLISH]] intValue];
	}
	else { /* just let it carry on and read the first language */ }
	
	NSData *data = [[NSData alloc] initWithData:[[fileData subdataWithRange:NSMakeRange(byteOffset, ([fileData length] - byteOffset))] zlibInflate]];
		
	[fileData release];
	
	NSMutableDictionary *langs = [[NSMutableDictionary alloc] init];
	NSMutableDictionary *lang;
	
	[data getBytes:&count range:NSMakeRange(fileOffset, 4)]; fileOffset += 4;
	for (i=0;i<count;i++) {
		lang = [[NSMutableDictionary alloc] init];
		[data getBytes:&ibuffer range:NSMakeRange(fileOffset, 4)]; fileOffset += 4;
		[lang setObject:[NSNumber numberWithInt:ibuffer] forKey:@"UID"];
		[lang setObject:[FMString readFromData:data atOffset:&fileOffset] forKey:@"name"];
		[data getBytes:&cbuffer range:NSMakeRange(fileOffset, 1)]; fileOffset += 1;
		[lang setObject:[NSNumber numberWithChar:cbuffer] forKey:@"nameGender"];
		[lang setObject:[FMString readFromData:data atOffset:&fileOffset] forKey:@"citizensName"];
		[data getBytes:&cbuffer range:NSMakeRange(fileOffset, 1)]; fileOffset += 1;
		[lang setObject:[NSNumber numberWithChar:cbuffer] forKey:@"citizensNameGender"];
		
		[langs setObject:lang forKey:[NSNumber numberWithInt:ibuffer]];
		[lang release];
	}
	[object setCityLang:langs];
	[langs release];
	
	NSLog(@"LangDB (cities) done at %d",fileOffset);
	
	langs = [[NSMutableDictionary alloc] init];
	[data getBytes:&count range:NSMakeRange(fileOffset, 4)]; fileOffset += 4;
	for (i=0;i<count;i++) {
		lang = [[NSMutableDictionary alloc] init];
		[data getBytes:&ibuffer range:NSMakeRange(fileOffset, 4)]; fileOffset += 4;
		[lang setObject:[NSNumber numberWithInt:ibuffer] forKey:@"UID"];
		[lang setObject:[FMString readFromData:data atOffset:&fileOffset] forKey:@"name"];
		[data getBytes:&cbuffer range:NSMakeRange(fileOffset, 1)]; fileOffset += 1;
		[lang setObject:[NSNumber numberWithChar:cbuffer] forKey:@"nameGender"];
		[lang setObject:[FMString readFromData:data atOffset:&fileOffset] forKey:@"shortName"];
		[data getBytes:&cbuffer range:NSMakeRange(fileOffset, 1)]; fileOffset += 1;
		[lang setObject:[NSNumber numberWithChar:cbuffer] forKey:@"shortNameGender"];
		[lang setObject:[FMString readFromData:data atOffset:&fileOffset] forKey:@"sixLetterName"];
		[data getBytes:&cbuffer range:NSMakeRange(fileOffset, 1)]; fileOffset += 1;
		[lang setObject:[NSNumber numberWithChar:cbuffer] forKey:@"nicknameGender"];
		[lang setObject:[FMString readFromData:data atOffset:&fileOffset] forKey:@"nickname"];
		[data getBytes:&cbuffer range:NSMakeRange(fileOffset, 1)]; fileOffset += 1;
		[lang setObject:[NSNumber numberWithChar:cbuffer] forKey:@"nickname2Gender"];
		[lang setObject:[FMString readFromData:data atOffset:&fileOffset] forKey:@"nickname2"];
		
		[langs setObject:lang forKey:[NSNumber numberWithInt:ibuffer]];
		[lang release];
		
	}
	[object setClubLang:langs];
	[langs release];
	
	NSLog(@"LangDB (clubs) done at %d",fileOffset);
	
	langs = [[NSMutableDictionary alloc] init];
	[data getBytes:&count range:NSMakeRange(fileOffset, 4)]; fileOffset += 4;
	for (i=0;i<count;i++) {
		lang = [[NSMutableDictionary alloc] init];
		[data getBytes:&ibuffer range:NSMakeRange(fileOffset, 4)]; fileOffset += 4;
		[lang setObject:[NSNumber numberWithInt:ibuffer] forKey:@"UID"];
		[lang setObject:[FMString readFromData:data atOffset:&fileOffset] forKey:@"name"];
		[data getBytes:&cbuffer range:NSMakeRange(fileOffset, 1)]; fileOffset += 1;
		[lang setObject:[NSNumber numberWithChar:cbuffer] forKey:@"nameGender"];
		[lang setObject:[FMString readFromData:data atOffset:&fileOffset] forKey:@"threeLetterName"];
		[lang setObject:[FMString readFromData:data atOffset:&fileOffset] forKey:@"continentialityName"];
		[lang setObject:[FMString readFromData:data atOffset:&fileOffset] forKey:@"federationName"];
		[data getBytes:&cbuffer range:NSMakeRange(fileOffset, 1)]; fileOffset += 1;
		[lang setObject:[NSNumber numberWithChar:cbuffer] forKey:@"federationNameGender"];
		[lang setObject:[FMString readFromData:data atOffset:&fileOffset] forKey:@"federationShortName"];
		[data getBytes:&cbuffer range:NSMakeRange(fileOffset, 1)]; fileOffset += 1;
		[lang setObject:[NSNumber numberWithChar:cbuffer] forKey:@"federationShortNameGender"];
		
		NSMutableArray *altNames = [[NSMutableArray alloc] init];
		unsigned int j;
		
		[data getBytes:&cbuffer range:NSMakeRange(fileOffset, 1)]; fileOffset += 1;
		for (j=0;j<cbuffer;j++) {
			[altNames addObject:[FMString readFromData:data atOffset:&fileOffset]];
		}
		[lang setObject:altNames forKey:@"altContinentialityNames"];
		[altNames release];
		
		[langs setObject:lang forKey:[NSNumber numberWithInt:ibuffer]];
		[lang release];
	}
	[object setContinentLang:langs];
	[langs release];
	
	NSLog(@"LangDB (continents) done at %d",fileOffset);
	
	langs = [[NSMutableDictionary alloc] init];
	[data getBytes:&count range:NSMakeRange(fileOffset, 4)]; fileOffset += 4;
	for (i=0;i<count;i++) {
		lang = [[NSMutableDictionary alloc] init];
		[data getBytes:&ibuffer range:NSMakeRange(fileOffset, 4)]; fileOffset += 4;
		[lang setObject:[NSNumber numberWithInt:ibuffer] forKey:@"UID"];
		[lang setObject:[FMString readFromData:data atOffset:&fileOffset] forKey:@"name"];
		[data getBytes:&cbuffer range:NSMakeRange(fileOffset, 1)]; fileOffset += 1;
		[lang setObject:[NSNumber numberWithChar:cbuffer] forKey:@"nameGender"];
		[lang setObject:[FMString readFromData:data atOffset:&fileOffset] forKey:@"sentenceName"];
		[data getBytes:&cbuffer range:NSMakeRange(fileOffset, 1)]; fileOffset += 1;
		[lang setObject:[NSNumber numberWithChar:cbuffer] forKey:@"sentenceNameGender"];
		
		[langs setObject:lang forKey:[NSNumber numberWithInt:ibuffer]];
		[lang release];
	}
	[object setInjuryLang:langs];
	[langs release];
	
	NSLog(@"LangDB (injuries) done at %d",fileOffset);

	langs = [[NSMutableDictionary alloc] init];
	[data getBytes:&count range:NSMakeRange(fileOffset, 4)]; fileOffset += 4;
	for (i=0;i<count;i++) {
		lang = [[NSMutableDictionary alloc] init];
		[data getBytes:&ibuffer range:NSMakeRange(fileOffset, 4)]; fileOffset += 4;
		[lang setObject:[NSNumber numberWithInt:ibuffer] forKey:@"UID"];
		[lang setObject:[FMString readFromData:data atOffset:&fileOffset] forKey:@"name"];
		[data getBytes:&cbuffer range:NSMakeRange(fileOffset, 1)]; fileOffset += 1;
		[lang setObject:[NSNumber numberWithChar:cbuffer] forKey:@"nameGender"];
		[lang setObject:[FMString readFromData:data atOffset:&fileOffset] forKey:@"shortName"];
		[data getBytes:&cbuffer range:NSMakeRange(fileOffset, 1)]; fileOffset += 1;
		[lang setObject:[NSNumber numberWithChar:cbuffer] forKey:@"shortNameGender"];
		[lang setObject:[FMString readFromData:data atOffset:&fileOffset] forKey:@"threeLetterName"];
		[lang setObject:[FMString readFromData:data atOffset:&fileOffset] forKey:@"nationalityName"];
		
		NSMutableArray *altNames = [[NSMutableArray alloc] init];
		unsigned int j;
		
		[data getBytes:&cbuffer range:NSMakeRange(fileOffset, 1)]; fileOffset += 1;
		for (j=0;j<cbuffer;j++) {
			[altNames addObject:[FMString readFromData:data atOffset:&fileOffset]];
		}
		[lang setObject:altNames forKey:@"altNationalityNames"];
		[altNames release];
		
		[langs setObject:lang forKey:[NSNumber numberWithInt:ibuffer]];
		[lang release];
	}
	[object setNationLang:langs];
	[langs release];
	
	NSLog(@"LangDB (nations) done at %d",fileOffset);
	
	langs = [[NSMutableDictionary alloc] init];
	[data getBytes:&count range:NSMakeRange(fileOffset, 4)]; fileOffset += 4;
	for (i=0;i<count;i++) {
		lang = [[NSMutableDictionary alloc] init];
		[data getBytes:&ibuffer range:NSMakeRange(fileOffset, 4)]; fileOffset += 4;
		[lang setObject:[NSNumber numberWithInt:ibuffer] forKey:@"UID"];
		[lang setObject:[FMString readFromData:data atOffset:&fileOffset] forKey:@"name"];
		[data getBytes:&cbuffer range:NSMakeRange(fileOffset, 1)]; fileOffset += 1;
		[lang setObject:[NSNumber numberWithChar:cbuffer] forKey:@"nameGender"];
		[lang setObject:[FMString readFromData:data atOffset:&fileOffset] forKey:@"shortName"];
		[data getBytes:&cbuffer range:NSMakeRange(fileOffset, 1)]; fileOffset += 1;
		[lang setObject:[NSNumber numberWithChar:cbuffer] forKey:@"shortNameGender"];
		
		[langs setObject:lang forKey:[NSNumber numberWithInt:ibuffer]];
		[lang release];
	}
	[object setAwardLang:langs];
	[langs release];
	
	NSLog(@"LangDB (%d awards) done at %d",count, fileOffset);
	
	langs = [[NSMutableDictionary alloc] init];
	[data getBytes:&count range:NSMakeRange(fileOffset, 4)]; fileOffset += 4;
	for (i=0;i<count;i++) {
		lang = [[NSMutableDictionary alloc] init];
		[data getBytes:&ibuffer range:NSMakeRange(fileOffset, 4)]; fileOffset += 4;
		[lang setObject:[NSNumber numberWithInt:ibuffer] forKey:@"UID"];
		[lang setObject:[FMString readFromData:data atOffset:&fileOffset] forKey:@"name"];
		[data getBytes:&cbuffer range:NSMakeRange(fileOffset, 1)]; fileOffset += 1;
		[lang setObject:[NSNumber numberWithChar:cbuffer] forKey:@"nameGender"];
		
		[langs setObject:lang forKey:[NSNumber numberWithInt:ibuffer]];
		[lang release];
	}
	[object setStadiumLang:langs];
	[langs release];
	
	NSLog(@"LangDB (%d stadiums) done at %d",count,fileOffset);
	
	langs = [[NSMutableDictionary alloc] init];
	[data getBytes:&count range:NSMakeRange(fileOffset, 4)]; fileOffset += 4;
	for (i=0;i<count;i++) {
		lang = [[NSMutableDictionary alloc] init];
		[data getBytes:&ibuffer range:NSMakeRange(fileOffset, 4)]; fileOffset += 4;
		[lang setObject:[NSNumber numberWithInt:ibuffer] forKey:@"UID"];
		[lang setObject:[FMString readFromData:data atOffset:&fileOffset] forKey:@"name"];
		[data getBytes:&cbuffer range:NSMakeRange(fileOffset, 1)]; fileOffset += 1;
		[lang setObject:[NSNumber numberWithChar:cbuffer] forKey:@"nameGender"];
		[lang setObject:[FMString readFromData:data atOffset:&fileOffset] forKey:@"shortName"];
		[data getBytes:&cbuffer range:NSMakeRange(fileOffset, 1)]; fileOffset += 1;
		[lang setObject:[NSNumber numberWithChar:cbuffer] forKey:@"shortNameGender"];
		[lang setObject:[FMString readFromData:data atOffset:&fileOffset] forKey:@"pluralName"];
		[data getBytes:&cbuffer range:NSMakeRange(fileOffset, 1)]; fileOffset += 1;
		[lang setObject:[NSNumber numberWithChar:cbuffer] forKey:@"pluralNameGender"];
		
		[langs setObject:lang forKey:[NSNumber numberWithInt:ibuffer]];
		[lang release];
	}
	[object setStageNameLang:langs];
	[langs release];
	
	NSLog(@"LangDB (%d stage names) done at %d",count,fileOffset);
	
	langs = [[NSMutableDictionary alloc] init];
	[data getBytes:&count range:NSMakeRange(fileOffset, 4)]; fileOffset += 4;
	for (i=0;i<count;i++) {
		lang = [[NSMutableDictionary alloc] init];
		[data getBytes:&ibuffer range:NSMakeRange(fileOffset, 4)]; fileOffset += 4;
		[lang setObject:[NSNumber numberWithInt:ibuffer] forKey:@"UID"];
		[lang setObject:[FMString readFromData:data atOffset:&fileOffset] forKey:@"name"];
		[data getBytes:&cbuffer range:NSMakeRange(fileOffset, 1)]; fileOffset += 1;
		[lang setObject:[NSNumber numberWithChar:cbuffer] forKey:@"nameGender"];
		[lang setObject:[FMString readFromData:data atOffset:&fileOffset] forKey:@"shortName"];
		[data getBytes:&cbuffer range:NSMakeRange(fileOffset, 1)]; fileOffset += 1;
		[lang setObject:[NSNumber numberWithChar:cbuffer] forKey:@"shortNameGender"];
		[lang setObject:[FMString readFromData:data atOffset:&fileOffset] forKey:@"threeLetterName"];
		[langs setObject:lang forKey:[NSNumber numberWithInt:ibuffer]];
		[lang release];
	}
	[object setCompLang:langs];
	[langs release];
	
	NSLog(@"LangDB (%d comps) done at %d",count,fileOffset);
	
	langs = [[NSMutableDictionary alloc] init];
	[data getBytes:&count range:NSMakeRange(fileOffset, 4)]; fileOffset += 4;
	for (i=0;i<count;i++) {
		lang = [[NSMutableDictionary alloc] init];
		[data getBytes:&ibuffer range:NSMakeRange(fileOffset, 4)]; fileOffset += 4;
		[lang setObject:[NSNumber numberWithInt:ibuffer] forKey:@"UID"];
		[lang setObject:[FMString readFromData:data atOffset:&fileOffset] forKey:@"name"];
		
		NSMutableArray *altNames = [[NSMutableArray alloc] init];
		unsigned int j;
		
		[data getBytes:&cbuffer range:NSMakeRange(fileOffset, 1)]; fileOffset += 1;
		for (j=0;j<cbuffer;j++) {
			[altNames addObject:[FMString readFromData:data atOffset:&fileOffset]];
		}
		[lang setObject:altNames forKey:@"altRegionalityNames"];
		[altNames release];
		
		[langs setObject:lang forKey:[NSNumber numberWithInt:ibuffer]];
		[lang release];
	}
	[object setRegionLang:langs];
	[langs release];
	
	NSLog(@"LangDB (%d regions) done at %d",count,fileOffset);
	
	langs = [[NSMutableDictionary alloc] init];
	[data getBytes:&count range:NSMakeRange(fileOffset, 4)]; fileOffset += 4;
	for (i=0;i<count;i++) {
		lang = [[NSMutableDictionary alloc] init];
		[data getBytes:&ibuffer range:NSMakeRange(fileOffset, 4)]; fileOffset += 4;
		[lang setObject:[NSNumber numberWithInt:ibuffer] forKey:@"UID"];
		[data getBytes:&cbuffer range:NSMakeRange(fileOffset, 1)]; fileOffset += 1;
		[lang setObject:[NSNumber numberWithChar:cbuffer] forKey:@"nameGender"];
		
		NSMutableArray *names = [[NSMutableArray alloc] init];
		unsigned int j;
		
		[data getBytes:&cbuffer range:NSMakeRange(fileOffset, 1)]; fileOffset += 1;
		for (j=0;j<cbuffer;j++) {
			[names addObject:[FMString readFromData:data atOffset:&fileOffset]];
		}
		[lang setObject:names forKey:@"names"];
		
		// gender 2? - doesnt seem to be used in english
		fileOffset += 1;
		
		NSMutableArray *names2 = [[NSMutableArray alloc] init];
		
		[data getBytes:&cbuffer range:NSMakeRange(fileOffset, 1)]; fileOffset += 1;
		for (j=0;j<cbuffer;j++) {
			[names2 addObject:[FMString readFromData:data atOffset:&fileOffset]];
		}
		[lang setObject:names2 forKey:@"names2"];
		
		[names release];
		[names2 release];
		
		[langs setObject:lang forKey:[NSNumber numberWithInt:ibuffer]];
		[lang release];
	}
	[object setDescriptionLang:langs];
	[langs release];
	
	NSLog(@"LangDB (%d descriptions) done at %d",count,fileOffset);
	
	langs = [[NSMutableDictionary alloc] init];
	[data getBytes:&count range:NSMakeRange(fileOffset, 4)]; fileOffset += 4;
	for (i=0;i<count;i++) {
		lang = [[NSMutableDictionary alloc] init];
		[data getBytes:&ibuffer range:NSMakeRange(fileOffset, 4)]; fileOffset += 4;
		[lang setObject:[NSNumber numberWithInt:ibuffer] forKey:@"UID"];
		[lang setObject:[FMString readFromData:data atOffset:&fileOffset] forKey:@"name"];
		[data getBytes:&cbuffer range:NSMakeRange(fileOffset, 1)]; fileOffset += 1;
		[lang setObject:[NSNumber numberWithChar:cbuffer] forKey:@"nameGender"];
		
		[langs setObject:lang forKey:[NSNumber numberWithInt:ibuffer]];
		[lang release];
	}
	[object setMediaLang:langs];
	[langs release];
	
	NSLog(@"LangDB (media) done at %d",fileOffset);
	
	langs = [[NSMutableDictionary alloc] init];
	[data getBytes:&count range:NSMakeRange(fileOffset, 4)]; fileOffset += 4;
	for (i=0;i<count;i++) {
		lang = [[NSMutableDictionary alloc] init];
		[data getBytes:&ibuffer range:NSMakeRange(fileOffset, 4)]; fileOffset += 4;
		[lang setObject:[NSNumber numberWithInt:ibuffer] forKey:@"UID"];
		[lang setObject:[FMString readFromData:data atOffset:&fileOffset] forKey:@"name"];
		[data getBytes:&cbuffer range:NSMakeRange(fileOffset, 1)]; fileOffset += 1;
		[lang setObject:[NSNumber numberWithChar:cbuffer] forKey:@"nameGender"];
		[lang setObject:[FMString readFromData:data atOffset:&fileOffset] forKey:@"shortName"];
		[data getBytes:&cbuffer range:NSMakeRange(fileOffset, 1)]; fileOffset += 1;
		[lang setObject:[NSNumber numberWithChar:cbuffer] forKey:@"shortNameGender"];
		
		[langs setObject:lang forKey:[NSNumber numberWithInt:ibuffer]];
		[lang release];
	}
	[object setLocalAreaLang:langs];
	[langs release];
	
	NSLog(@"LangDB (local areas) done at %d",fileOffset);
	
	langs = [[NSMutableDictionary alloc] init];
	[data getBytes:&count range:NSMakeRange(fileOffset, 4)]; fileOffset += 4;
	for (i=0;i<count;i++) {
		lang = [[NSMutableDictionary alloc] init];
		[data getBytes:&ibuffer range:NSMakeRange(fileOffset, 4)]; fileOffset += 4;
		[lang setObject:[NSNumber numberWithInt:ibuffer] forKey:@"UID"];
		[lang setObject:[FMString readFromData:data atOffset:&fileOffset] forKey:@"name"];
		[lang setObject:[FMString readFromData:data atOffset:&fileOffset] forKey:@"shortName"];
		[lang setObject:[FMString readFromData:data atOffset:&fileOffset] forKey:@"alternativeName"];
		[lang setObject:[FMString readFromData:data atOffset:&fileOffset] forKey:@"alternativeShortName"];
		[data getBytes:&cbuffer range:NSMakeRange(fileOffset, 1)]; fileOffset += 1;
		[lang setObject:[NSNumber numberWithChar:cbuffer] forKey:@"nameGender"];
		[data getBytes:&cbuffer range:NSMakeRange(fileOffset, 1)]; fileOffset += 1;
		[lang setObject:[NSNumber numberWithChar:cbuffer] forKey:@"shortNameGender"];
		[data getBytes:&cbuffer range:NSMakeRange(fileOffset, 1)]; fileOffset += 1;
		[lang setObject:[NSNumber numberWithChar:cbuffer] forKey:@"alternativeNameGender"];
		[data getBytes:&cbuffer range:NSMakeRange(fileOffset, 1)]; fileOffset += 1;
		[lang setObject:[NSNumber numberWithChar:cbuffer] forKey:@"alternativeShortNameGender"];
		
		[langs setObject:lang forKey:[NSNumber numberWithInt:ibuffer]];
		[lang release];
	}
	[object setDerbyLang:langs];
	[langs release];
	
	NSLog(@"LangDB (derbies) done at %d",fileOffset);

	langs = [[NSMutableDictionary alloc] init];
	[data getBytes:&count range:NSMakeRange(fileOffset, 4)]; fileOffset += 4;
	for (i=0;i<count;i++) {
		lang = [[NSMutableDictionary alloc] init];
		[data getBytes:&ibuffer range:NSMakeRange(fileOffset, 4)]; fileOffset += 4;
		[lang setObject:[NSNumber numberWithInt:ibuffer] forKey:@"UID"];
		[lang setObject:[FMString readFromData:data atOffset:&fileOffset] forKey:@"name"];
		[data getBytes:&cbuffer range:NSMakeRange(fileOffset, 1)]; fileOffset += 1;
		[lang setObject:[NSNumber numberWithChar:cbuffer] forKey:@"nameGender"];
		[langs setObject:lang forKey:[NSNumber numberWithInt:ibuffer]];
		[lang release];
	}
	[object setAgreementLang:langs];
	[langs release];
	
	NSLog(@"LangDB (agreements) done at %d",fileOffset);
	[data release];
	
	return object;
}

@end
