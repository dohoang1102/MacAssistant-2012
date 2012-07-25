//
//  Person.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/29.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "DatabaseTypes.h"
#import "Person.h"
#import "PlayerForm.h"
#import "Relationship.h"
#import "Database.h"
#import "Nation.h"
#import "Name.h"
#import "Club.h"
#import "Team.h"
#import "Contract.h"
#import "ContractOffer.h"

@implementation Person

@synthesize databaseClass, rowID, UID, playerData, staffData, personData, nonPlayerData, flags,
playerAndNonPlayerData, officialData, retiredPersonData, virtualPlayerData, spokespersonData,
journalistData, humanData, controller, name, personStats, nonPlayerStats, playerStats,
unknownData1, unknownChar1, theNewFirstName, theNewSurname, theNewCommonName, transferID, agentData;

- (id)init
{
	[super init];
	
	name = @"---";
	
	return self;
}

- (NSString *)dobPreviewString
{
	if (personData) {
		NSCalendar *gregorian = [[NSCalendar alloc]
								 initWithCalendarIdentifier:NSGregorianCalendar];
		
		NSDateComponents *components =
		[gregorian components:(NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit) fromDate:[[personData dateOfBirth] date]];
		
		NSString *str = [[NSString alloc] initWithFormat:@"%d.%d.%d",[components day],[components month],[components year]];
		[gregorian release];
		return str;
	}
	return @"---";
}

- (NSString *)name {
	if (personData) {
		if ([personData commonNameID]>-1 && [personData commonNameID]<[(NSMutableArray *)[controller valueForKeyPath:@"database.commonNames"] count]) {
			return [[[controller valueForKeyPath:@"database.commonNames"] objectAtIndex:[personData commonNameID]] name];
		}
		else if ([personData firstNameID]>-1 || [personData surnameID]>-1) {
			NSString *firstName = @"";
            NSString *surname = @"";
            
			if ([personData firstNameID]>-1 && [personData firstNameID]<[(NSMutableArray *)[controller valueForKeyPath:@"database.firstNames"] count]) {
				firstName = [[[controller valueForKeyPath:@"database.firstNames"] objectAtIndex:[personData firstNameID]] name];
			}
            
			if ([personData surnameID]>-1 && [personData surnameID]<[(NSMutableArray *)[controller valueForKeyPath:@"database.surnames"] count]) {
				surname = [[[controller valueForKeyPath:@"database.surnames"] objectAtIndex:[personData surnameID]] name];
			}
			
			return [NSString stringWithFormat:@"%@ %@",firstName, surname];
		}
	}
	else if (retiredPersonData) {
		return [NSString stringWithFormat:@"%@ %@",[retiredPersonData firstName], [retiredPersonData surname]];
	}
	else if (virtualPlayerData) {
		return NSLocalizedString(@"Virtual Player",nil);
	}
	
	return @"---";
}

- (NSString *)nationString {
	NSMutableString *string = [[NSMutableString alloc] init];
	if (personData) {
		[string appendFormat:@"%@",[[[[[controller database] nations] objectAtIndex:[personData nationID]] teamContainer] name]];
		
		for (Relationship *item in [personData relationships]) {
			if ([item relationshipType]==RT_HAS_NATIONALITY)
			{
				[string appendFormat:@" / %@",[[[[[controller database] nations] objectAtIndex:[item associatedID]] teamContainer] name]];
			}
		}
	}
	else { [string appendString:@"---"]; }
	
	return string;
}

- (NSString *)nationalTeamString
{
	if (staffData) {
		if ([staffData nationalTeamID]>-1) {
			[[[[[controller database] nations] objectAtIndex:[[[[controller database] teams] objectAtIndex:[staffData nationalTeamID]] teamContainerID]] teamContainer] name];
		}
		else if (personData && [personData nationID]>-1) { return [[[[[controller database] nations] objectAtIndex:[personData nationID]] teamContainer] name]; }
	}
	return @"No Nation";
}

