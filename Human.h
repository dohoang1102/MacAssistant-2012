//
//  Human.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/22.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "BookmarkFolder.h"
#import "FMDate.h"

#define MAX_HUMAN_PREFERRED_PLAYERS		16

// twitter update types
#define TUT_MANUAL		0
#define TUT_AUTOMATIC	1

@interface Human : NSObject {
	BOOL homePageSet;
	char unknownChar1, unknownChar2, twitterUpdateType;
	short unreadNewsItems, topLevelBookmarkItems, unknownShort1, unknownShort2, unknownShort3, unknownShort4;
	int fogOfWarIndex, unknownInt1, unknownInt2, unknownInt3;
	BookmarkFolder *bookmarks;
	FMDate *holidayReturnDate;
	NSData *unknownData1, *unknownData2, *unknownData3, *unknownData4, *unknownData5, *unknownData6,
	*unknownData7, *unknownData8, *unknownData9, *unknownData10, *unknownData11, *unknownData12, 
	*unknownData13, *unknownData14, *unknownData15, *unknownData16, *unknownData17, *unknownData18, *unknownData19;
	NSMutableArray *homePageInfos, *mediaDecisions, *newsFilterLists, *pressConferences, *infos;
	NSString *password, *twitterLogin, *twitterPassword, *youtubeLogin, *youtubePassword;
}

@property(assign,readwrite) BOOL homePageSet;
@property(assign,readwrite) char unknownChar1, unknownChar2, twitterUpdateType;
@property(assign,readwrite) short unreadNewsItems, topLevelBookmarkItems, unknownShort1, unknownShort2, 
unknownShort3, unknownShort4;
@property(assign,readwrite) int fogOfWarIndex, unknownInt1, unknownInt2, unknownInt3;
@property(assign,readwrite) BookmarkFolder *bookmarks;
@property(assign,readwrite) FMDate *holidayReturnDate;
@property(copy,readwrite) NSString *password, *twitterLogin, *twitterPassword, *youtubeLogin, *youtubePassword;
@property(copy,readwrite) NSMutableArray *homePageInfos, *mediaDecisions, *newsFilterLists, 
*pressConferences, *infos;
@property(copy,readwrite) NSData *unknownData1, *unknownData2, *unknownData3, *unknownData4, *unknownData5, *unknownData6,
*unknownData7, *unknownData8, *unknownData9, *unknownData10, *unknownData11, *unknownData12, 
*unknownData13, *unknownData14, *unknownData15, *unknownData16, *unknownData17, *unknownData18, *unknownData19;

@end
