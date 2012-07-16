//
//  Database.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/24.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Database.h"
#import "GameVersions.h"
#import "Loader.h"
#import "AlliterationLoader.h"
#import "AlliterationSaver.h"
#import "AgreementLoader.h"
#import "AgreementSaver.h"
#import "AwardLoader.h"
#import "AwardSaver.h"
#import "CityLoader.h"
#import "CitySaver.h"
#import "ClubLoader.h"
#import "ClubSaver.h"
#import "ClubLinkLoader.h"
#import "ClubLinkSaver.h"
#import "CompetitionLoader.h"
#import "CompetitionSaver.h"
#import "CompetitionHistoryLoader.h"
#import "CompetitionHistorySaver.h"
#import "ContinentLoader.h"
#import "ContinentSaver.h"
#import "CurrencyLoader.h"
#import "CurrencySaver.h"
#import "DerbyLoader.h"
#import "DerbySaver.h"
#import "DescriptionLoader.h"
#import "DescriptionSaver.h"
#import "GeneralInfoLoader.h"
#import "InjuryLoader.h"
#import "InjurySaver.h"
#import	"LangDBLoader.h"
#import "LanguageLoader.h"
#import "LanguageSaver.h"
#import "LocalAreaLoader.h"
#import "LocalAreaSaver.h"
#import "MediaLoader.h"
#import "MediaSaver.h"
#import "NameLoader.h"
#import "NameSaver.h"
#import "NationLoader.h"
#import "NationSaver.h"
#import "PersonLoader.h"
#import "PersonSaver.h"
#import "PersonStatsLoader.h"
#import "PersonStatsSaver.h"
#import "PlayerStatsLoader.h"
#import "PlayerStatsSaver.h"
#import "NonPlayerStatsLoader.h"
#import "NonPlayerStatsSaver.h"
#import "SponsorLoader.h"
#import "SponsorSaver.h"
#import "FootballStadiumLoader.h"
#import "FootballStadiumSaver.h"
#import "StadiumChangeLoader.h"
#import "StadiumChangeSaver.h"
#import "StageNameLoader.h"
#import "StageNameSaver.h"
#import "TeamLoader.h"
#import "TeamSaver.h"
#import "Unknown7Loader.h"
#import "Unknown7Saver.h"
#import "WeatherLoader.h"
#import "WeatherSaver.h"
#import "Person.h"

@implementation Database

@synthesize goodAlliterations, badAlliterations, awards, cities, langDB, currentRecord, 
totalRecords, status, clubs, graphics, media, languages, currencies, continents,
injuries, firstNames, surnames, commonNames, sponsors, stadiums, stadiumChanges,
teams, localAreas, stageNames, weather, descriptions, people, personStats, playerStats,
nonPlayerStats, competitions, nations, controller, langDBLoaded, competitionHistories,
clubLinks, saveEndOffset, unknowns1, derbies, agreements, databaseChanges, unknownData1,
unknownData2, unknownData3, unknownData4, unknownData5, unknownData6, unknownData7,
unknownInt1, unknownInt2, unknownInt3, unknownInt4;

- (id)init
{
	[super init];
	
	[self setCurrentRecord:0];
	[self setTotalRecords:1];
	
	graphics = [[SXImageXMLParser alloc] init];
	firstNames = [[NSMutableArray alloc] init];
	surnames = [[NSMutableArray alloc] init];
	commonNames = [[NSMutableArray alloc] init];

	return self;
}

- (void)dealloc
{
	[graphics release];
	[firstNames release];
	[surnames release];
	[commonNames release];
	
	[super dealloc];
}