- (NSString *)teamString {
	if (staffData) {
		if ([staffData clubTeamID] > -1) {
			if (![[[[[controller database] teams] objectAtIndex:[staffData clubTeamID]] name] isEqualToString:@"---"])
			{
				return [[[[controller database] teams] objectAtIndex:[staffData clubTeamID]] name];
			}
			else
			{
				return [[[[controller database] teams] objectAtIndex:[staffData clubTeamID]] fullTeamString];
			}
		}
		else if ([staffData nationalTeamID] > -1) {
			if (![[[[[controller database] teams] objectAtIndex:[staffData nationalTeamID]] name] isEqualToString:@"---"])
			{
				return [[[[controller database] teams] objectAtIndex:[staffData nationalTeamID]] name];
			}
			else
			{
				return [[[[controller database] teams] objectAtIndex:[staffData nationalTeamID]] fullTeamString];
			}
		}
		
	}
			 
	return @"---";
}

- (NSString *)typeString {
	if (playerData && nonPlayerData) { return NSLocalizedString(@"Player / Non-Player", @"person job"); }
	else if (playerData) { return NSLocalizedString(@"Player", @"person job"); }
	else if (nonPlayerData) { return NSLocalizedString(@"Non-Player", @"person job"); }
	else if (officialData) {
		if ([officialData assistantRefereeOnly]) { return NSLocalizedString(@"Assistant Referee", @"person job"); }
		else { return NSLocalizedString(@"Referee", @"person job"); }
	}
	else if (journalistData) { return NSLocalizedString(@"Journalist", @"person job"); }
	else if (agentData) { return NSLocalizedString(@"Agent", @"person job"); }
	else if (spokespersonData) { return NSLocalizedString(@"Spokesperson", @"person job"); }
	else if (humanData) { return NSLocalizedString(@"Human", @"person job"); }
	else if (databaseClass==DBC_VIRTUAL_PLAYER) { return NSLocalizedString(@"Virtual Player", @"person job"); }
	else if (retiredPersonData) { return NSLocalizedString(@"Retired Person", @"person job"); }
	else { return @"---"; }
}

- (NSString *)jobString {
	if (officialData) {
		if ([officialData assistantRefereeOnly]) { return NSLocalizedString(@"Assistant Referee", @"person job"); }
		else { return NSLocalizedString(@"Referee", @"person job"); }
	}
	else if (journalistData) { return NSLocalizedString(@"Journalist", @"person job"); }
	else if (agentData) { return NSLocalizedString(@"Agent", @"person job"); }
	else if (spokespersonData) { return NSLocalizedString(@"Spokesperson", @"person job"); }
	else if (staffData) {
		int job;
		if (staffData) { job = [staffData clubJob]; }
		
		if (job==JOB_PLAYER) { return NSLocalizedString(@"Player", @"person job"); }
		else if (job==JOB_COACH) { return NSLocalizedString(@"Coach", @"person job"); }
		else if (job==JOB_CHAIRMAN) { return NSLocalizedString(@"Chairman", @"person job"); }
		else if (job==JOB_DIRECTOR) { return NSLocalizedString(@"Director", @"person job"); }
		else if (job==JOB_MANAGING_DIRECTOR) { return NSLocalizedString(@"Managing Director", @"person job"); }
		else if (job==JOB_DIRECTOR_OF_FOOTBALL) { return NSLocalizedString(@"Director Of Football", @"person job"); }
		else if (job==JOB_PHYSIO) { return NSLocalizedString(@"Physio", @"person job"); }
		else if (job==JOB_SCOUT) { return NSLocalizedString(@"Scout", @"person job"); }
		else if (job==JOB_MANAGER) { return NSLocalizedString(@"Manager", @"person job"); }
		else if (job==JOB_HEAD_COACH) { return NSLocalizedString(@"Head Coach", @"person job"); }
		else if (job==JOB_ASSISTANT_MANAGER) { return NSLocalizedString(@"Assistant Manager", @"person job"); }
		else if (job==JOB_GENERAL_MANAGER) { return NSLocalizedString(@"General Manager", @"person job"); }
		else if (job==JOB_CARETAKER_COACH) { return NSLocalizedString(@"Caretaker Coach", @"person job"); }
		else if (job==JOB_PLAYER_MANAGER) { return NSLocalizedString(@"Player / Manager", @"person job"); }
		else if (job==JOB_COACH) { return NSLocalizedString(@"Coach", @"person job"); }
		else if (job==JOB_PLAYER_COACH) { return NSLocalizedString(@"Player / Coach", @"person job"); }
		else if (job==JOB_PLAYER_ASSISTANT_MANAGER) { return NSLocalizedString(@"Player / Assistant Manager", @"person job"); }
		else if (job==JOB_FITNESS_COACH) { return NSLocalizedString(@"Fitness Coach", @"person job"); }
		else if (job==JOB_PLAYER_FITNESS_COACH) { return NSLocalizedString(@"Player / Fitness Coach", @"person job"); }
		else if (job==JOB_CARETAKER_COACH) { return NSLocalizedString(@"Caretaker / Coach", @"person job"); }
		else if (job==JOB_GOALKEEPING_COACH) { return NSLocalizedString(@"Goalkeeping Coach", @"person job"); }
		else if (job==JOB_PLAYER_GOALKEEPING_COACH) { return NSLocalizedString(@"Player / Goalkeeping Coach", @"person job"); }
		else if (job==JOB_YOUTH_TEAM_COACH) { return NSLocalizedString(@"Youth Team Coach", @"person job"); }
		else if (job==JOB_PLAYER_YOUTH_TEAM_COACH) { return NSLocalizedString(@"Player / Youth Team Coach", @"person job"); }
		else if (job==JOB_FIRST_TEAM_COACH) { return NSLocalizedString(@"First Team Coach", @"person job"); }
		else if (job==JOB_PLAYER_FIRST_TEAM_COACH) { return NSLocalizedString(@"Player / First Team Coach", @"person job"); }
	}
	return @"---";
}

