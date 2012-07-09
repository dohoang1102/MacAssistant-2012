//
//  HumanSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 10/07/25.
//  Copyright 2010 littleblue. All rights reserved.
//

#import "HumanSaver.h"
#import "Human.h"
#import "GeneralInfoSaver.h"
#import "FMString.h"
#import "SupportFunctions.h"
#import "BookmarkFolderSaver.h"
#import "FMDateSaver.h"
#import "NewsFilterListSaver.h"

@implementation HumanSaver

+ (void)saveHuman:(Human *)object toData:(NSMutableData *)data version:(short)version
{
	char cbuffer;
	short sbuffer;
	int ibuffer;
	BOOL bbuffer;
	
	[data appendData:[object unknownData1]];
	sbuffer = [object unreadNewsItems];
	[data appendBytes:&sbuffer length:2];
	[data appendData:[object unknownData2]];
	[FMDateSaver saveDate:[object holidayReturnDate] toData:data];
	ibuffer = [object fogOfWarIndex];
	[data appendBytes:&ibuffer length:4];
	[data appendData:[object unknownData3]];
	[FMString saveString:[object password] toData:data];
	[data appendData:[object unknownData17]];
	
	ibuffer = [[object infos] count];
	[data appendBytes:&ibuffer length:4];
	for (int i = 0; i<[[object infos] count]; i++) {
		[GeneralInfoSaver saveInfo:[[object infos] objectAtIndex:i] toData:data saveInfo:YES];
	}
	
	[data appendData:[object unknownData4]];
	cbuffer = [object unknownChar1];
	[data appendBytes:&cbuffer length:1];
	[data appendData:[object unknownData5]];
	[data appendData:[object unknownData6]];
	
	ibuffer = [[object newsFilterLists] count];
	[data appendBytes:&ibuffer length:4];
	for (int i = 0; i<[[object newsFilterLists] count]; i++) {
		[NewsFilterListSaver saveFilterList:[[object newsFilterLists] objectAtIndex:i] toData:data version:version];
	}
	
	cbuffer = [object unknownChar2];
	[data appendBytes:&cbuffer length:1];
	
	[SupportFunctions saveCString:@"LLUN" toData:data];
	[data appendData:[object unknownData7]];
	
	cbuffer = [[object mediaDecisions] count];
	[data appendBytes:&cbuffer length:1];
	for (int i = 0; i<[[object mediaDecisions] count]; i++) {
		
		ibuffer = [[[object mediaDecisions] objectAtIndex:i] count];
		[data appendBytes:&ibuffer length:4];
		for (int j = 0; j<[[[object mediaDecisions] objectAtIndex:i] count]; j++) {
			[GeneralInfoSaver saveInfo:[[[object mediaDecisions] objectAtIndex:i] objectAtIndex:j] toData:data saveInfo:YES];
		}
		
	}
	
	sbuffer = [object unknownShort1];
	[data appendBytes:&sbuffer length:2];
	[data appendData:[object unknownData8]];
	sbuffer = [object unknownShort2];
	[data appendBytes:&sbuffer length:2];
	[data appendData:[object unknownData9]];
	[data appendData:[object unknownData10]];
	sbuffer = [object unknownShort3];
	[data appendBytes:&sbuffer length:2];
	[data appendData:[object unknownData11]];
	sbuffer = [object unknownShort4];
	[data appendBytes:&sbuffer length:2];
	[data appendData:[object unknownData13]];
	
	[data appendData:[object unknownData12]];
	ibuffer = [object unknownInt1];
	[data appendBytes:&ibuffer length:4];
	[data appendData:[object unknownData15]];
	
	ibuffer = [object unknownInt3];
	[data appendBytes:&ibuffer length:4];
	[data appendData:[object unknownData14]];
	
	ibuffer = [object unknownInt2];
	[data appendBytes:&ibuffer length:4];
	[data appendData:[object unknownData18]];
	
	[data appendData:[object unknownData16]];
	
	[FMString saveString:[object twitterLogin] toData:data];
	[FMString saveString:[object twitterPassword] toData:data];
	cbuffer = [object twitterUpdateType];
	[data appendBytes:&cbuffer length:1];
	[FMString saveString:[object youtubeLogin] toData:data];
	[FMString saveString:[object youtubePassword] toData:data];
	
	sbuffer = [object topLevelBookmarkItems];
	[data appendBytes:&sbuffer length:2];
	
	if ([object topLevelBookmarkItems]>0) {
		[BookmarkFolderSaver saveFolder:[object bookmarks] toData:data];
	}
	
	bbuffer = [object homePageSet];
	[data appendBytes:&bbuffer length:1];
	
	if ([object homePageSet]) {
		ibuffer = [[object homePageInfos] count];
		[data appendBytes:&ibuffer length:4];
		for (int i = 0; i<[[object homePageInfos] count]; i++) {
			[GeneralInfoSaver saveInfo:[[object homePageInfos] objectAtIndex:i] toData:data saveInfo:YES];
		}
	}
}

@end
