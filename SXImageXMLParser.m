//
//  SXImageXMLParser.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/30.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "SXImageXMLParser.h"


@implementation SXImageXMLParser

@synthesize homeKits, awayKits, thirdKits, smallClubLogos, clubLogos, hugeClubLogos, 
smallCompetitionLogos, competitionLogos, hugeCompetitionLogos, smallNationLogos, 
nationLogos, hugeNationLogos, nationFlags, smallContinentLogos, continentLogos, 
hugeContinentLogos, personPhotos, smallPersonPhotos;

- (id)init
{
	[super init];
	
	homeKits = [[NSMutableDictionary alloc] init];
	awayKits = [[NSMutableDictionary alloc] init];
	thirdKits = [[NSMutableDictionary alloc] init];
	smallClubLogos = [[NSMutableDictionary alloc] init];
	clubLogos = [[NSMutableDictionary alloc] init];
	hugeClubLogos = [[NSMutableDictionary alloc] init];
	smallCompetitionLogos = [[NSMutableDictionary alloc] init];
	competitionLogos = [[NSMutableDictionary alloc] init];
	hugeCompetitionLogos = [[NSMutableDictionary alloc] init];
	smallNationLogos = [[NSMutableDictionary alloc] init];
	nationLogos = [[NSMutableDictionary alloc] init];
	hugeNationLogos = [[NSMutableDictionary alloc] init];
	nationFlags = [[NSMutableDictionary alloc] init];
	smallContinentLogos = [[NSMutableDictionary alloc] init];
	continentLogos = [[NSMutableDictionary alloc] init];
	hugeContinentLogos = [[NSMutableDictionary alloc] init];
	personPhotos = [[NSMutableDictionary alloc] init];
	smallPersonPhotos = [[NSMutableDictionary alloc] init];
	
	return self;
}

- (void)dealloc
{
	[homeKits release];
	[awayKits release];
	[thirdKits release];
	[homeKits release];
	[awayKits release];
	[thirdKits release];
	[smallClubLogos release];
	[clubLogos release];
	[hugeClubLogos release];
	[smallCompetitionLogos release];
	[competitionLogos release];
	[hugeCompetitionLogos release];
	[smallNationLogos release];
	[nationLogos release];
	[hugeNationLogos release];
	[nationFlags release];
	[smallContinentLogos release];
	[continentLogos release];
	[hugeContinentLogos release];
	[personPhotos release];
	[smallPersonPhotos release];
	
	[super dealloc];
}