- (NSString *)positionString
{
	if (!playerStats) { return @""; }
	
	NSMutableString *position = [[NSMutableString alloc] init];
	
	if ([playerStats goalkeeper]>=15) { return @"GK"; }
	if ([playerStats sweeper]>=15) { 
		[position appendString:@"SW"];
	}
	if ([playerStats leftDefender]>=15 ||
		[playerStats rightDefender]>=15 ||
		[playerStats centralDefender]>=15) {
		if ([position length]>0) { [position appendString:@", "]; }
		[position appendString:@"D "];
		if ([playerStats rightDefender]>=15) { [position appendString:@"R"]; }
		if ([playerStats leftDefender]>=15) { [position appendString:@"L"]; }
		if ([playerStats centralDefender]>=15) { [position appendString:@"C"]; }
	}
	if ([playerStats leftWingBack]>=15 ||
		[playerStats rightWingBack]>=15) {
		if ([position length]>0) { [position appendString:@", "]; }
		[position appendString:@"WB "];
		if ([playerStats rightWingBack]>=15) { [position appendString:@"R"]; }
		if ([playerStats leftWingBack]>=15) { [position appendString:@"L"]; }
	}
	if ([playerStats centralDefensiveMidfielder]>=15) {
		if ([position length]>0) { [position appendString:@", "]; }
		[position appendString:@"DM"];
	}
	
	if ([playerStats leftAttackingMidfielder]>=15 ||
		[playerStats rightAttackingMidfielder]>=15 ||
		[playerStats centralAttackingMidfielder]>=15) {
		if ([position length]>0) { [position appendString:@", "]; }
		[position appendString:@"AM "];
	}
	else if ([playerStats leftMidfielder]>=15 ||
			 [playerStats rightMidfielder]>=15 ||
			 [playerStats centralMidfielder]>=15) {
		if ([position length]>0) { [position appendString:@", "]; }
		[position appendString:@"M "];
	}
	
	if ([playerStats leftAttackingMidfielder]>=15 || [playerStats rightAttackingMidfielder]>=15 ||
		[playerStats centralAttackingMidfielder]>=15 || [playerStats leftMidfielder]>=15 ||
		[playerStats rightMidfielder]>=15 || [playerStats centralMidfielder]>=15) {
		if ([playerStats rightMidfielder]>=15 || [playerStats rightAttackingMidfielder]>=15) {
			[position appendString:@"R"];
		}
		if ([playerStats leftMidfielder]>=15 || [playerStats leftAttackingMidfielder]>=15) {
			[position appendString:@"L"];
		}
		if ([playerStats centralMidfielder]>=15 || [playerStats centralAttackingMidfielder]>=15) {
			[position appendString:@"C"];
		}
	}
	
	if ([playerStats centreForward]>=15) {
		if ([position length]>0) { [position appendString:@", "]; }
		[position appendString:@"F C"];
	}
	
	if ([position length]>0) { return position; }
	
	return @"";
}