- (id)readGameDB:(NSData *)data atOffset:(unsigned int *)byteOffset
{
	NSAutoreleasePool *pool;
	NSMutableArray *tempArray = [[NSMutableArray alloc] init];
	
	unsigned int i, count, startingOffset;
	
#pragma mark Alliterations
	pool = [[NSAutoreleasePool alloc] init];
	[self setStatus:NSLocalizedString(@"loading good alliterations...", @"editor status")];
	[data getBytes:&count range:NSMakeRange(*byteOffset, 4)]; *byteOffset += 4;
	[self setTotalRecords:count];
	for (i=0; i<count; i++) {
		startingOffset = *byteOffset;
		[self setCurrentRecord:(i+1)];
		id object = [Loader readAlliterationFromData:data atOffset:byteOffset];
		if ([[object className] isEqualToString:@"Alliteration"]) {
			[tempArray addObject:object];
		}
		else { return [NSArray arrayWithObjects:
						@"Good Alliteration",
						[NSString stringWithFormat:@"%d",i],				// entity
						[NSString stringWithFormat:@"%d",startingOffset],	// entity start
						[NSString stringWithFormat:@"%@",object],			// entity error
						nil];			
		}
	}
	[self setGoodAlliterations:tempArray];
	[tempArray removeAllObjects];
	NSLog(@"End of %d good alliterations at %d",[goodAlliterations count],*byteOffset);

	[self setStatus:NSLocalizedString(@"loading bad alliterations...", @"editor status")];
	[self setCurrentRecord:0];
	[data getBytes:&count range:NSMakeRange(*byteOffset, 4)]; *byteOffset += 4;
	[self setTotalRecords:count];
	for (i=0; i<count; i++) {
		[self setCurrentRecord:(i+1)];
		id object = [Loader readAlliterationFromData:data atOffset:byteOffset];
		if ([[object className] isEqualToString:@"Alliteration"]) {
			[tempArray addObject:object];
		}
		else { return [NSArray arrayWithObjects:
					   @"Bad Alliteration",
					   [NSString stringWithFormat:@"%d",i],				// entity
					   [NSString stringWithFormat:@"%d",startingOffset],	// entity start
					   [NSString stringWithFormat:@"%@",object],			// entity error
					   nil]; }
	}
	[self setBadAlliterations:tempArray];
	[tempArray removeAllObjects];
	NSLog(@"End of %d bad alliterations at %d",[badAlliterations count],*byteOffset);
	[pool drain];
	
	// 0x01 ???
	*byteOffset += 1;
	
#pragma mark Awards
	pool = [[NSAutoreleasePool alloc] init];
	[self setStatus:NSLocalizedString(@"loading awards...", @"editor status")];
	[self setCurrentRecord:0];
	[data getBytes:&count range:NSMakeRange(*byteOffset, 4)]; *byteOffset += 4;
	[self setTotalRecords:count];
    
    if ([controller gameDBVersion] >= FM2012_12_1) {
        // 0x01 ???
        *byteOffset += 1;
    }
    
	for (i=0; i<count; i++) {
		[self setCurrentRecord:(i+1)];
		id object = [Loader readAwardFromData:data atOffset:byteOffset];
		if (![[object className] isEqualToString:@"Award"]) {
			return [NSArray arrayWithObjects:
					@"Award",
					[NSString stringWithFormat:@"%d",i],				// entity
					[NSString stringWithFormat:@"%d",startingOffset],	// entity start
					[NSString stringWithFormat:@"%@",object],			// entity error
					nil]; 
		}
		else if ([object rowID]!=i) {
			return [NSArray arrayWithObjects:
					@"Award",
					[NSString stringWithFormat:@"%d",i],				// entity
					[NSString stringWithFormat:@"%d",startingOffset],	// entity start
					@"Invalid ID",										// entity error
					nil]; 
		}
		else { 
			[object setController:controller];
			[tempArray addObject:object]; 
		}
//		NSLog(@"Award %d (%d) done at %d",i,[object UID],*byteOffset);
	}
	[self setAwards:tempArray];
	NSLog(@"End of %d awards at %d",[awards count],*byteOffset);

	NSThread *awardThread = [[NSThread alloc] initWithTarget:self selector:@selector(assignAwardNames:) object:nil];
	
	[tempArray removeAllObjects];
	[pool drain];
	[awardThread start];
	
#pragma mark Cities
    if ([controller gameDBVersion] >= FM2012_12_1) {
        // 0x05 ???
        *byteOffset += 5;
    }
    
	pool = [[NSAutoreleasePool alloc] init];
	[self setStatus:NSLocalizedString(@"loading cities...", @"editor status")];
	[self setCurrentRecord:0];
	[data getBytes:&count range:NSMakeRange(*byteOffset, 4)]; *byteOffset += 4;
	[self setTotalRecords:count];
    
    if ([controller gameDBVersion] >= FM2012_12_1) {
        // 0x01 ???
        *byteOffset += 1;
    }
    
	for (i=0; i<count; i++) {
		[self setCurrentRecord:(i+1)];
		id object = [Loader readCityFromData:data atOffset:byteOffset];
		if (![[object className] isEqualToString:@"City"]) {
			return [NSArray arrayWithObjects:
					@"City",
					[NSString stringWithFormat:@"%d",i],				// entity
					[NSString stringWithFormat:@"%d",startingOffset],	// entity start
					[NSString stringWithFormat:@"%@",object],			// entity error
					nil]; 
		}
		else if ([object rowID]!=i) {
			return [NSArray arrayWithObjects:
					@"City",
					[NSString stringWithFormat:@"%d",i],				// entity
					[NSString stringWithFormat:@"%d",startingOffset],	// entity start
					@"Invalid ID",										// entity error
					nil]; 
		}
		else { 
			if ([[NSUserDefaults standardUserDefaults] boolForKey:@"loadLangDB"]==TRUE) {
				id item = [[langDB cityLang] objectForKey:[NSNumber numberWithInt:[object UID]]];
				if (item!=nil) {
					[(City *)object setName:[item objectForKey:@"name"]];
				}
			}
			[tempArray addObject:object];
		}
	}
	[self setStatus:NSLocalizedString(@"assigning cities...", @"editor status")];
	[self setCities:tempArray];
	
	NSLog(@"End of %d cities at %d",[cities count],*byteOffset);
	
	[tempArray removeAllObjects];
	[pool drain];
	
#pragma mark Clubs
    if ([controller gameDBVersion] >= FM2012_12_1) {
        // 0x05 ???
        *byteOffset += 5;
    }
    
	pool = [[NSAutoreleasePool alloc] init];
	[self setStatus:NSLocalizedString(@"loading clubs...", @"editor status")];
	[self setCurrentRecord:0];
	[data getBytes:&count range:NSMakeRange(*byteOffset, 4)]; *byteOffset += 4;
	[self setTotalRecords:count];
    
    if ([controller gameDBVersion] >= FM2012_12_1) {
        // 0x01 ???
        *byteOffset += 1;
    }
    
	for (i=0; i<count; i++) {
		[self setCurrentRecord:(i+1)];
		id object = [Loader readClubFromData:data atOffset:byteOffset version:[controller gameDBVersion]];
		if (![[object className] isEqualToString:@"Club"]) {
			return [NSArray arrayWithObjects:
					@"Club",
					[NSString stringWithFormat:@"%d",i],				// entity
					[NSString stringWithFormat:@"%d",startingOffset],	// entity start
					[NSString stringWithFormat:@"%@",object],			// entity error
					nil]; 
		}
		else if ([object rowID]!=i) {
			return [NSArray arrayWithObjects:
					@"Club",
					[NSString stringWithFormat:@"%d",i],				// entity
					[NSString stringWithFormat:@"%d",startingOffset],	// entity start
					@"Invalid ID",										// entity error
					nil]; 
		}
		else { 
			[object setController:controller];
			[object setLogoPath:[[graphics clubLogos] objectForKey:[NSNumber numberWithInt:[object UID]]]];
			[[object teamContainer] setController:controller];
			[tempArray addObject:object];
		}
	}
	[self setStatus:NSLocalizedString(@"assigning clubs...", @"editor status")];
	[self setClubs:tempArray];
	
	NSLog(@"End of %d clubs at %d",[clubs count],*byteOffset);
	
	[tempArray removeAllObjects];
	[pool drain];
	
#pragma mark Competitions
    if ([controller gameDBVersion] >= FM2012_12_1) {
        // 0x05 ???
        *byteOffset += 5;
    }
	pool = [[NSAutoreleasePool alloc] init];
	[self setStatus:NSLocalizedString(@"loading competitions...", @"editor status")];
	[self setCurrentRecord:0];
	[data getBytes:&count range:NSMakeRange(*byteOffset, 4)]; *byteOffset += 4;
	[self setTotalRecords:count];
    
    if ([controller gameDBVersion] >= FM2012_12_1) {
        // 0x01 ???
        *byteOffset += 1;
    }
    
	for (i=0; i<count; i++) {
		[self setCurrentRecord:(i+1)];
		
		id object = [Loader readCompetitionFromData:data atOffset:byteOffset];
		if (![[object className] isEqualToString:@"Competition"]) {
			return [NSArray arrayWithObjects:
					@"Competition",
					[NSString stringWithFormat:@"%d",i],				// entity
					[NSString stringWithFormat:@"%d",startingOffset],	// entity start
					[NSString stringWithFormat:@"%@",object],			// entity error
					nil]; 
		}
		else if ([object rowID]!=i) {
			return [NSArray arrayWithObjects:
					@"Competition",
					[NSString stringWithFormat:@"%d",i],				// entity
					[NSString stringWithFormat:@"%d",startingOffset],	// entity start
					@"Invalid ID",										// entity error
					nil]; 
		}
		else { 
			if ([[NSUserDefaults standardUserDefaults] boolForKey:@"loadLangDB"]==TRUE) {
				id item = [[langDB compLang] objectForKey:[NSNumber numberWithInt:[object UID]]];
				if (item!=nil) {
					[object setController:controller];
					[(Competition *)object setName:[item objectForKey:@"name"]];
					[object setShortName:[item objectForKey:@"shortName"]];
					[object setThreeLetterName:[item objectForKey:@"threeLetterName"]];
				}
			}
			[tempArray addObject:object];
		}
		
	}
	[self setStatus:NSLocalizedString(@"assigning competitions...", @"editor status")];
	[self setCompetitions:tempArray];
	NSLog(@"End of %d competitions at %d",[competitions count],*byteOffset);
	
	[tempArray removeAllObjects];
	[pool drain];
	
#pragma mark Continents
    if ([controller gameDBVersion] >= FM2012_12_1) {
        // 0x05 ???
        *byteOffset += 5;
    }
	pool = [[NSAutoreleasePool alloc] init];
	[self setStatus:NSLocalizedString(@"loading continents...", @"editor status")];
	[self setCurrentRecord:0];
	[data getBytes:&count range:NSMakeRange(*byteOffset, 4)]; *byteOffset += 4;
	[self setTotalRecords:count];
    
    if ([controller gameDBVersion] >= FM2012_12_1) {
        // 0x01 ???
        *byteOffset += 1;
    }
    
	for (i=0; i<count; i++) {
		[self setCurrentRecord:(i+1)];
		
		id object = [Loader readContinentFromData:data atOffset:byteOffset];
		if (![[object className] isEqualToString:@"Continent"]) {
			return [NSArray arrayWithObjects:
					@"Continent",
					[NSString stringWithFormat:@"%d",i],				// entity
					[NSString stringWithFormat:@"%d",startingOffset],	// entity start
					[NSString stringWithFormat:@"%@",object],			// entity error
					nil]; 
		}
		else if ([object rowID]!=i) {
			return [NSArray arrayWithObjects:
					@"Continent",
					[NSString stringWithFormat:@"%d",i],				// entity
					[NSString stringWithFormat:@"%d",startingOffset],	// entity start
					@"Invalid ID",										// entity error
					nil]; 
		}
		else { [tempArray addObject:object]; }
	}
	[self setContinents:tempArray];
	NSLog(@"End of %d continents at %d",[continents count],*byteOffset);
	
	NSThread *continentThread = [[NSThread alloc] initWithTarget:self selector:@selector(assignContinentNames:) object:nil];
	
	[tempArray removeAllObjects];
	[pool drain];
	[continentThread start];
	
#pragma mark Currencies
    if ([controller gameDBVersion] >= FM2012_12_1) {
        // 0x05 ???
        *byteOffset += 5;
    }
	pool = [[NSAutoreleasePool alloc] init];
	[self setStatus:NSLocalizedString(@"loading currencies...", @"editor status")];
	[self setCurrentRecord:0];
	[data getBytes:&count range:NSMakeRange(*byteOffset, 4)]; *byteOffset += 4;
	[self setTotalRecords:count];
    
    if ([controller gameDBVersion] >= FM2012_12_1) {
        // 0x01 ???
        *byteOffset += 1;
    }
    
	for (i=0; i<count; i++) {
		[self setCurrentRecord:(i+1)];
		
		id object = [Loader readCurrencyFromData:data atOffset:byteOffset];
		if (![[object className] isEqualToString:@"Currency"]) {
			return [NSArray arrayWithObjects:
					@"Currency",
					[NSString stringWithFormat:@"%d",i],				// entity
					[NSString stringWithFormat:@"%d",startingOffset],	// entity start
					[NSString stringWithFormat:@"%@",object],			// entity error
					nil]; 
		}
		else if ([object rowID]!=i) {
			return [NSArray arrayWithObjects:
					@"Currency",
					[NSString stringWithFormat:@"%d",i],				// entity
					[NSString stringWithFormat:@"%d",startingOffset],	// entity start
					@"Invalid ID",										// entity error
					nil]; 
		}
		else { [tempArray addObject:object]; }
		
	}
	[self setCurrencies:tempArray];
	NSLog(@"End of %d currencies at %d",[currencies count],*byteOffset);
	
	[tempArray removeAllObjects];
	[pool drain];
	
#pragma mark Injuries
    if ([controller gameDBVersion] >= FM2012_12_1) {
        // 0x05 ???
        *byteOffset += 5;
    }
	pool = [[NSAutoreleasePool alloc] init];
	[self setStatus:NSLocalizedString(@"loading injuries...", @"editor status")];
	[self setCurrentRecord:0];
	[data getBytes:&count range:NSMakeRange(*byteOffset, 4)]; *byteOffset += 4;
	[self setTotalRecords:count];
    
    if ([controller gameDBVersion] >= FM2012_12_1) {
        // 0x01 ???
        *byteOffset += 1;
    }
    
	for (i=0; i<count; i++) {
		[self setCurrentRecord:(i+1)];
		
		id object = [Loader readInjuryFromData:data atOffset:byteOffset];
		if (![[object className] isEqualToString:@"Injury"]) {
			return [NSArray arrayWithObjects:
					@"Injury",
					[NSString stringWithFormat:@"%d",i],				// entity
					[NSString stringWithFormat:@"%d",startingOffset],	// entity start
					[NSString stringWithFormat:@"%@",object],			// entity error
					nil]; 
		}
		else if ([object rowID]!=i) {
			return [NSArray arrayWithObjects:
					@"Injury",
					[NSString stringWithFormat:@"%d",i],				// entity
					[NSString stringWithFormat:@"%d",startingOffset],	// entity start
					@"Invalid ID",										// entity error
					nil]; 
		}
		else { [tempArray addObject:object]; }
		
	}
	[self setInjuries:tempArray];
	NSLog(@"End of %d injuries at %d",[injuries count],*byteOffset);
	
	NSThread *injuryThread = [[NSThread alloc] initWithTarget:self selector:@selector(assignInjuryNames:) object:nil];
	
	[tempArray removeAllObjects];
	[pool drain];
	[injuryThread start];
	
#pragma mark Media
    if ([controller gameDBVersion] >= FM2012_12_1) {
        // 0x05 ???
        *byteOffset += 5;
    }
	pool = [[NSAutoreleasePool alloc] init];
	[self setStatus:NSLocalizedString(@"loading media...", @"editor status")];
	[self setCurrentRecord:0];
	[data getBytes:&count range:NSMakeRange(*byteOffset, 4)]; *byteOffset += 4;
	[self setTotalRecords:count];
    if ([controller gameDBVersion] >= FM2012_12_1) {
        // 0x01 ???
        *byteOffset += 1;
    }
	for (i=0; i<count; i++) {
		[self setCurrentRecord:(i+1)];
		
		id object = [Loader readMediaFromData:data atOffset:byteOffset];
		if (![[object className] isEqualToString:@"Media"]) {
			return [NSArray arrayWithObjects:
					@"Media",
					[NSString stringWithFormat:@"%d",i],				// entity
					[NSString stringWithFormat:@"%d",startingOffset],	// entity start
					[NSString stringWithFormat:@"%@",object],			// entity error
					nil]; 
		}
		else if ([object rowID]!=i) {
			return [NSArray arrayWithObjects:
					@"Media",
					[NSString stringWithFormat:@"%d",i],				// entity
					[NSString stringWithFormat:@"%d",startingOffset],	// entity start
					@"Invalid ID",										// entity error
					nil]; 
		}
		else { [tempArray addObject:object]; }
	}
	[self setMedia:tempArray];
	NSLog(@"End of %d media at %d",[media count],*byteOffset);
	
	[tempArray removeAllObjects];
	[pool release];
	
#pragma mark Languages
    if ([controller gameDBVersion] >= FM2012_12_1) {
        // 0x05 ???
        *byteOffset += 5;
    }
	pool = [[NSAutoreleasePool alloc] init];
	[self setStatus:NSLocalizedString(@"loading languages...", @"editor status")];
	[self setCurrentRecord:0];
	[data getBytes:&count range:NSMakeRange(*byteOffset, 4)]; *byteOffset += 4;
	[self setTotalRecords:count];
    if ([controller gameDBVersion] >= FM2012_12_1) {
        // 0x01 ???
        *byteOffset += 1;
    }
	for (i=0; i<count; i++) {
		[self setCurrentRecord:(i+1)];
		
		id object = [Loader readLanguageFromData:data atOffset:byteOffset];
		if (![[object className] isEqualToString:@"Language"]) {
			return [NSArray arrayWithObjects:
					@"Language",
					[NSString stringWithFormat:@"%d",i],				// entity
					[NSString stringWithFormat:@"%d",startingOffset],	// entity start
					[NSString stringWithFormat:@"%@",object],			// entity error
					nil]; 
		}
		else if ([object rowID]!=i) {
			return [NSArray arrayWithObjects:
					@"Language",
					[NSString stringWithFormat:@"%d",i],				// entity
					[NSString stringWithFormat:@"%d",startingOffset],	// entity start
					@"Invalid ID",										// entity error
					nil]; 
		}
		else { [tempArray addObject:object]; }
	
	}
	[self setLanguages:tempArray];
	NSLog(@"End of %d languages at %d",[languages count],*byteOffset);
	
	[tempArray removeAllObjects];
	[pool release];
	
#pragma mark Nations
    if ([controller gameDBVersion] >= FM2012_12_1) {
        // 0x05 ???
        *byteOffset += 5;
    }
	pool = [[NSAutoreleasePool alloc] init];
	[self setStatus:NSLocalizedString(@"loading nations...", @"editor status")];
	[self setCurrentRecord:0];
	[data getBytes:&count range:NSMakeRange(*byteOffset, 4)]; *byteOffset += 4;
	[self setTotalRecords:count];
    
    if ([controller gameDBVersion] >= FM2012_12_1) {
        // 0x01 ???
        *byteOffset += 1;
    }
    
	for (i=0; i<count; i++) {
		[self setCurrentRecord:(i+1)];
		id object = [Loader readNationFromData:data atOffset:byteOffset version:[controller gameDBVersion]];
		if (![[object className] isEqualToString:@"Nation"]) {
			return [NSArray arrayWithObjects:
					@"Nation",
					[NSString stringWithFormat:@"%d",i],				// entity
					[NSString stringWithFormat:@"%d",startingOffset],	// entity start
					[NSString stringWithFormat:@"%@",object],			// entity error
					nil]; 
		}
		else if ([object rowID]!=i) {
			return [NSArray arrayWithObjects:
					@"Nation",
					[NSString stringWithFormat:@"%d",i],				// entity
					[NSString stringWithFormat:@"%d",startingOffset],	// entity start
					@"Invalid ID",										// entity error
					nil]; 
		}
		else { 
			[object setController:controller];
			[[object teamContainer] setController:controller];
			[tempArray addObject:object];
		}
	}
	[self setNations:tempArray];
	NSLog(@"End of %d nations at %d",[nations count],*byteOffset);
	
	[tempArray removeAllObjects];
	[pool release];
	
#pragma mark First Names
	if ([controller gameDBVersion] >= FM2012_12_1) {
        // 0x05 ???
        *byteOffset += 5;
    }
	pool = [[NSAutoreleasePool alloc] init];
	[self setStatus:NSLocalizedString(@"loading first names...", @"editor status")];
	[self setCurrentRecord:0];
	[data getBytes:&count range:NSMakeRange(*byteOffset, 4)]; *byteOffset += 4;
	[self setTotalRecords:count];
    
    if ([controller gameDBVersion] >= FM2012_12_1) {
        // 0x01 ???
        *byteOffset += 1;
    }
    
	for (i=0; i<count; i++) {
		[self setCurrentRecord:(i+1)];
		
		id object = [Loader readNameFromData:data atOffset:byteOffset];
		if (![[object className] isEqualToString:@"Name"]) {
			return [NSArray arrayWithObjects:
					@"First Name",
					[NSString stringWithFormat:@"%d",i],				// entity
					[NSString stringWithFormat:@"%d",startingOffset],	// entity start
					[NSString stringWithFormat:@"%@",object],			// entity error
					nil]; 
		}
		else if ([object rowID]!=i) {
			return [NSArray arrayWithObjects:
					@"First Name",
					[NSString stringWithFormat:@"%d",i],				// entity
					[NSString stringWithFormat:@"%d",startingOffset],	// entity start
					@"Invalid ID",										// entity error
					nil]; 
		}
		else { [firstNames addObject:object]; }
		
	}
	NSLog(@"End of %d first names at %d",[firstNames count],*byteOffset);	
	[pool drain];
		
#pragma mark Surnames
	pool = [[NSAutoreleasePool alloc] init];
	[self setStatus:NSLocalizedString(@"loading surnames...", @"editor status")];
	[self setCurrentRecord:0];
	[data getBytes:&count range:NSMakeRange(*byteOffset, 4)]; *byteOffset += 4;
	[self setTotalRecords:count];
	for (i=0; i<count; i++) {
		[self setCurrentRecord:(i+1)];
		
		id object = [Loader readNameFromData:data atOffset:byteOffset];
		if (![[object className] isEqualToString:@"Name"]) {
			return [NSArray arrayWithObjects:
					@"Surname",
					[NSString stringWithFormat:@"%d",i],				// entity
					[NSString stringWithFormat:@"%d",startingOffset],	// entity start
					[NSString stringWithFormat:@"%@",object],			// entity error
					nil]; 
		}
		else if ([object rowID]!=i) {
			return [NSArray arrayWithObjects:
					@"Surname",
					[NSString stringWithFormat:@"%d",i],				// entity
					[NSString stringWithFormat:@"%d",startingOffset],	// entity start
					@"Invalid ID",										// entity error
					nil]; 
		}
		else { [surnames addObject:object]; }
	}
	NSLog(@"End of %d surnames at %d",[surnames count],*byteOffset);
	
	[pool drain];
	
#pragma mark Common Names
	pool = [[NSAutoreleasePool alloc] init];
	[self setStatus:NSLocalizedString(@"loading common names...", @"editor status")];
	[self setCurrentRecord:0];
	[data getBytes:&count range:NSMakeRange(*byteOffset, 4)]; *byteOffset += 4;
	[self setTotalRecords:count];
	for (i=0; i<count; i++) {
		[self setCurrentRecord:(i+1)];
		
		id object = [Loader readNameFromData:data atOffset:byteOffset];
		if (![[object className] isEqualToString:@"Name"]) {
			return [NSArray arrayWithObjects:
					@"Common Name",
					[NSString stringWithFormat:@"%d",i],				// entity
					[NSString stringWithFormat:@"%d",startingOffset],	// entity start
					[NSString stringWithFormat:@"%@",object],			// entity error
					nil]; 
		}
		else if ([object rowID]!=i) {
			return [NSArray arrayWithObjects:
					@"Common Name",
					[NSString stringWithFormat:@"%d",i],				// entity
					[NSString stringWithFormat:@"%d",startingOffset],	// entity start
					@"Invalid ID",										// entity error
					nil]; 
		}
		else { [commonNames addObject:object]; }
	}
	NSLog(@"End of %d common names at %d",[commonNames count],*byteOffset);	
	
	[pool drain];
	
#pragma mark Unknowns 1
	pool = [[NSAutoreleasePool alloc] init];
	[self setStatus:NSLocalizedString(@"loading unknowns 1...", @"editor status")];
	[self setCurrentRecord:0];
	[data getBytes:&count range:NSMakeRange(*byteOffset, 4)]; *byteOffset += 4;
	[self setTotalRecords:count];
	for (i=0; i<count; i++) {
		[self setCurrentRecord:(i+1)];
		
		id object = [Loader readUnknown7FromData:data atOffset:byteOffset];
		if (![[object className] isEqualToString:@"Unknown7"]) {
			return [NSArray arrayWithObjects:
					@"Unknown 1",
					[NSString stringWithFormat:@"%d",i],				// entity
					[NSString stringWithFormat:@"%d",startingOffset],	// entity start
					[NSString stringWithFormat:@"%@",object],			// entity error
					nil]; 
		}
		else if ([object rowID]!=i) {
			return [NSArray arrayWithObjects:
					@"Unknown 1",
					[NSString stringWithFormat:@"%d",i],				// entity
					[NSString stringWithFormat:@"%d",startingOffset],	// entity start
					@"Invalid ID",										// entity error
					nil]; 
		}
		else { [tempArray addObject:object]; }
	}
	[self setUnknowns1:tempArray];
	NSLog(@"End of %d unknowns 1 at %d", count, *byteOffset);
	
	[tempArray removeAllObjects];
	[pool drain];
	
#pragma mark Local Areas
	pool = [[NSAutoreleasePool alloc] init];
	[self setStatus:NSLocalizedString(@"loading local areas...", @"editor status")];
	[self setCurrentRecord:0];
	[data getBytes:&count range:NSMakeRange(*byteOffset, 4)]; *byteOffset += 4;
	[self setTotalRecords:count];
	for (i=0; i<count; i++) {
		[self setCurrentRecord:(i+1)];
		
		id object = [Loader readLocalAreaFromData:data atOffset:byteOffset];
		if (![[object className] isEqualToString:@"LocalArea"]) {
			return [NSArray arrayWithObjects:
					@"Local Area",
					[NSString stringWithFormat:@"%d",i],				// entity
					[NSString stringWithFormat:@"%d",startingOffset],	// entity start
					[NSString stringWithFormat:@"%@",object],			// entity error
					nil]; 
		}
		else if ([object rowID]!=i) {
			return [NSArray arrayWithObjects:
					@"Local Area",
					[NSString stringWithFormat:@"%d",i],				// entity
					[NSString stringWithFormat:@"%d",startingOffset],	// entity start
					@"Invalid ID",										// entity error
					nil]; 
		}
		else { 
			if ([[NSUserDefaults standardUserDefaults] boolForKey:@"loadLangDB"]==TRUE) {
				id item = [[langDB localAreaLang] objectForKey:[NSNumber numberWithInt:[object UID]]];
				if (item!=nil) {
					[(LocalArea *)object setName:[item objectForKey:@"name"]];
					[object setShortName:[item objectForKey:@"shortName"]];
				}
			}
			[tempArray addObject:object];
		}
	}
	[self setLocalAreas:tempArray];
	NSLog(@"End of %d local areas at %d",[localAreas count],*byteOffset);	
	
	[tempArray removeAllObjects];
	[pool drain];
	
#pragma mark Sponsors
	pool = [[NSAutoreleasePool alloc] init];
	[self setStatus:NSLocalizedString(@"loading sponsors...", @"editor status")];
	[self setCurrentRecord:0];
	[data getBytes:&count range:NSMakeRange(*byteOffset, 4)]; *byteOffset += 4;
	[self setTotalRecords:count];
	for (i=0; i<count; i++) {
		[self setCurrentRecord:(i+1)];
		
		id object = [Loader readSponsorFromData:data atOffset:byteOffset];
		if (![[object className] isEqualToString:@"Sponsor"]) {
			return [NSArray arrayWithObjects:
					@"Sponsor",
					[NSString stringWithFormat:@"%d",i],				// entity
					[NSString stringWithFormat:@"%d",startingOffset],	// entity start
					[NSString stringWithFormat:@"%@",object],			// entity error
					nil]; 
		}
		else if ([object rowID]!=i) {
			return [NSArray arrayWithObjects:
					@"Sponsor",
					[NSString stringWithFormat:@"%d",i],				// entity
					[NSString stringWithFormat:@"%d",startingOffset],	// entity start
					@"Invalid ID",										// entity error
					nil]; 
		}
		else { [tempArray addObject:object]; }
	}
	[self setSponsors:tempArray];
	NSLog(@"End of %d sponsors at %d",[sponsors count],*byteOffset);
	
	[tempArray removeAllObjects];
	[pool drain];
	
#pragma mark Stadiums
	pool = [[NSAutoreleasePool alloc] init];
	[self setStatus:NSLocalizedString(@"loading stadiums...", @"editor status")];
	[self setCurrentRecord:0];
	[data getBytes:&count range:NSMakeRange(*byteOffset, 4)]; *byteOffset += 4;
	[self setTotalRecords:count];
	for (i=0; i<count; i++) {
		[self setCurrentRecord:(i+1)];
		
		id object = [Loader readStadiumFromData:data atOffset:byteOffset];
		if (![[object className] isEqualToString:@"Stadium"]) {
			return [NSArray arrayWithObjects:
					@"Stadium",
					[NSString stringWithFormat:@"%d",i],				// entity
					[NSString stringWithFormat:@"%d",startingOffset],	// entity start
					[NSString stringWithFormat:@"%@",object],			// entity error
					nil]; 
		}
		else if ([object rowID]!=i) {
			return [NSArray arrayWithObjects:
					@"Stadium",
					[NSString stringWithFormat:@"%d",i],				// entity
					[NSString stringWithFormat:@"%d",startingOffset],	// entity start
					@"Invalid ID",										// entity error
					nil]; 
		}
		else { 
			if ([[NSUserDefaults standardUserDefaults] boolForKey:@"loadLangDB"]==TRUE) {
				id item = [[langDB stadiumLang] objectForKey:[NSNumber numberWithInt:[object UID]]];
				if (item!=nil) {
					[(Stadium *)object setName:[item objectForKey:@"name"]];
				}
			}
			[tempArray addObject:object];
		}
	}
	[self setStatus:NSLocalizedString(@"assigning stadiums...", @"editor status")];
	[self setStadiums:tempArray];
	NSLog(@"End of %d stadiums at %d",[stadiums count],*byteOffset);
	
	[tempArray removeAllObjects];
	[pool drain];
	
#pragma mark Stadium Changes
	pool = [[NSAutoreleasePool alloc] init];
	[self setStatus:NSLocalizedString(@"loading stadium changes...", @"editor status")];
	[self setCurrentRecord:0];
	[data getBytes:&count range:NSMakeRange(*byteOffset, 4)]; *byteOffset += 4;
	[self setTotalRecords:count];
	for (i=0; i<count; i++) {
		[self setCurrentRecord:(i+1)];
		
		id object = [Loader readStadiumChangeFromData:data atOffset:byteOffset];
		if (![[object className] isEqualToString:@"StadiumChange"]) {
			return [NSArray arrayWithObjects:
					@"Stadium Change",
					[NSString stringWithFormat:@"%d",i],				// entity
					[NSString stringWithFormat:@"%d",startingOffset],	// entity start
					[NSString stringWithFormat:@"%@",object],			// entity error
					nil]; 
		}
//		else if ([object rowID]!=i) {
//			NSLog(@"%d",[object rowID]);
//			return [NSArray arrayWithObjects:
//					@"Stadium Change",
//					[NSString stringWithFormat:@"%d",i],				// entity
//					[NSString stringWithFormat:@"%d",startingOffset],	// entity start
//					@"Invalid ID",										// entity error
//					nil]; 
//		}
		else { [tempArray addObject:object]; }
	}
	[self setStatus:NSLocalizedString(@"assigning stadium changes...", @"editor status")];
	[self setStadiumChanges:tempArray];
	NSLog(@"End of %d stadium changes at %d",[stadiumChanges count],*byteOffset);	
	
	[tempArray removeAllObjects];
	[pool drain];
	
#pragma mark Stage Names
	pool = [[NSAutoreleasePool alloc] init];
	[self setStatus:NSLocalizedString(@"loading stage names...", @"editor status")];
	[self setCurrentRecord:0];
	[data getBytes:&count range:NSMakeRange(*byteOffset, 4)]; *byteOffset += 4;
	[self setTotalRecords:count];
	for (i=0; i<count; i++) {
		[self setCurrentRecord:(i+1)];
		
		id object = [Loader readStageNameFromData:data atOffset:byteOffset];
		if (![[object className] isEqualToString:@"StageName"]) {
			return [NSArray arrayWithObjects:
					@"Stage Name",
					[NSString stringWithFormat:@"%d",i],				// entity
					[NSString stringWithFormat:@"%d",startingOffset],	// entity start
					[NSString stringWithFormat:@"%@",object],			// entity error
					nil]; 
		}
		else if ([object rowID]!=i) {
			return [NSArray arrayWithObjects:
					@"Stage Name",
					[NSString stringWithFormat:@"%d",i],				// entity
					[NSString stringWithFormat:@"%d",startingOffset],	// entity start
					@"Invalid ID",										// entity error
					nil]; 
		}
		else { [tempArray addObject:object]; }
	}
	[self setStageNames:tempArray];
	NSLog(@"End of %d stage names at %d",[stageNames count],*byteOffset);	
	
	NSThread *stageNameThread = [[NSThread alloc] initWithTarget:self selector:@selector(assignStageNames:) object:nil];
	
	[tempArray removeAllObjects];
	[pool drain];
	[stageNameThread start];
	
#pragma mark Teams
	pool = [[NSAutoreleasePool alloc] init];
	[self setStatus:NSLocalizedString(@"loading teams...", @"editor status")];
	[self setCurrentRecord:0];
	[data getBytes:&count range:NSMakeRange(*byteOffset, 4)]; *byteOffset += 4;
	[self setTotalRecords:count];
	for (i=0; i<count; i++) {
		[self setCurrentRecord:(i+1)];
		
		id object = [Loader readTeamFromData:data atOffset:byteOffset version:[controller gameDBVersion]];
		if (![[object className] isEqualToString:@"Team"]) {
			return [NSArray arrayWithObjects:
					@"Team",
					[NSString stringWithFormat:@"%d",i],				// entity
					[NSString stringWithFormat:@"%d",startingOffset],	// entity start
					[NSString stringWithFormat:@"%@",object],			// entity error
					nil]; 
		}
		else if ([object rowID]!=i) {
			return [NSArray arrayWithObjects:
					@"Team",
					[NSString stringWithFormat:@"%d",i],				// entity
					[NSString stringWithFormat:@"%d",startingOffset],	// entity start
					@"Invalid ID",										// entity error
					nil]; 
		}
		else { 
			[object setController:controller];
			[tempArray addObject:object];
		}
	}
	[self setTeams:tempArray];
	NSLog(@"End of %d teams at %d",[teams count],*byteOffset);
	
	[tempArray removeAllObjects];
	[pool drain];
	
#pragma mark Weather
	pool = [[NSAutoreleasePool alloc] init];
	[self setStatus:NSLocalizedString(@"loading weather...", @"editor status")];
	[self setCurrentRecord:0];
	[data getBytes:&count range:NSMakeRange(*byteOffset, 4)]; *byteOffset += 4;
	[self setTotalRecords:count];
	for (i=0; i<count; i++) {
		[self setCurrentRecord:(i+1)];
		
		id object = [Loader readWeatherFromData:data atOffset:byteOffset];
		if (![[object className] isEqualToString:@"Weather"]) {
			return [NSArray arrayWithObjects:
					@"Weather",
					[NSString stringWithFormat:@"%d",i],				// entity
					[NSString stringWithFormat:@"%d",startingOffset],	// entity start
					[NSString stringWithFormat:@"%@",object],			// entity error
					nil]; 
		}
		else if ([object rowID]!=i) {
			return [NSArray arrayWithObjects:
					@"Weather",
					[NSString stringWithFormat:@"%d",i],				// entity
					[NSString stringWithFormat:@"%d",startingOffset],	// entity start
					@"Invalid ID",										// entity error
					nil]; 
		}
		else { [tempArray addObject:object]; }
	}
	[self setWeather:tempArray];
	NSLog(@"End of %d weather at %d",[weather count],*byteOffset);
	
	[tempArray removeAllObjects];
	[pool drain];
	
#pragma mark Descriptions
	pool = [[NSAutoreleasePool alloc] init];
	[self setStatus:NSLocalizedString(@"loading descriptions...", @"editor status")];
	[self setCurrentRecord:0];
	[data getBytes:&count range:NSMakeRange(*byteOffset, 4)]; *byteOffset += 4;
	for (i=0; i<count; i++) {
		[self setCurrentRecord:(i+1)];
		id object = [Loader readDescriptionFromData:data atOffset:byteOffset];
		if (![[object className] isEqualToString:@"Description"]) {
			return [NSArray arrayWithObjects:
					@"Description",
					[NSString stringWithFormat:@"%d",i],				// entity
					[NSString stringWithFormat:@"%d",startingOffset],	// entity start
					[NSString stringWithFormat:@"%@",object],			// entity error
					nil]; 
		}
		else if ([object rowID]!=i) {
			return [NSArray arrayWithObjects:
					@"Description",
					[NSString stringWithFormat:@"%d",i],				// entity
					[NSString stringWithFormat:@"%d",startingOffset],	// entity start
					@"Invalid ID",										// entity error
					nil]; 
		}
		else { [tempArray addObject:object]; }
	}
	[self setDescriptions:tempArray];
	NSLog(@"End of %d descriptions at %d",[descriptions count],*byteOffset);	
	
	NSThread *descriptionThread = [[NSThread alloc] initWithTarget:self selector:@selector(assignDescriptionNames:) object:nil];
	
	[tempArray removeAllObjects];
	[pool drain];
	[descriptionThread start];
	
#pragma mark Derbies
	pool = [[NSAutoreleasePool alloc] init];
	[self setStatus:NSLocalizedString(@"loading derbies...", @"editor status")];
	[self setCurrentRecord:0];
	[data getBytes:&count range:NSMakeRange(*byteOffset, 4)]; *byteOffset += 4;
	for (i=0; i<count; i++) {
		[self setCurrentRecord:(i+1)];
		id object = [Loader readDerbyFromData:data atOffset:byteOffset];
		if (![[object className] isEqualToString:@"Derby"]) {
			return [NSArray arrayWithObjects:
					@"Derby",
					[NSString stringWithFormat:@"%d",i],				// entity
					[NSString stringWithFormat:@"%d",startingOffset],	// entity start
					[NSString stringWithFormat:@"%@",object],			// entity error
					nil]; 
		}
		else if ([object rowID]!=i) {
			return [NSArray arrayWithObjects:
					@"Derby",
					[NSString stringWithFormat:@"%d",i],				// entity
					[NSString stringWithFormat:@"%d",startingOffset],	// entity start
					@"Invalid ID",										// entity error
					nil]; 
		}
		else { [tempArray addObject:object]; }
	}
	[self setDerbies:tempArray];
	NSLog(@"End of %d derbies at %d",[derbies count],*byteOffset);	
	
	[tempArray removeAllObjects];
	[pool drain];

#pragma mark Agreements
	pool = [[NSAutoreleasePool alloc] init];
	[self setStatus:NSLocalizedString(@"loading agreements...", @"editor status")];
	[self setCurrentRecord:0];
	[data getBytes:&count range:NSMakeRange(*byteOffset, 4)]; *byteOffset += 4;
	for (i=0; i<count; i++) {
		[self setCurrentRecord:(i+1)];
		id object = [Loader readAgreementFromData:data atOffset:byteOffset];
		if (![[object className] isEqualToString:@"Agreement"]) {
			return [NSArray arrayWithObjects:
					@"Agreement",
					[NSString stringWithFormat:@"%d",i],				// entity
					[NSString stringWithFormat:@"%d",startingOffset],	// entity start
					[NSString stringWithFormat:@"%@",object],			// entity error
					nil]; 
		}
		else if ([object rowID]!=i) {
			return [NSArray arrayWithObjects:
					@"Agreement",
					[NSString stringWithFormat:@"%d",i],				// entity
					[NSString stringWithFormat:@"%d",startingOffset],	// entity start
					@"Invalid ID",										// entity error
					nil]; 
		}
		else { 
			if ([[NSUserDefaults standardUserDefaults] boolForKey:@"loadLangDB"]==TRUE) {
				id item = [[langDB agreementLang] objectForKey:[NSNumber numberWithInt:[object UID]]];
				if (item!=nil) {
					[(Agreement *)object setName:[item objectForKey:@"name"]];
					[object setShortName:[item objectForKey:@"shortName"]];
					[object setAlternativeName:[item objectForKey:@"alternativeName"]];
					[object setAlternativeShortName:[item objectForKey:@"alternativeShortName"]];
				}
			}
			[tempArray addObject:object]; 
		}
	}
	[self setAgreements:tempArray];
	NSLog(@"End of %d agreements at %d",[agreements count],*byteOffset);	
	
	[tempArray removeAllObjects];
	[pool drain];
	
	
#pragma mark People
	pool = [[NSAutoreleasePool alloc] init];
	[self setStatus:NSLocalizedString(@"loading people...", @"editor status")];
	[self setCurrentRecord:0];
	[data getBytes:&count range:NSMakeRange(*byteOffset, 4)]; *byteOffset += 4;
	NSLog(@"%d people",count);
	[self setTotalRecords:count];
	
	for (i=0; i<count; i++) {
		[self setCurrentRecord:(i+1)];
		
		//NSLog(@"Will read from address: %d", *byteOffset);
		id object = [Loader readPersonFromData:data atOffset:byteOffset version:[controller gameDBVersion]];
		if (![[object className] isEqualToString:@"Person"]) {
			return [NSArray arrayWithObjects:
					@"Person",
					[NSString stringWithFormat:@"%d",i],				// entity
					[NSString stringWithFormat:@"%d",startingOffset],	// entity start
					[NSString stringWithFormat:@"%@",object],			// entity error
					nil]; 
		}
		else if ([object rowID]!=i) {
			return [NSArray arrayWithObjects:
					@"Person",
					[NSString stringWithFormat:@"%d",i],				// entity
					[NSString stringWithFormat:@"%d",startingOffset],	// entity start
					@"Invalid ID",										// entity error
					nil]; 
		}
		else { 
			[object setController:controller];
			[tempArray addObject:object]; 
		}
		// NSLog(@"person %d - %d at %d ( %@ )",i,[object UID],*byteOffset,[object name]);
	}
	[self setStatus:NSLocalizedString(@"assigning people...", @"editor status")];
	[self setPeople:tempArray];
	NSLog(@"End of %d people at %d",[people count],*byteOffset);
	
	[tempArray removeAllObjects];
	[pool drain];
	
#pragma mark Person Stats
	pool = [[NSAutoreleasePool alloc] init];
	[self setStatus:NSLocalizedString(@"loading person stats...", @"editor status")];
	[self setCurrentRecord:0];
	[data getBytes:&count range:NSMakeRange(*byteOffset, 4)]; *byteOffset += 4;
	[self setTotalRecords:count];
	for (i=0; i<count; i++) {
		[self setCurrentRecord:(i+1)];
		
		id object = [Loader readPersonStatsFromData:data atOffset:byteOffset];
		if (![[object className] isEqualToString:@"PersonStats"]) {
			return [NSArray arrayWithObjects:
					@"Person Stats",
					[NSString stringWithFormat:@"%d",i],				// entity
					[NSString stringWithFormat:@"%d",startingOffset],	// entity start
					[NSString stringWithFormat:@"%@",object],			// entity error
					nil]; 
		}
		else if ([object rowID]!=i) {
			return [NSArray arrayWithObjects:
					@"Person Stats",
					[NSString stringWithFormat:@"%d",i],				// entity
					[NSString stringWithFormat:@"%d",startingOffset],	// entity start
					@"Invalid ID",										// entity error
					nil]; 
		}
		else { [tempArray addObject:object]; }
	}
	[self setPersonStats:tempArray];
	NSLog(@"End of %d person stats at %d",[personStats count],*byteOffset);
	
	[tempArray removeAllObjects];
	[pool drain];
	
#pragma mark Player Stats
	pool = [[NSAutoreleasePool alloc] init];
	[self setStatus:NSLocalizedString(@"loading player stats...", @"editor status")];
	[self setCurrentRecord:0];
	[data getBytes:&count range:NSMakeRange(*byteOffset, 4)]; *byteOffset += 4;
	[self setTotalRecords:count];
	for (i=0; i<count; i++) {
		[self setCurrentRecord:(i+1)];
		
		id object = [Loader readPlayerStatsFromData:data atOffset:byteOffset];
		if (![[object className] isEqualToString:@"PlayerStats"]) {
			return [NSArray arrayWithObjects:
					@"Player Stats",
					[NSString stringWithFormat:@"%d",i],				// entity
					[NSString stringWithFormat:@"%d",startingOffset],	// entity start
					[NSString stringWithFormat:@"%@",object],			// entity error
					nil]; 
		}
		else if ([object rowID]!=i) {
			return [NSArray arrayWithObjects:
					@"Player Stats",
					[NSString stringWithFormat:@"%d",i],				// entity
					[NSString stringWithFormat:@"%d",startingOffset],	// entity start
					@"Invalid ID",										// entity error
					nil]; 
		}
		else { [tempArray addObject:object]; }
	}
	[self setPlayerStats:tempArray];
	NSLog(@"End of %d player stats at %d",[playerStats count],*byteOffset);
	
	[tempArray removeAllObjects];
	[pool drain];
	
#pragma mark Non-Player Stats
	pool = [[NSAutoreleasePool alloc] init];
	[self setStatus:NSLocalizedString(@"loading non-player stats...", @"editor status")];
	[self setCurrentRecord:0];
	[data getBytes:&count range:NSMakeRange(*byteOffset, 4)]; *byteOffset += 4;
	[self setTotalRecords:count];
	for (i=0; i<count; i++) {
		[self setCurrentRecord:(i+1)];
		
		id object = [Loader readNonPlayerStatsFromData:data atOffset:byteOffset];
		if (![[object className] isEqualToString:@"NonPlayerStats"]) {
			return [NSArray arrayWithObjects:
					@"Non-Player Stats",
					[NSString stringWithFormat:@"%d",i],				// entity
					[NSString stringWithFormat:@"%d",startingOffset],	// entity start
					[NSString stringWithFormat:@"%@",object],			// entity error
					nil]; 
		}
		else if ([object rowID]!=i) {
			return [NSArray arrayWithObjects:
					@"Non-Player Stats",
					[NSString stringWithFormat:@"%d",i],				// entity
					[NSString stringWithFormat:@"%d",startingOffset],	// entity start
					@"Invalid ID",										// entity error
					nil]; 
		}
		else { [tempArray addObject:object]; }
	}
	[self setNonPlayerStats:tempArray];
	NSLog(@"End of %d non-player stats at %d",[nonPlayerStats count],*byteOffset);
	
	[tempArray removeAllObjects];
	[pool drain];

#pragma mark Competition Histories
	
	[self setStatus:NSLocalizedString(@"loading competition histories...", @"editor status")];
	[self setCurrentRecord:0];
	[data getBytes:&count range:NSMakeRange(*byteOffset, 4)]; *byteOffset += 4;
	[self setTotalRecords:count];
	for (i=0; i<count; i++) {
		[self setCurrentRecord:(i+1)];
		
		id object = [Loader readCompetitionHistoryFromData:data atOffset:byteOffset];
		if (![[object className] isEqualToString:@"CompetitionHistory"]) {
			return [NSArray arrayWithObjects:
					@"Competition History",
					[NSString stringWithFormat:@"%d",i],				// entity
					[NSString stringWithFormat:@"%d",startingOffset],	// entity start
					[NSString stringWithFormat:@"%@",object],			// entity error
					nil]; 
		}
		else if ([object rowID]!=i) {
			return [NSArray arrayWithObjects:
					@"Competition History",
					[NSString stringWithFormat:@"%d",i],				// entity
					[NSString stringWithFormat:@"%d",startingOffset],	// entity start
					@"Invalid ID",										// entity error
					nil]; 
		}
		else { [tempArray addObject:object]; }
	}
	[self setCompetitionHistories:tempArray];
	NSLog(@"End of %d competition histories at %d",[competitionHistories count],*byteOffset);
	
	[tempArray removeAllObjects];
	
	// ???
	[self setUnknownData1:[data subdataWithRange:NSMakeRange(*byteOffset, 76)]]; 
	*byteOffset += 76;
	
	// ???
	[data getBytes:&count range:NSMakeRange(*byteOffset, 4)]; *byteOffset += 4;
	[self setUnknownInt1:count];
	[self setUnknownData2:[data subdataWithRange:NSMakeRange(*byteOffset, (count*8))]]; 
	*byteOffset += (count*8);
	/*
	for (i=0; i<count; i++) {
		// int
		// int (counting - 0,1,2,3,4, etc)
		*byteOffset += 8;
	}
	*/
	NSLog(@"End of post-unknowns 1 at %d",*byteOffset);
	
	// ???
	[data getBytes:&count range:NSMakeRange(*byteOffset, 4)]; *byteOffset += 4;
	[self setUnknownInt2:count];
	[self setUnknownData3:[data subdataWithRange:NSMakeRange(*byteOffset, (count*8))]]; 
	*byteOffset += (count*8);
	/*
	for (i=0; i<count; i++) {
		// int
		// int (counting - 0,1,2,3,4, etc)
		*byteOffset += 8;
	}
	*/
	NSLog(@"End of post-unknowns 2 at %d",*byteOffset);
	
	// ???
	[data getBytes:&count range:NSMakeRange(*byteOffset, 4)]; *byteOffset += 4;
	[self setUnknownInt3:count];
	[self setUnknownData4:[data subdataWithRange:NSMakeRange(*byteOffset, (count*9))]]; 
	*byteOffset += (count*9);
	/*
	 for (i=0; i<count; i++) {
		*byteOffset += 9;
	}
	*/
	NSLog(@"End of post-unknowns 3 at %d",*byteOffset);
	
	// ???
	[data getBytes:&count range:NSMakeRange(*byteOffset, 4)]; *byteOffset += 4;
	[self setUnknownInt4:count];
	[self setUnknownData5:[data subdataWithRange:NSMakeRange(*byteOffset, (count*10))]]; 
	*byteOffset += (count*10);
	/*
	 for (i=0; i<count; i++) {
		*byteOffset += 10;
	}
	*/
	NSLog(@"End of post-unknowns 4 at %d",*byteOffset);
	
	[self setUnknownData6:[data subdataWithRange:NSMakeRange(*byteOffset, 4)]]; 
	*byteOffset += 4;
	
#pragma mark Club Links
	
	[self setStatus:NSLocalizedString(@"loading club links...", @"editor status")];
	[self setCurrentRecord:0];
	[data getBytes:&count range:NSMakeRange(*byteOffset, 4)]; *byteOffset += 4;
	[self setTotalRecords:count];
	for (i=0; i<count; i++) {
		[self setCurrentRecord:(i+1)];
		[tempArray addObject:[Loader readClubLinkFromData:data atOffset:byteOffset]];
	}
	[self setClubLinks:tempArray];
	NSLog(@"End of %d club links at %d",[clubLinks count],*byteOffset);
	
	saveEndOffset = *byteOffset;
	
	// 0x04	FF FF FF FF
	[self setUnknownData7:[data subdataWithRange:NSMakeRange(*byteOffset, 4)]]; 
	*byteOffset += 4;
	
#pragma mark DB Changes
	[data getBytes:&count range:NSMakeRange(*byteOffset, 4)]; *byteOffset += 4;
	[self setDatabaseChanges:count];
	for (int i=0;i<count;i++) {
		[GeneralInfoLoader readFromData:data atOffset:byteOffset readInfo:NO];
	}
	NSLog(@"End of %d db changes at %d",count,*byteOffset);

/**************************************/
/******** END OF GAME_DB.DAT **********/
/**************************************/
	
	
	/*
#pragma mark Unknowns 2
	[self setStatus:NSLocalizedString(@"loading unknowns 2...", @"editor status")];
	[self setCurrentRecord:0];
	[data getBytes:&count range:NSMakeRange(*byteOffset, 4)]; *byteOffset += 4;
	[self setTotalRecords:count];

#pragma mark Unknowns 3
	[self setStatus:NSLocalizedString(@"loading unknowns 3...", @"editor status")];
	[self setCurrentRecord:0];
	[data getBytes:&count range:NSMakeRange(*byteOffset, 4)]; *byteOffset += 4;
	[self setTotalRecords:count];
	
#pragma mark Unknowns 4
	[self setStatus:NSLocalizedString(@"loading unknowns 4...", @"editor status")];
	[self setCurrentRecord:0];
	[data getBytes:&count range:NSMakeRange(*byteOffset, 4)]; *byteOffset += 4;
	[self setTotalRecords:count];
	
#pragma mark Unknowns 5
	[self setStatus:NSLocalizedString(@"loading unknowns 5...", @"editor status")];
	[self setCurrentRecord:0];
	[data getBytes:&count range:NSMakeRange(*byteOffset, 4)]; *byteOffset += 4;
	[self setTotalRecords:count];
	
#pragma mark Unknowns 6
	[self setStatus:NSLocalizedString(@"loading unknowns 6...", @"editor status")];
	[self setCurrentRecord:0];
	[data getBytes:&count range:NSMakeRange(*byteOffset, 4)]; *byteOffset += 4;
	[self setTotalRecords:count];
	
#pragma mark Unknowns 7
	[self setStatus:NSLocalizedString(@"loading unknowns 7...", @"editor status")];
	[self setCurrentRecord:0];
	[data getBytes:&count range:NSMakeRange(*byteOffset, 4)]; *byteOffset += 4;
	[self setTotalRecords:count];
	
#pragma mark Unknowns 8
	[self setStatus:NSLocalizedString(@"loading unknowns 8...", @"editor status")];
	[self setCurrentRecord:0];
	[data getBytes:&count range:NSMakeRange(*byteOffset, 4)]; *byteOffset += 4;
	[self setTotalRecords:count];
	
#pragma mark Unknowns 9
	[self setStatus:NSLocalizedString(@"loading unknowns 9...", @"editor status")];
	[self setCurrentRecord:0];
	[data getBytes:&count range:NSMakeRange(*byteOffset, 4)]; *byteOffset += 4;
	[self setTotalRecords:count];
	
#pragma mark Unknowns 10
	[self setStatus:NSLocalizedString(@"loading unknowns 10...", @"editor status")];
	[self setCurrentRecord:0];
	[data getBytes:&count range:NSMakeRange(*byteOffset, 4)]; *byteOffset += 4;
	[self setTotalRecords:count];
	for (i=0; i<count; i++) {
		[self setCurrentRecord:(i+1)];
		//	0x01 db class
		//	0x0C ???
		//	0x02 ???
		//	0x02 ???
		//	0x04 rowID
		//	0x04 UID
		*byteOffset += 25;
	}
	NSLog(@"End of %d unknown 10s at %d",count,*byteOffset);

#pragma mark Unknowns 11
	[self setStatus:NSLocalizedString(@"loading unknowns 11...", @"editor status")];
	[self setCurrentRecord:0];
	[data getBytes:&count range:NSMakeRange(*byteOffset, 4)]; *byteOffset += 4;
	[self setTotalRecords:count];

#pragma mark Unknowns 12
	[self setStatus:NSLocalizedString(@"loading unknowns 12...", @"editor status")];
	[self setCurrentRecord:0];
	[data getBytes:&count range:NSMakeRange(*byteOffset, 4)]; *byteOffset += 4;
	[self setTotalRecords:count];

#pragma mark Unknowns 13
	[self setStatus:NSLocalizedString(@"loading unknowns 13...", @"editor status")];
	[self setCurrentRecord:0];
	[data getBytes:&count range:NSMakeRange(*byteOffset, 4)]; *byteOffset += 4;
	[self setTotalRecords:count];

#pragma mark Unknowns 14
	[self setStatus:NSLocalizedString(@"loading unknowns 14...", @"editor status")];
	[self setCurrentRecord:0];
	[data getBytes:&count range:NSMakeRange(*byteOffset, 4)]; *byteOffset += 4;
	[self setTotalRecords:count];

#pragma mark Unknowns 15
	[self setStatus:NSLocalizedString(@"loading unknowns 15...", @"editor status")];
	[self setCurrentRecord:0];
	[data getBytes:&count range:NSMakeRange(*byteOffset, 4)]; *byteOffset += 4;
	[self setTotalRecords:count];
	
#pragma mark Unknowns 16
	[self setStatus:NSLocalizedString(@"loading unknowns 16...", @"editor status")];
	[self setCurrentRecord:0];
	[data getBytes:&count range:NSMakeRange(*byteOffset, 4)]; *byteOffset += 4;
	[self setTotalRecords:count];
	for (i=0; i<count; i++) {
		[self setCurrentRecord:(i+1)];
		//	0x01 db class
		//	0x02 year
		//	0x08 ???
		//	0x02 year
		//	0x04 rowID
		//	0x04 UID
		*byteOffset += 21;
	}
	NSLog(@"End of %d unknown 16s at %d",count,*byteOffset);

#pragma mark Unknowns 17
	[self setStatus:NSLocalizedString(@"loading unknowns 17...", @"editor status")];
	[self setCurrentRecord:0];
	[data getBytes:&count range:NSMakeRange(*byteOffset, 4)]; *byteOffset += 4;
	[self setTotalRecords:count];
	
#pragma mark Unknowns 18
	[self setStatus:NSLocalizedString(@"loading unknowns 18...", @"editor status")];
	[self setCurrentRecord:0];
	[data getBytes:&count range:NSMakeRange(*byteOffset, 4)]; *byteOffset += 4;
	[self setTotalRecords:count];
	
#pragma mark Unknowns 19
	[self setStatus:NSLocalizedString(@"loading unknowns 19...", @"editor status")];
	[self setCurrentRecord:0];
	[data getBytes:&count range:NSMakeRange(*byteOffset, 4)]; *byteOffset += 4;
	[self setTotalRecords:count];
	for (i=0; i<count; i++) {
		[self setCurrentRecord:(i+1)];
		//	0x01 db class
		//	0x09 year
		//	0x04 date
		//	0x04 rowID
		//	0x04 UID
		*byteOffset += 22;
	}
	NSLog(@"End of %d unknown 19s at %d",count,*byteOffset);
	
#pragma mark Unknowns 20
	[self setStatus:NSLocalizedString(@"loading unknowns 20...", @"editor status")];
	[self setCurrentRecord:0];
	[data getBytes:&count range:NSMakeRange(*byteOffset, 4)]; *byteOffset += 4;
	[self setTotalRecords:count];

#pragma mark Unknowns 21
	[self setStatus:NSLocalizedString(@"loading unknowns 21...", @"editor status")];
	[self setCurrentRecord:0];
	[data getBytes:&count range:NSMakeRange(*byteOffset, 4)]; *byteOffset += 4;
	[self setTotalRecords:count];

#pragma mark Unknowns 21.5
	
	if ([controller gameDBVersion]>=FM2010_10_2) {
		[self setStatus:NSLocalizedString(@"loading unknowns 21.5...", @"editor status")];
		[self setCurrentRecord:0];
		[data getBytes:&count range:NSMakeRange(*byteOffset, 4)]; *byteOffset += 4;
		[self setTotalRecords:count];
		NSLog(@"End of %d unknown 21.5s at %d",count,*byteOffset);
	}	
	
#pragma mark Unknowns 22
	[self setStatus:NSLocalizedString(@"loading unknowns 22...", @"editor status")];
	[self setCurrentRecord:0];
	[data getBytes:&count range:NSMakeRange(*byteOffset, 4)]; *byteOffset += 4;
	[self setTotalRecords:count];
	*byteOffset += (count*9);
	NSLog(@"End of %d unknown 22s at %d",count,*byteOffset);
	
#pragma mark Unknowns 23
	[self setStatus:NSLocalizedString(@"loading unknowns 23...", @"editor status")];
	[self setCurrentRecord:0];
	[data getBytes:&count range:NSMakeRange(*byteOffset, 4)]; *byteOffset += 4;
	[self setTotalRecords:count];
	*byteOffset += (count*9);
	NSLog(@"End of %d unknown 23s at %d",count,*byteOffset);

#pragma mark Unknowns 24
	[self setStatus:NSLocalizedString(@"loading unknowns 24...", @"editor status")];
	[self setCurrentRecord:0];
	[data getBytes:&count range:NSMakeRange(*byteOffset, 4)]; *byteOffset += 4;
	[self setTotalRecords:count];
	NSLog(@"End of %d unknown 24s at %d",count,*byteOffset);
	
	*/
	
	[self setStatus:NSLocalizedString(@"assigning Person Stats...", @"editor status")];
	for (id item in people) {
		if ([item personData] && [[item personData] personStatsID] > -1) {
			[item setPersonStats:[personStats objectAtIndex:[[item personData] personStatsID]]];
		}
		if ([item playerData] && [[item playerData] playerStatsID] > -1) {
			[item setPlayerStats:[playerStats objectAtIndex:[[item playerData] playerStatsID]]];
		}
		if ([item nonPlayerData] && [[item nonPlayerData] nonPlayingStatsID] > -1) {
			[item setNonPlayerStats:[nonPlayerStats objectAtIndex:[[item nonPlayerData] nonPlayingStatsID]]];
		}
	}
	
	[self setStatus:NSLocalizedString(@"sorting Stadium Changes...", @"editor status")];
	NSEnumerator *oEnum = [[self stadiumChanges] objectEnumerator];
	StadiumChange *item;
	while (item = [oEnum nextObject]) {
		if ([item oldStadiumID]>-1) {
			[item setOldStadium:[stadiums objectAtIndex:[item oldStadiumID]]];
		}
		if ([item newStadiumID]>-1) {
			[item setNewStadium:[stadiums objectAtIndex:[item newStadiumID]]];
		}
		if ([item alternativeStadiumID]>-1) {
			[item setAlternativeStadium:[stadiums objectAtIndex:[item alternativeStadiumID]]];
		}
		[item setName:[NSString stringWithFormat:@"Change %d",[item rowID]]];
	}
	[self setStatus:@""];
	return NULL;
}

