//
//  PersonLoader.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/01.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ActualPersonLoader.h"
#import "PersonLoader.h"
#import "PlayerLoader.h"
#import "NonPlayerLoader.h"
#import "PlayerAndNonPlayerLoader.h"
#import "RetiredPersonLoader.h"
#import "StaffLoader.h"
#import "AgentLoader.h"
#import "OfficialLoader.h"
#import "VirtualPlayerLoader.h"
#import "SpokespersonLoader.h"
#import "JournalistLoader.h"
#import "HumanLoader.h"
#import "DatabaseTypes.h"
#import "SupportFunctions.h"

@implementation Loader (PersonLoader)

+ (Person *)readPersonFromData:(NSData *)data atOffset:(unsigned int *)byteOffset version:(short)version
{
	char cbuffer;
	int ibuffer;
	BOOL debug = YES;
	
	unsigned int offset = *byteOffset;
	
	Person *object = [[Person alloc] init];
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setDatabaseClass:cbuffer];
	if (debug) { NSLog(@"type: %d",[object databaseClass]); }
	
	if ([object databaseClass]==DBC_PLAYER) {
		[object setPlayerData:[PlayerLoader readFromData:data atOffset:&offset version:version]];
		[object setStaffData:[StaffLoader readFromData:data atOffset:&offset version:version]];
		[object setPersonData:[ActualPersonLoader readFromData:data atOffset:&offset]];
		NSLog(@"Player");
	}
	else if ([object databaseClass]==DBC_NON_PLAYER) {
		[object setNonPlayerData:[NonPlayerLoader readFromData:data atOffset:&offset]];
		[object setStaffData:[StaffLoader readFromData:data atOffset:&offset version:version]];
		[object setPersonData:[ActualPersonLoader readFromData:data atOffset:&offset]];
		NSLog(@"Non Player");
	}
	else if ([object databaseClass]==DBC_PLAYER_AND_NON_PLAYER) {
		[object setPlayerData:[PlayerLoader readFromData:data atOffset:&offset version:version]];
		[object setNonPlayerData:[NonPlayerLoader readFromData:data atOffset:&offset]];
		[object setStaffData:[StaffLoader readFromData:data atOffset:&offset version:version]];
		[object setPersonData:[ActualPersonLoader readFromData:data atOffset:&offset]];
		NSLog(@"P and non Player");
	}
	else if ([object databaseClass]==DBC_OFFICIAL) {
		[object setOfficialData:[OfficialLoader readFromData:data atOffset:&offset]];
		[object setPersonData:[ActualPersonLoader readFromData:data atOffset:&offset]];
		NSLog(@"Official");
	}
	else if ([object databaseClass]==DBC_RETIRED_PERSON) {
		[object setRetiredPersonData:[RetiredPersonLoader readFromData:data atOffset:&offset]];
		NSLog(@"Retired");
	}
	else if ([object databaseClass]==DBC_JOURNALIST) {
		[object setJournalistData:[JournalistLoader readFromData:data atOffset:&offset]];
		[object setPersonData:[ActualPersonLoader readFromData:data atOffset:&offset]];
		NSLog(@"Journalist");
	}
	else if ([object databaseClass]==DBC_VIRTUAL_PLAYER) {
		[object setVirtualPlayerData:[VirtualPlayerLoader readFromData:data atOffset:&offset]];
		NSLog(@"VP");
	}
	else if ([object databaseClass]==DBC_SPOKESPERSON) {
		[object setSpokespersonData:[SpokespersonLoader readFromData:data atOffset:&offset]];
		[object setPersonData:[ActualPersonLoader readFromData:data atOffset:&offset]];
		NSLog(@"spokesperson");
	}
	else if ([object databaseClass]==DBC_HUMAN) {
		// NSLog(@"CurrentOffset: %d, New Offset: %d", offset, (offset + 1201));
		offset += 1190;
//		[object setHumanData:[HumanLoader readFromData:data atOffset:&offset version:version]];
//		[object setNonPlayerData:[NonPlayerLoader readFromData:data atOffset:&offset]];
//		[object setStaffData:[StaffLoader readFromData:data atOffset:&offset version:version]];
//		[object setPersonData:[ActualPersonLoader readFromData:data atOffset:&offset]];
		NSLog(@"Human");
	}
	else if ([object databaseClass]==DBC_UNKNOWN_PERSON_TYPE_1) {
		NSLog(@"Unknown");
		[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
		[object setUnknownChar1:cbuffer];
		if ([object unknownChar1]==0) { 
			[object setUnknownData1:[data subdataWithRange:NSMakeRange(offset, 12)]]; 
			offset += 12;
			NSLog(@"unknown 0");
		}
		else if ([object unknownChar1]==1) { 
			[object setUnknownData1:[data subdataWithRange:NSMakeRange(offset, 8)]]; 
			offset += 8;
			NSLog(@"unknown 1");
		}
		else if ([object unknownChar1]==2) { 
			[object setUnknownData1:[data subdataWithRange:NSMakeRange(offset, 8)]]; 
			offset += 8;
			NSLog(@"unknown 2");
		}
		else if ([object unknownChar1]==3) { 
			[object setUnknownData1:[data subdataWithRange:NSMakeRange(offset, 8)]]; 
			offset += 8;
			NSLog(@"unknown 3");
		}
	}
	else if ([object databaseClass]==DBC_UNKNOWN_PERSON_TYPE_2) {
		[object setUnknownData1:[data subdataWithRange:NSMakeRange(offset, 36)]]; 
		offset += 36;
		NSLog(@"unknown p type 2");
	}
	else if ([object databaseClass]==DBC_AGENT) {
		[object setAgentData:[AgentLoader readFromData:data atOffset:&offset]];
		[object setPersonData:[ActualPersonLoader readFromData:data atOffset:&offset]];
		NSLog(@"Agent");
	}
	else {
		NSLog(@"CRAP");
		[SupportFunctions showErrorWindow:@"Error Loading Person" withInfo:[NSString stringWithFormat:@"Invalid person type - %d",[object databaseClass]]]; 
	}
	
	[data getBytes:&cbuffer range:NSMakeRange(offset, 1)]; offset += 1;
	[object setFlags:cbuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 4;
	[object setRowID:ibuffer];
	[data getBytes:&ibuffer range:NSMakeRange(offset, 4)]; offset += 8; // FM 2012 Double ID
	[object setUID:ibuffer];
	NSLog(@"Outing");
	
	if ([object databaseClass]==DBC_PLAYER_AND_NON_PLAYER) {
		[object setPlayerAndNonPlayerData:[PlayerAndNonPlayerLoader readFromData:data atOffset:&offset]];
		NSLog(@"P AND NP 2");
	}
	if (debug) { NSLog(@"person %d (%d) at %d",[object rowID],[object UID],offset); }
	
	*byteOffset = offset;
	
	return object;
}

@end