- (int)age
{
	if (personData) {
		short dobYear = [[personData dateOfBirth] year];
		short currentYear = [[controller currentDate] year];
		short dobMonth = [[[[controller currentDate] date] descriptionWithCalendarFormat:@"%m" timeZone:nil locale:nil] intValue]; 
		short currentMonth = [[[[personData dateOfBirth] date] descriptionWithCalendarFormat:@"%m" timeZone:nil locale:nil] intValue]; 
		short dobDay = [[[[controller currentDate] date] descriptionWithCalendarFormat:@"%d" timeZone:nil locale:nil] intValue]; 
		short currentDay = [[[[personData dateOfBirth] date] descriptionWithCalendarFormat:@"%d" timeZone:nil locale:nil] intValue]; 
		
		short monthDiff = currentMonth - dobMonth;
		short dayDiff = currentDay - dobDay;
		
		int age = currentYear - dobYear;
		
		if (monthDiff <= 0 && dayDiff < 0) { age--; }
		
		return age;
	}
	
	return 0;
}

- (BOOL)contractIsExpiring
{
	if ([[staffData contracts] count]>0) {
		if ([[[[[staffData contracts] objectAtIndex:0] endDate] date] timeIntervalSinceDate:[[controller currentDate] date]] < (60*60*24*30*6)) {
			return TRUE;
		}
	}
	return FALSE;
}
- (BOOL)contractIsExpired
{
	if ([[staffData contracts] count]>0) {
		if ([[[controller currentDate] date] laterDate:[[[[staffData contracts] objectAtIndex:0] endDate] date]]==[[controller currentDate] date])
		{
			return TRUE;
		}

	}
	return FALSE;
}

- (BOOL)isECNational
{
	if (personData) {
		if ([[[[controller database] nations] objectAtIndex:[personData nationID]] EECNation]==NGM_EEC_COUNTRY)
		{
			return TRUE;
		}
		
		for (Relationship *item in [personData relationships]) {
			if ([item relationshipType]==RT_HAS_NATIONALITY)
			{
				if ([[[[controller database] nations] objectAtIndex:[item associatedID]] EECNation]==NGM_EEC_COUNTRY)
				{
					return TRUE;
				}
			}
		}
	}
	
	return FALSE;
}

- (BOOL)acceptedContractOffer
{
	if ([[staffData contractOffers] count]>0) {
		for (ContractOffer *item in [staffData contractOffers]) {
			if ([item decision]==COD_ACCEPTED) { return TRUE; }
		}
	}
	
	return FALSE;
}

- (BOOL)isTransferListed
{
	if ([[staffData contracts] count] > 0) {
		if ([[[staffData contracts] objectAtIndex:0] transferListedByRequest] ||
			[[[staffData contracts] objectAtIndex:0] transferListedByClub]) { return TRUE; }
	}
	
	return FALSE;
}

- (BOOL)isListedForLoan
{
	if ([[staffData contracts] count] > 0) {
		if ([[[staffData contracts] objectAtIndex:0] listedForLoan]) { return TRUE; }
	}
	
	return FALSE;
}

- (NSImage *)playerGrowthPotential
{
	if (playerStats && personStats) {
		if ([self playerGrowthPotentialVal]<0.5) { return [NSImage imageNamed:@"0star.png"]; }
		else if ([self playerGrowthPotentialVal]<1) { return [NSImage imageNamed:@"1star.png"]; }
		else if ([self playerGrowthPotentialVal]<1.5) { return [NSImage imageNamed:@"2star.png"]; }
		else if ([self playerGrowthPotentialVal]<2) { return [NSImage imageNamed:@"3star.png"]; }
		else if ([self playerGrowthPotentialVal]<2.5) { return [NSImage imageNamed:@"4star.png"]; }
		else if ([self playerGrowthPotentialVal]<3) { return [NSImage imageNamed:@"5star.png"]; }
		else if ([self playerGrowthPotentialVal]<3.5) { return [NSImage imageNamed:@"6star.png"]; }
		else if ([self playerGrowthPotentialVal]<4) { return [NSImage imageNamed:@"7star.png"]; }
		else if ([self playerGrowthPotentialVal]<4.5) { return [NSImage imageNamed:@"8star.png"]; }
		else if ([self playerGrowthPotentialVal]<5) { return [NSImage imageNamed:@"9star.png"]; }
		else { return [NSImage imageNamed:@"10star.png"]; }
	}
	return [NSImage imageNamed:@"0star.png"];
}

