//
//  Media.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/29.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "FMDate.h"

// style
#define MST_NOT_SET		0
#define MST_TABLOID		1
#define MST_BROADSHEET	2

// scope
#define MSC_CLUB		1
#define MSC_LOCAL		2
#define MSC_REGIONAL	3
#define MSC_NATIONAL	4
#define MSC_CONTINENTAL	5
#define MSC_WORLDWIDE	6
#define MSC_COMPETITION	7

// period
#define MP_ANYTIME			1
#define MP_WEEKDAY_MORNING	2
#define MP_SUNDAY			3
#define MP_WEEKLY			4
#define MP_MONTHLY			5
#define MP_BI_MONTHLY		6
#define MP_QUARTERLY		7
#define MP_YEARLY			8
#define MP_WEEKDAY_EVENING	9
#define MP_MONDAY			10
#define MP_TUESDAY			11
#define MP_WEDNESDAY		12
#define MP_THURSDAY			13
#define MP_FRIDAY			14
#define MP_SATURDAY			15

// type
#define MT_NOT_SET			0
#define MT_NEWSPAPER		1
#define MT_MAGAZINE			2
#define MT_FANZINE			3
#define MT_RADIO			4
#define MT_TV				5
#define MT_WEBSITE			6
#define MT_BOOKMAKER		7
#define MT_INJURY_SPONSOR	8
#define MT_KIT_SPONSOR		9

@interface Media : NSObject {
	char databaseClass, nameGender, period, scope, style;
	BOOL fake;
	int cityID, localAreaID, continentID, rowID, UID;
	
	FMDate *lastPublishedDate;
	NSMutableArray *competitions, *nations, *clubs, *linkedMedia, *types, *journalists;
	NSString *name, *URL;
}

@property(assign,readwrite) char databaseClass, nameGender, period, scope, style;
@property(assign,readwrite) BOOL fake;
@property(assign,readwrite) int cityID, localAreaID, continentID, rowID, UID;
@property(assign,readwrite) FMDate *lastPublishedDate;
@property(copy,readwrite) NSMutableArray *competitions, *nations, *clubs, *linkedMedia, *types,
*journalists;
@property(copy,readwrite) NSString *name, *URL;

- (NSArray *)periodStrings;
- (NSArray *)scopeStrings;
- (NSArray *)styleStrings;
- (NSArray *)typeStrings;

@end
