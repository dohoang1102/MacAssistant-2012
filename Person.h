//
//  Person.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/29.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Player.h"
#import "NonPlayer.h"
#import "ActualPerson.h"
#import "Official.h"
#import "Staff.h"
#import "Agent.h"
#import "PlayerAndNonPlayer.h"
#import "RetiredPerson.h"
#import "Journalist.h"
#import "Spokesperson.h"
#import "Human.h"
#import "VirtualPlayer.h"
#import "Controller.h"
#import "PersonStats.h"
#import "PlayerStats.h"
#import "NonPlayerStats.h"

@interface Person : NSObject {
	char databaseClass, unknownChar1;
	unsigned char flags;
	int rowID, UID, transferID;
	NSData *unknownData1;
	NSString *name, *theNewFirstName, *theNewSurname, *theNewCommonName;
	
	Player *playerData;
	PlayerAndNonPlayer *playerAndNonPlayerData;
	NonPlayer *nonPlayerData;
	Staff *staffData;
	ActualPerson *personData;
	Official *officialData;
	RetiredPerson *retiredPersonData;
	VirtualPlayer *virtualPlayerData;
	Spokesperson *spokespersonData;
	Journalist *journalistData;
	Human *humanData;
	Agent *agentData;
	Controller *controller;
	
	PersonStats *personStats;
	PlayerStats *playerStats;
	NonPlayerStats *nonPlayerStats;
}

@property(assign,readwrite) char databaseClass, unknownChar1;
@property(assign,readwrite) unsigned char flags;
@property(assign,readwrite) int rowID, UID, transferID;
@property(readwrite,copy) NSData *unknownData1;
@property(copy,readwrite) NSString *theNewFirstName, *theNewSurname, *theNewCommonName;
@property(nonatomic,copy,readwrite) NSString *name;
@property(assign,readwrite) Player *playerData;
@property(assign,readwrite) NonPlayer *nonPlayerData;
@property(assign,readwrite) Staff *staffData;

@property(assign,readwrite) Agent *agentData;
@property(assign,readwrite) ActualPerson *personData;
@property(assign,readwrite) PlayerAndNonPlayer *playerAndNonPlayerData;
@property(assign,readwrite) Official *officialData;
@property(assign,readwrite) RetiredPerson *retiredPersonData;
@property(assign,readwrite) VirtualPlayer *virtualPlayerData;
@property(assign,readwrite) Spokesperson *spokespersonData;
@property(assign,readwrite) Journalist *journalistData;
@property(assign,readwrite) Human *humanData;
@property(assign,readwrite) Controller *controller;
@property(assign,readwrite) PersonStats *personStats;
@property(assign,readwrite) PlayerStats *playerStats;
@property(assign,readwrite) NonPlayerStats *nonPlayerStats;

- (NSString *)nationString;
- (NSImage *)nationFlag;
- (NSString *)nationalTeamString;
- (NSString *)teamString;
- (NSString *)jobString;
- (NSString *)typeString;
- (NSString *)positionString;
- (NSString *)dobPreviewString;
- (NSString *)mainContractType;
- (NSString *)mainContractStartDate;
- (NSString *)mainContractEndDate;
- (NSString *)mainContractSquadStatus;
- (NSString *)mainContractTransferStatus;
- (NSString *)mainContractClubName;
- (int)mainContractHappiness;
- (NSString *)secondContractType;
- (NSString *)secondContractStartDate;
- (NSString *)secondContractEndDate;
- (NSString *)secondContractSquadStatus;
- (NSString *)secondContractTransferStatus;
- (NSString *)secondContractClubName;
- (int)secondContractWage;
- (int)secondContractHappiness;
- (int)age;
- (NSString *)ageString;
- (NSImage *)playerGrowthPotential;
- (float)playerGrowthPotentialVal;
- (int)contractWage;

- (BOOL)contractIsExpired;
- (BOOL)contractIsExpiring;
- (BOOL)isECNational;
- (BOOL)acceptedContractOffer;
- (BOOL)isTransferListed;
- (BOOL)isListedForLoan;
- (BOOL)canTransfer;
- (void)transfer;

@end