- (float)playerGrowthPotentialVal
{
	if (playerStats && personStats) {
		float DAP = (([playerStats determination] / 5) * 0.05) + ([personStats ambition] * 0.09) + ([personStats professionalism] * 0.115);
		if ([self age]<24) {
			if ([playerData potentialAbility] <= ([playerData currentAbility]+10)) { DAP = DAP - 0.5; }
		}
		else if ([self age] >= 24 && [self age] < 29) {
			DAP = DAP - 0.5;
			if ([playerData potentialAbility] <= ([playerData currentAbility]+10)) { DAP = DAP - 0.5; }
		}
		else if ([self age] >= 29 && [self age] < 34) {
			DAP = DAP - 1;
			if ([playerData potentialAbility] <= ([playerData currentAbility]+10)) { DAP = DAP - 0.5; }
		}
		else if ([self age] >= 34) {
			if ([playerData potentialAbility] <= ([playerData currentAbility]+10) && [playerStats goalkeeper] >= 15) { DAP = 0.5; }
			else { DAP = 0; }
		}
		
		NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
		[formatter setNumberStyle:NSNumberFormatterDecimalStyle];
		[formatter setMinimumFractionDigits:2];
		[formatter setMaximumFractionDigits:2];
		[formatter setMaximum:[NSNumber numberWithInt:5]];
		[formatter setMinimum:[NSNumber numberWithInt:0]];
		NSString *str = [formatter stringFromNumber:[NSNumber numberWithFloat:DAP]];
		float rating = [str floatValue];
		
		NSLog(@"DAP:%f  R:%f",DAP,rating);
		
		return rating;
	}
	return 0.0;
}