- (void)saveGameDB:(NSMutableData *)data
{
	int ibuffer;
	
#pragma mark Alliterations
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	[self setStatus:NSLocalizedString(@"saving good alliterations...", @"editor status")];
	ibuffer = [goodAlliterations count];
	[data appendBytes:&ibuffer length:4];
	[self setTotalRecords:ibuffer];
	for (int i=0; i<ibuffer; i++) {
		[self setCurrentRecord:(i+1)];
		[AlliterationSaver saveAlliteration:[goodAlliterations objectAtIndex:i] toData:data];
	}
	
	[self setStatus:NSLocalizedString(@"saving bad alliterations...", @"editor status")];
	ibuffer = [badAlliterations count];
	[data appendBytes:&ibuffer length:4];
	[self setTotalRecords:ibuffer];
	for (int i=0; i<ibuffer; i++) {
		[self setCurrentRecord:(i+1)];
		[AlliterationSaver saveAlliteration:[badAlliterations objectAtIndex:i] toData:data];
	}
	
	// unknown byte always seems to be 0
	[data increaseLengthBy:1];
	
	[pool drain];
	
#pragma mark Awards
	pool = [[NSAutoreleasePool alloc] init];
	[self setStatus:NSLocalizedString(@"saving awards...", @"editor status")];
	ibuffer = [awards count];
	[data appendBytes:&ibuffer length:4];
	[self setTotalRecords:ibuffer];
	for (int i=0; i<ibuffer; i++) {
		[self setCurrentRecord:(i+1)];
		[AwardSaver saveAward:[awards objectAtIndex:i] toData:data];
	}
	[pool drain];

#pragma mark Cities
	pool = [[NSAutoreleasePool alloc] init];
	[self setStatus:NSLocalizedString(@"saving cities...", @"editor status")];
	ibuffer = [cities count];
	[data appendBytes:&ibuffer length:4];
	[self setTotalRecords:ibuffer];
	for (int i=0; i<ibuffer; i++) {
		[self setCurrentRecord:(i+1)];
		[CitySaver saveCity:[cities objectAtIndex:i] toData:data];
	}
	[pool drain];

#pragma mark Clubs
	pool = [[NSAutoreleasePool alloc] init];
	[self setStatus:NSLocalizedString(@"saving clubs...", @"editor status")];
	ibuffer = [clubs count];
	[data appendBytes:&ibuffer length:4];
	[self setTotalRecords:ibuffer];
	for (int i=0; i<ibuffer; i++) {
		[self setCurrentRecord:(i+1)];
		[ClubSaver saveClub:[clubs objectAtIndex:i] toData:data version:[controller gameDBVersion]];
	}
	[pool drain];

#pragma mark Competitions
	pool = [[NSAutoreleasePool alloc] init];
	[self setStatus:NSLocalizedString(@"saving competitions...", @"editor status")];
	ibuffer = [competitions count];
	[data appendBytes:&ibuffer length:4];
	[self setTotalRecords:ibuffer];
	for (int i=0; i<ibuffer; i++) {
		[self setCurrentRecord:(i+1)];
		[CompetitionSaver saveCompetition:[competitions objectAtIndex:i] toData:data];
	}
	[pool drain];

#pragma mark Continents
	pool = [[NSAutoreleasePool alloc] init];
	[self setStatus:NSLocalizedString(@"saving continents...", @"editor status")];
	ibuffer = [continents count];
	[data appendBytes:&ibuffer length:4];
	[self setTotalRecords:ibuffer];
	for (int i=0; i<ibuffer; i++) {
		[self setCurrentRecord:(i+1)];
		[ContinentSaver saveContinent:[continents objectAtIndex:i] toData:data];
	}
	[pool drain];

#pragma mark Currencies
	pool = [[NSAutoreleasePool alloc] init];
	[self setStatus:NSLocalizedString(@"saving currencies...", @"editor status")];
	ibuffer = [currencies count];
	[data appendBytes:&ibuffer length:4];
	[self setTotalRecords:ibuffer];
	for (int i=0; i<ibuffer; i++) {
		[self setCurrentRecord:(i+1)];
		[CurrencySaver saveCurrency:[currencies objectAtIndex:i] toData:data];
	}
	[pool drain];

#pragma mark Injuries
	pool = [[NSAutoreleasePool alloc] init];
	[self setStatus:NSLocalizedString(@"saving injuries...", @"editor status")];
	ibuffer = [injuries count];
	[data appendBytes:&ibuffer length:4];
	[self setTotalRecords:ibuffer];
	for (int i=0; i<ibuffer; i++) {
		[self setCurrentRecord:(i+1)];
		[InjurySaver saveInjury:[injuries objectAtIndex:i] toData:data];
	}
	[pool drain];
	
#pragma mark Media
	pool = [[NSAutoreleasePool alloc] init];
	[self setStatus:NSLocalizedString(@"saving media...", @"editor status")];
	ibuffer = [media count];
	[data appendBytes:&ibuffer length:4];
	[self setTotalRecords:ibuffer];
	for (int i=0; i<ibuffer; i++) {
		[self setCurrentRecord:(i+1)];
		[MediaSaver saveMedia:[media objectAtIndex:i] toData:data];
	}
	[pool drain];
	
#pragma mark Languages
	pool = [[NSAutoreleasePool alloc] init];
	[self setStatus:NSLocalizedString(@"saving languages...", @"editor status")];
	ibuffer = [languages count];
	[data appendBytes:&ibuffer length:4];
	[self setTotalRecords:ibuffer];
	for (int i=0; i<ibuffer; i++) {
		[self setCurrentRecord:(i+1)];
		[LanguageSaver saveLanguage:[languages objectAtIndex:i] toData:data];
	}
	[pool drain];

#pragma mark Nations
	pool = [[NSAutoreleasePool alloc] init];
	[self setStatus:NSLocalizedString(@"saving nations...", @"editor status")];
	ibuffer = [nations count];
	[data appendBytes:&ibuffer length:4];
	[self setTotalRecords:ibuffer];
	for (int i=0; i<ibuffer; i++) {
		[self setCurrentRecord:(i+1)];
		[NationSaver saveNation:[nations objectAtIndex:i] toData:data];
	}
	[pool drain];

#pragma mark First Names
	pool = [[NSAutoreleasePool alloc] init];
	[self setStatus:NSLocalizedString(@"saving first names...", @"editor status")];
	ibuffer = [firstNames count];
	[data appendBytes:&ibuffer length:4];
	[self setTotalRecords:ibuffer];
	for (int i=0; i<ibuffer; i++) {
		[self setCurrentRecord:(i+1)];
		[NameSaver saveName:[firstNames objectAtIndex:i] toData:data];
	}
	[pool drain];

#pragma mark Surnames
	pool = [[NSAutoreleasePool alloc] init];
	[self setStatus:NSLocalizedString(@"saving surnames...", @"editor status")];
	ibuffer = [surnames count];
	[data appendBytes:&ibuffer length:4];
	[self setTotalRecords:ibuffer];
	for (int i=0; i<ibuffer; i++) {
		[self setCurrentRecord:(i+1)];
		[NameSaver saveName:[surnames objectAtIndex:i] toData:data];
	}
	[pool drain];

#pragma mark Common Names
	pool = [[NSAutoreleasePool alloc] init];
	[self setStatus:NSLocalizedString(@"saving common names...", @"editor status")];
	ibuffer = [commonNames count];
	[data appendBytes:&ibuffer length:4];
	[self setTotalRecords:ibuffer];
	for (int i=0; i<ibuffer; i++) {
		[self setCurrentRecord:(i+1)];
		[NameSaver saveName:[commonNames objectAtIndex:i] toData:data];
	}
	[pool drain];

#pragma mark Unknowns 1
	pool = [[NSAutoreleasePool alloc] init];
	[self setStatus:NSLocalizedString(@"saving unknowns 1...", @"editor status")];
	ibuffer = [unknowns1 count];
	[data appendBytes:&ibuffer length:4];
	[self setTotalRecords:ibuffer];
	for (int i=0; i<ibuffer; i++) {
		[self setCurrentRecord:(i+1)];
		[Unknown7Saver saveUnknown:[unknowns1 objectAtIndex:i] toData:data];
	}
	[pool drain];	

#pragma mark Local Areas
	pool = [[NSAutoreleasePool alloc] init];
	[self setStatus:NSLocalizedString(@"saving local areas...", @"editor status")];
	ibuffer = [localAreas count];
	[data appendBytes:&ibuffer length:4];
	[self setTotalRecords:ibuffer];
	for (int i=0; i<ibuffer; i++) {
		[self setCurrentRecord:(i+1)];
		[LocalAreaSaver saveArea:[localAreas objectAtIndex:i] toData:data];
	}
	[pool drain];

#pragma mark Sponsors
	pool = [[NSAutoreleasePool alloc] init];
	[self setStatus:NSLocalizedString(@"saving sponsors...", @"editor status")];
	ibuffer = [sponsors count];
	[data appendBytes:&ibuffer length:4];
	[self setTotalRecords:ibuffer];
	for (int i=0; i<ibuffer; i++) {
		[self setCurrentRecord:(i+1)];
		[SponsorSaver saveSponsor:[sponsors objectAtIndex:i] toData:data];
	}
	[pool drain];	

#pragma mark Stadiums
	pool = [[NSAutoreleasePool alloc] init];
	[self setStatus:NSLocalizedString(@"saving stadiums...", @"editor status")];
	ibuffer = [stadiums count];
	[data appendBytes:&ibuffer length:4];
	[self setTotalRecords:ibuffer];
	for (int i=0; i<ibuffer; i++) {
		[self setCurrentRecord:(i+1)];
		[FootballStadiumSaver saveStadium:[stadiums objectAtIndex:i] toData:data];
	}
	[pool drain];

#pragma mark Stadium Changes
	pool = [[NSAutoreleasePool alloc] init];
	[self setStatus:NSLocalizedString(@"saving stadium changes...", @"editor status")];
	ibuffer = [stadiumChanges count];
	[data appendBytes:&ibuffer length:4];
	[self setTotalRecords:ibuffer];
	for (int i=0; i<ibuffer; i++) {
		[self setCurrentRecord:(i+1)];
		[StadiumChangeSaver saveStadiumChange:[stadiumChanges objectAtIndex:i] toData:data];
	}
	[pool drain];

#pragma mark Stage Names
	pool = [[NSAutoreleasePool alloc] init];
	[self setStatus:NSLocalizedString(@"saving stage names...", @"editor status")];
	ibuffer = [stageNames count];
	[data appendBytes:&ibuffer length:4];
	[self setTotalRecords:ibuffer];
	for (int i=0; i<ibuffer; i++) {
		[self setCurrentRecord:(i+1)];
		[StageNameSaver saveStageName:[stageNames objectAtIndex:i] toData:data];
	}
	[pool drain];

#pragma mark Teams
	pool = [[NSAutoreleasePool alloc] init];
	[self setStatus:NSLocalizedString(@"saving teams...", @"editor status")];
	ibuffer = [teams count];
	[data appendBytes:&ibuffer length:4];
	[self setTotalRecords:ibuffer];
	for (int i=0; i<ibuffer; i++) {
		[self setCurrentRecord:(i+1)];
		[TeamSaver saveTeam:[teams objectAtIndex:i] toData:data version:[controller gameDBVersion]];
	}
	[pool drain];

#pragma mark Weather
	pool = [[NSAutoreleasePool alloc] init];
	[self setStatus:NSLocalizedString(@"saving weather...", @"editor status")];
	ibuffer = [weather count];
	[data appendBytes:&ibuffer length:4];
	[self setTotalRecords:ibuffer];
	for (int i=0; i<ibuffer; i++) {
		[self setCurrentRecord:(i+1)];
		[WeatherSaver saveWeather:[weather objectAtIndex:i] toData:data];
	}
	[pool drain];
	
#pragma mark Descriptions
	pool = [[NSAutoreleasePool alloc] init];
	[self setStatus:NSLocalizedString(@"saving descriptions...", @"editor status")];
	ibuffer = [descriptions count];
	[data appendBytes:&ibuffer length:4];
	[self setTotalRecords:ibuffer];
	for (int i=0; i<ibuffer; i++) {
		[self setCurrentRecord:(i+1)];
		[DescriptionSaver saveDescription:[descriptions objectAtIndex:i] toData:data];
	}
	[pool drain];

#pragma mark Derbies
	pool = [[NSAutoreleasePool alloc] init];
	[self setStatus:NSLocalizedString(@"saving derbies...", @"editor status")];
	ibuffer = [derbies count];
	[data appendBytes:&ibuffer length:4];
	[self setTotalRecords:ibuffer];
	for (int i=0; i<ibuffer; i++) {
		[self setCurrentRecord:(i+1)];
		[DerbySaver saveDerby:[derbies objectAtIndex:i] toData:data];
	}
	[pool drain];
	
#pragma mark Agreements
	pool = [[NSAutoreleasePool alloc] init];
	[self setStatus:NSLocalizedString(@"saving agreements...", @"editor status")];
	ibuffer = [agreements count];
	[data appendBytes:&ibuffer length:4];
	[self setTotalRecords:ibuffer];
	for (int i=0; i<ibuffer; i++) {
		[self setCurrentRecord:(i+1)];
		[AgreementSaver saveAgreement:[agreements objectAtIndex:i] toData:data];
	}
	[pool drain];
	
#pragma mark People
	pool = [[NSAutoreleasePool alloc] init];
	[self setStatus:NSLocalizedString(@"saving people...", @"editor status")];
	ibuffer = [people count];
	[data appendBytes:&ibuffer length:4];
	[self setTotalRecords:ibuffer];
	for (int i=0; i<ibuffer; i++) {
		[self setCurrentRecord:(i+1)];
		[PersonSaver savePerson:[people objectAtIndex:i] toData:data version:[controller gameDBVersion]];
	}
	[pool drain];

#pragma mark Person Stats
	pool = [[NSAutoreleasePool alloc] init];
	[self setStatus:NSLocalizedString(@"saving person stats...", @"editor status")];
	ibuffer = [personStats count];
	[data appendBytes:&ibuffer length:4];
	[self setTotalRecords:ibuffer];
	for (int i=0; i<ibuffer; i++) {
		[self setCurrentRecord:(i+1)];
		[PersonStatsSaver saveStats:[personStats objectAtIndex:i] toData:data];
	}
	[pool drain];

#pragma mark Player Stats
	pool = [[NSAutoreleasePool alloc] init];
	[self setStatus:NSLocalizedString(@"saving playing stats...", @"editor status")];
	ibuffer = [playerStats count];
	[data appendBytes:&ibuffer length:4];
	[self setTotalRecords:ibuffer];
	for (int i=0; i<ibuffer; i++) {
		[self setCurrentRecord:(i+1)];
		[PlayerStatsSaver saveStats:[playerStats objectAtIndex:i] toData:data];
	}
	[pool drain];
	
#pragma mark Non-Player Stats
	pool = [[NSAutoreleasePool alloc] init];
	[self setStatus:NSLocalizedString(@"saving non-player stats...", @"editor status")];
	ibuffer = [nonPlayerStats count];
	[data appendBytes:&ibuffer length:4];
	[self setTotalRecords:ibuffer];
	for (int i=0; i<ibuffer; i++) {
		[self setCurrentRecord:(i+1)];
		[NonPlayerStatsSaver saveStats:[nonPlayerStats objectAtIndex:i] toData:data];
	}
	[pool drain];

#pragma mark Competition Histories
	pool = [[NSAutoreleasePool alloc] init];
	[self setStatus:NSLocalizedString(@"saving competition histories...", @"editor status")];
	ibuffer = [competitionHistories count];
	[data appendBytes:&ibuffer length:4];
	[self setTotalRecords:ibuffer];
	for (int i=0; i<ibuffer; i++) {
		[self setCurrentRecord:(i+1)];
		[CompetitionHistorySaver saveCompetitionHistory:[competitionHistories objectAtIndex:i] toData:data];
	}
	[pool drain];

#pragma mark Unknowns
	[data appendData:unknownData1];
	[data appendBytes:&unknownInt1 length:4];
	[data appendData:unknownData2];
	[data appendBytes:&unknownInt2 length:4];
	[data appendData:unknownData3];
	[data appendBytes:&unknownInt3 length:4];
	[data appendData:unknownData4];
	[data appendBytes:&unknownInt4 length:4];
	[data appendData:unknownData5];
	[data appendData:unknownData6];

#pragma mark Club Links
	pool = [[NSAutoreleasePool alloc] init];
	[self setStatus:NSLocalizedString(@"saving club links...", @"editor status")];
	ibuffer = [clubLinks count];
	[data appendBytes:&ibuffer length:4];
	[self setTotalRecords:ibuffer];
	for (int i=0; i<ibuffer; i++) {
		[self setCurrentRecord:(i+1)];
		[ClubLinkSaver saveClubLink:[clubLinks objectAtIndex:i] toData:data];
	}
	[pool drain];
}