- (void)parsePathForGraphics:(NSString *)basePath
{
	if ([[NSFileManager defaultManager] fileExistsAtPath:basePath]) {
		NSString *item;
		NSDirectoryEnumerator *dEnum = [[NSFileManager defaultManager] enumeratorAtPath:basePath];
		
		while (item = [dEnum nextObject]) {
			if ([[[item lastPathComponent] lowercaseString] isEqualToString:@"config.xml"]) {
				NSString *filePath = [[NSString alloc] initWithFormat:@"%@/%@",basePath,item];
				fileBase = [filePath stringByDeletingLastPathComponent];
				NSXMLParser *parser = [[NSXMLParser alloc] initWithContentsOfURL:[NSURL fileURLWithPath:filePath]];
				[parser setDelegate:self];
				[parser parse];
				[parser release];
				[filePath release];
			}
		}
	}
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributes
{
	if ([[elementName lowercaseString] isEqualToString:@"record"] &&
		[attributes objectForKey:@"from"]!=nil &&
		[attributes objectForKey:@"to"]!=nil) {
		NSMutableArray *pathComponents = [[NSMutableArray alloc] initWithArray:[[attributes objectForKey:@"to"] pathComponents]];
		
		if ([pathComponents count] < 5) { return; }
		
		int UID = [[pathComponents objectAtIndex:3] intValue];
		NSString *filePath = [[NSString alloc] initWithFormat:@"%@/%@.png",fileBase,[attributes objectForKey:@"from"]];
		NSString *subType = [[NSString alloc] initWithString:[[pathComponents objectAtIndex:2] lowercaseString]];
		
		[pathComponents removeObjectsInRange:NSMakeRange(0, 4)];
		NSString *type = [[NSString alloc] initWithString:[[NSString pathWithComponents:pathComponents] lowercaseString]];
		
		if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
			NSString *image = filePath;
			
			if ([type isEqualToString:@"kits/home"]) {
				[homeKits setObject:image forKey:[NSNumber numberWithInt:UID]];
			}
			else if ([type isEqualToString:@"kits/away"]) {
				[awayKits setObject:image forKey:[NSNumber numberWithInt:UID]];
			}
			else if ([type isEqualToString:@"kits/third"]) {
				[thirdKits setObject:image forKey:[NSNumber numberWithInt:UID]];
			}
			else if ([type isEqualToString:@"logo/huge"] &&
					 [subType isEqualToString:@"club"]) {
				[hugeClubLogos setObject:image forKey:[NSNumber numberWithInt:UID]];
			}
			else if ([type isEqualToString:@"logo"] &&
					 [subType isEqualToString:@"club"]) {
				[clubLogos setObject:image forKey:[NSNumber numberWithInt:UID]];
			}
			else if ([type isEqualToString:@"icon"] &&
					 [subType isEqualToString:@"club"]) {
				[smallClubLogos setObject:image forKey:[NSNumber numberWithInt:UID]];
			}
			else if ([type isEqualToString:@"logo/huge"] &&
					 [subType isEqualToString:@"comp"]) {
				[hugeCompetitionLogos setObject:image forKey:[NSNumber numberWithInt:UID]];
			}
			else if ([type isEqualToString:@"logo"] &&
					 [subType isEqualToString:@"comp"]) {
				[competitionLogos setObject:image forKey:[NSNumber numberWithInt:UID]];
			}
			else if ([type isEqualToString:@"icon"] &&
					 [subType isEqualToString:@"comp"]) {
				[smallCompetitionLogos setObject:image forKey:[NSNumber numberWithInt:UID]];
			}
			else if ([type isEqualToString:@"logo/huge"] &&
					 [subType isEqualToString:@"nation"]) {
				[hugeNationLogos setObject:image forKey:[NSNumber numberWithInt:UID]];
			}
			else if ([type isEqualToString:@"logo"] &&
					 [subType isEqualToString:@"nation"]) {
				[nationLogos setObject:image forKey:[NSNumber numberWithInt:UID]];
			}
			else if ([type isEqualToString:@"icon"] &&
					 [subType isEqualToString:@"nation"]) {
				[smallNationLogos setObject:image forKey:[NSNumber numberWithInt:UID]];
			}
			else if ([type isEqualToString:@"flag"] &&
					 [subType isEqualToString:@"nation"]) {
				[nationFlags setObject:image forKey:[NSNumber numberWithInt:UID]];
			}
			else if ([type isEqualToString:@"logo/huge"] &&
					 [subType isEqualToString:@"continent"]) {
				[hugeContinentLogos setObject:image forKey:[NSNumber numberWithInt:UID]];
			}
			else if ([type isEqualToString:@"logo"] &&
					 [subType isEqualToString:@"continent"]) {
				[continentLogos setObject:image forKey:[NSNumber numberWithInt:UID]];
			}
			else if ([type isEqualToString:@"icon"] &&
					 [subType isEqualToString:@"continent"]) {
				[smallContinentLogos setObject:image forKey:[NSNumber numberWithInt:UID]];
			}
			else if ([type isEqualToString:@"portrait"] &&
					 [subType isEqualToString:@"person"]) {
				[personPhotos setObject:image forKey:[NSNumber numberWithInt:UID]];
			}
			else if ([type isEqualToString:@"icon"] &&
					 [subType isEqualToString:@"person"]) {
				[smallPersonPhotos setObject:image forKey:[NSNumber numberWithInt:UID]];
			}
			
			[type release];
			[subType release];
			[filePath release];
			[pathComponents release];
		}
	}
}

@end
