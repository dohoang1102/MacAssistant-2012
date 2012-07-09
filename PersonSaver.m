//
//  PersonSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 10/07/25.
//  Copyright 2010 EnjoyLocally.co.uk. All rights reserved.
//

#import "PersonSaver.h"
#import "DatabaseTypes.h"
#import "PlayerSaver.h"
#import "StaffSaver.h"
#import "ActualPersonSaver.h"
#import "NonPlayerSaver.h"
#import "OfficialSaver.h"
#import "RetiredPersonSaver.h"
#import "JournalistSaver.h"
#import "SpokespersonSaver.h"
#import "HumanSaver.h"
#import "VirtualPlayerSaver.h"
#import "PlayerAndNonPlayerSaver.h"
#import "AgentSaver.h"

@implementation PersonSaver

+ (void)savePerson:(Person *)object toData:(NSMutableData *)data version:(short)version
{
	char cbuffer;
	unsigned char ucbuffer;
	int ibuffer;
	
	cbuffer = [object databaseClass];
	[data appendBytes:&cbuffer length:1];
	
	if ([object databaseClass]==DBC_PLAYER) {
		[PlayerSaver savePlayer:[object playerData] toData:data version:version];
		[StaffSaver saveStaff:[object staffData] toData:data version:version];
		[ActualPersonSaver saveActualPerson:[object personData] toData:data];
	}
	else if ([object databaseClass]==DBC_NON_PLAYER) {
		[NonPlayerSaver saveNonPlayer:[object nonPlayerData] toData:data];
		[StaffSaver saveStaff:[object staffData] toData:data version:version];
		[ActualPersonSaver saveActualPerson:[object personData] toData:data];
	}
	else if ([object databaseClass]==DBC_PLAYER_AND_NON_PLAYER) {
		[PlayerSaver savePlayer:[object playerData] toData:data version:version];
		[NonPlayerSaver saveNonPlayer:[object nonPlayerData] toData:data];
		[StaffSaver saveStaff:[object staffData] toData:data version:version];
		[ActualPersonSaver saveActualPerson:[object personData] toData:data];
	}
	else if ([object databaseClass]==DBC_OFFICIAL) {
		[OfficialSaver saveOfficial:[object officialData] toData:data];
		[ActualPersonSaver saveActualPerson:[object personData] toData:data];
	}
	else if ([object databaseClass]==DBC_RETIRED_PERSON) {
		[RetiredPersonSaver saveRetiredPerson:[object retiredPersonData] toData:data];
	}
	else if ([object databaseClass]==DBC_JOURNALIST) {
		[JournalistSaver saveJournalist:[object journalistData] toData:data];
		[ActualPersonSaver saveActualPerson:[object personData] toData:data];
	}
	else if ([object databaseClass]==DBC_VIRTUAL_PLAYER) {
		[VirtualPlayerSaver savePlayer:[object virtualPlayerData] toData:data];
	}
	else if ([object databaseClass]==DBC_SPOKESPERSON) {
		[SpokespersonSaver saveSpokesperson:[object spokespersonData] toData:data];
		[ActualPersonSaver saveActualPerson:[object personData] toData:data];
	}
	else if ([object databaseClass]==DBC_HUMAN) {
		[HumanSaver saveHuman:[object humanData] toData:data version:version];
		[NonPlayerSaver saveNonPlayer:[object nonPlayerData] toData:data];
		[StaffSaver saveStaff:[object staffData] toData:data version:version];
		[ActualPersonSaver saveActualPerson:[object personData] toData:data];
	}
	else if ([object databaseClass]==DBC_UNKNOWN_PERSON_TYPE_1) {
		cbuffer = [object unknownChar1];
		[data appendBytes:&cbuffer length:1];
		[data appendData:[object unknownData1]];
	}
	else if ([object databaseClass]==DBC_UNKNOWN_PERSON_TYPE_2) {
		[data appendData:[object unknownData1]];
	}
	else if ([object databaseClass]==DBC_AGENT) {
		[AgentSaver saveAgent:[object agentData] toData:data];
		[ActualPersonSaver saveActualPerson:[object personData] toData:data];
	}
	
	ucbuffer = [object flags];
	[data appendBytes:&ucbuffer length:1];
	ibuffer = [object rowID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object UID];
	[data appendBytes:&ibuffer length:4];
	
	if ([object databaseClass]==DBC_PLAYER_AND_NON_PLAYER) {
		[PlayerAndNonPlayerSaver savePlayerAndNonPlayer:[object playerAndNonPlayerData] toData:data];
	}
}

@end