- (void)readLangDB:(NSString *)path
{
	if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
		[self setLangDB:[LangDBLoader readFromFile:path]];
	}
	langDBLoaded = YES;
}

- (void)parseGraphics:(NSString *)path
{
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
	[graphics parsePathForGraphics:[path stringByExpandingTildeInPath]];
	
	[pool drain];
}

- (void)assignAwardNames:(NSString *)path
{
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
	unsigned int i = 0;
	for (id item in awards)
	{
		id object = [[langDB awardLang] objectForKey:[NSNumber numberWithInt:[item UID]]];
		if (object!=nil) {
			Award *aAward = [[self awards] objectAtIndex:i];
			[aAward setName:[object objectForKey:@"name"]];
			[aAward setShortName:[object objectForKey:@"shortName"]];
		}
		i++;
	}
	NSLog(@"LangDB Names (awards) assigned");
	
	[pool drain];
}

- (void)assignContinentNames:(NSString *)path
{
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
	unsigned int i = 0;
	for (id item in continents) {
		id item2 = [[langDB continentLang] objectForKey:[NSNumber numberWithInt:[item UID]]];
		if (item2!=nil) {
			Continent *object = [[self continents] objectAtIndex:i];
			[object setName:[item2 objectForKey:@"name"]];
			[object setThreeLetterName:[item2 objectForKey:@"threeLetterName"]];
			[object setContinentialityName:[item2 objectForKey:@"continentialityName"]];
			[object setFederationName:[item2 objectForKey:@"federationName"]];
			[object setFederationShortName:[item2 objectForKey:@"federationShortName"]];
		}
		i++;
	}
	NSLog(@"LangDB Names (continents) assigned");
	
	[pool drain];
}