- (void)changeName
{
	// check if the type is ok
	if (databaseClass != DBC_NON_PLAYER && databaseClass != DBC_PLAYER &&
		databaseClass != DBC_OFFICIAL && databaseClass != DBC_PLAYER_AND_NON_PLAYER &&
		databaseClass != DBC_HUMAN && databaseClass != DBC_SPOKESPERSON &&
		databaseClass != DBC_JOURNALIST)
	{ return; }
	
	NSMutableString *expression;
	NSPredicate *predicate;
	NSMutableArray *tempArray;
	
	// first name
	if ([theNewFirstName length]>0) {
		// search for an existing name & nation
		expression = [NSMutableString stringWithFormat:@"(name == '%@')",theNewFirstName];
		[expression appendFormat:@" AND (nationID == %d)",[personData nationID]];
		predicate = [NSPredicate predicateWithFormat:expression];
		tempArray = [[NSMutableArray alloc] init];
		[tempArray addObjectsFromArray:[[[controller database] firstNames] filteredArrayUsingPredicate:predicate]];
		
		if ([tempArray count]==0) {
			Name *name1 = [[Name alloc] init];
			[name1 setNationID:[personData nationID]];
			[name1 setName:theNewFirstName];
			[name1 setRowID:[[[controller database] firstNames] count]];
			[name1 setUID:UID];
			[name1 setCount:1];
			[[[controller database] firstNames] addObject:name1];
			[personData setFirstNameID:[name1 rowID]];
			[name1 release];
		}
		else {
			[personData setFirstNameID:[[tempArray objectAtIndex:0] rowID]];
			short newCount = [(NSMutableArray *)[tempArray objectAtIndex:0] count] + 1;
			[[[[controller database] firstNames] objectAtIndex:[[tempArray objectAtIndex:0] rowID]] setCount:newCount];
		}
		
		[tempArray release];
	}
	
	// surname
	if ([theNewSurname length]>0) {
		// search for an existing name & nation
		expression = [NSMutableString stringWithFormat:@"(name == '%@')",theNewSurname];
		[expression appendFormat:@" AND (nationID == %d)",[personData nationID]];
		predicate = [NSPredicate predicateWithFormat:expression];
		tempArray = [[NSMutableArray alloc] init];
		[tempArray addObjectsFromArray:[[[controller database] surnames] filteredArrayUsingPredicate:predicate]];
		
		if ([tempArray count]==0) {
			Name *name1 = [[Name alloc] init];
			[name1 setNationID:[personData nationID]];
			[name1 setName:theNewSurname];
			[name1 setRowID:[[[controller database] surnames] count]];
			[name1 setUID:UID];
			[name1 setCount:1];
			[[[controller database] surnames] addObject:name1];
			[personData setSurnameID:[name1 rowID]];
			[name1 release];
		}
		else {
			[personData setSurnameID:[[tempArray objectAtIndex:0] rowID]];
			short newCount = [(NSMutableArray *)[tempArray objectAtIndex:0] count] + 1;
			[[[[controller database] surnames] objectAtIndex:[[tempArray objectAtIndex:0] rowID]] setCount:newCount];
		}
		
		[tempArray release];
	}
	
	// common name
	if ([theNewCommonName length]>0) {
		// search for an existing name & nation
		expression = [NSMutableString stringWithFormat:@"(name == '%@')",theNewCommonName];
		[expression appendFormat:@" AND (nationID == %d)",[personData nationID]];
		predicate = [NSPredicate predicateWithFormat:expression];
		tempArray = [[NSMutableArray alloc] init];
		[tempArray addObjectsFromArray:[[[controller database] commonNames] filteredArrayUsingPredicate:predicate]];
		
		if ([tempArray count]==0) {
			Name *name1 = [[Name alloc] init];
			[name1 setNationID:[personData nationID]];
			[name1 setName:theNewCommonName];
			[name1 setRowID:[[[controller database] commonNames] count]];
			[name1 setUID:UID];
			[name1 setCount:1];
			[[[controller database] commonNames] addObject:name1];
			[personData setCommonNameID:[name1 rowID]];
			[name1 release];
		}
		else {
			[personData setCommonNameID:[[tempArray objectAtIndex:0] rowID]];
			short newCount = [(NSMutableArray *)[tempArray objectAtIndex:0] count] + 1;
			[[[[controller database] commonNames] objectAtIndex:[[tempArray objectAtIndex:0] rowID]] setCount:newCount];
		}
		
		[tempArray release];
	}
}

- (BOOL)canTransfer
{
	if (playerData) { return TRUE; }
	return FALSE;
}

- (void)transfer
{
	if (![self canTransfer] || transferID < 0 || transferID >= [[[controller database] clubs] count] ||
		[[[[[[controller database] clubs] objectAtIndex:transferID] teamContainer] teams] count]==0) { return; }
	
	Team *currentTeam;
	Club *currentClub;
	
	if ([staffData clubTeamID]>-1) {
		currentTeam = [[[controller database] teams] objectAtIndex:[staffData clubTeamID]];
		currentClub = [[[controller database] clubs] objectAtIndex:[currentTeam teamContainerID]];
	}
	
	
	// remove from old teams list
	if (playerData && [staffData clubTeamID]>-1 && [[currentTeam players] containsObject:[NSNumber numberWithInt:rowID]]) {
		[[currentTeam players] removeObject:[NSNumber numberWithInt:rowID]];
	}

	// add to new teams list
	int newTeamID = [[[[[[[controller database] clubs] objectAtIndex:transferID] teamContainer] teams] objectAtIndex:0] intValue];
	
	[[[[[controller database] teams] objectAtIndex:newTeamID] players] addObject:[NSNumber numberWithInt:newTeamID]];
	
	// change club in players contract
	if ([[staffData contracts] count]>0) {
		[[[staffData contracts] objectAtIndex:0] setStartDate:[controller currentDate]];
		[[[staffData contracts] objectAtIndex:0] setClubID:transferID];
	}
}

@end