- (void)assignInjuryNames:(NSString *)path
{
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
	unsigned int i = 0;
	for (id item in injuries) {
		id item2 = [[langDB injuryLang] objectForKey:[NSNumber numberWithInt:[item UID]]];
		if (item2!=nil) {
			Injury *object = [[self injuries] objectAtIndex:i];
			[object setName:[item2 objectForKey:@"name"]];
			[object setSentenceName:[item2 objectForKey:@"sentenceName"]];
		}
		i++;
	}
	NSLog(@"LangDB Names (injuries) assigned");
	
	[pool drain];
}

- (void)assignDescriptionNames:(NSString *)path
{
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
	unsigned int i = 0;
	for (id item in descriptions) {
		id item2 = [[langDB descriptionLang] objectForKey:[NSNumber numberWithInt:[item UID]]];
		if (item2!=nil) {
			Description *object = [[self descriptions] objectAtIndex:i];
			[object setNames:[item2 objectForKey:@"names"]];
		}
		i++;
	}
	NSLog(@"LangDB Names (descriptions) assigned");
	
	[pool drain];
}

- (void)assignStageNames:(NSString *)path
{
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
	unsigned int i = 0;
	for (id item in stageNames) {
		id item2 = [[langDB stageNameLang] objectForKey:[NSNumber numberWithInt:[item UID]]];
		if (item2!=nil) {
			StageName *object = [[self stageNames] objectAtIndex:i];
			[object setName:[item2 objectForKey:@"name"]];
			[object setShortName:[item2 objectForKey:@"shortName"]];
			[object setPluralName:[item2 objectForKey:@"pluralName"]];
		}
		i++;
	}
	NSLog(@"LangDB Names (stage names) assigned");
	
	[pool drain];
}

- (NSArray *)formationStrings
{
	NSArray *strings = [NSArray arrayWithObjects:
						NSLocalizedString(@"Not Set", @"general 'not set' option"),
						NSLocalizedString(@"5-3-2 Sweeper", @"formation"),
						NSLocalizedString(@"5-3-2", @"formation"),
						NSLocalizedString(@"4-4-2", @"formation"),
						NSLocalizedString(@"4-3-3", @"formation"),
						NSLocalizedString(@"4-2-4", @"formation"),
						NSLocalizedString(@"3-5-2", @"formation"),
						NSLocalizedString(@"4-1-2-1-2", @"formation"),
						NSLocalizedString(@"4-5-1", @"formation"),
						NSLocalizedString(@"3-4-3", @"formation"),
						NSLocalizedString(@"3-4-1-2", @"formation"),
						NSLocalizedString(@"3-4-2-1", @"formation"),
						NSLocalizedString(@"4-3-2-1", @"formation"),
						NSLocalizedString(@"3-5-2 Sweeper", @"formation"),
						NSLocalizedString(@"4-3-1-2", @"formation"),
						NSLocalizedString(@"5-4-1", @"formation"),
						NSLocalizedString(@"4-4-1-1", @"formation"),
						NSLocalizedString(@"4-4-2 Sweeper", @"formation"),
						NSLocalizedString(@"4-2-3-1", @"formation"),
						NSLocalizedString(@"4-1-3-1-1", @"formation"),
						NSLocalizedString(@"4-1-3-2", @"formation"),
						NSLocalizedString(@"4-2-3-1 Denmark", @"formation"),
						NSLocalizedString(@"4-4-2 Defensive Midfielder", @"formation"),
						NSLocalizedString(@"4-5-1 Defensive Midfielder", @"formation"),
						NSLocalizedString(@"4-2-2-2", @"formation"),
						NSLocalizedString(@"4-4-2 Diamond", @"formation"),
						NSLocalizedString(@"3-1-3-1-2", @"formation"),
						NSLocalizedString(@"4-1-2-3 Attacking", @"formation"),
						NSLocalizedString(@"4-1-2-2-1", @"formation"),
						NSLocalizedString(@"4-2-2-2 Defensive Midfielder", @"formation"),
						NSLocalizedString(@"4-2-3-1 Defensive Midfielder", @"formation"),
						NSLocalizedString(@"5-3-2 Serbia & Montenegro", @"formation"),
						NSLocalizedString(@"3-6-1", @"formation"),
						NSLocalizedString(@"Unknown 1", @"formation"),
						NSLocalizedString(@"Unknown 2", @"formation"),
						NSLocalizedString(@"Unknown 3", @"formation"),
						nil];
	return strings;
}

@end
