//
//  LangDB.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/27.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "LanguageIDs.h"

@interface LangDB : NSObject {
	NSMutableDictionary *offsets, *cityLang, *clubLang, *continentLang, *injuryLang;
	NSMutableDictionary *nationLang, *awardLang, *stadiumLang, *stageNameLang;
	NSMutableDictionary *compLang, *regionLang, *descriptionLang, *mediaLang, *localAreaLang,
	*agreementLang, *derbyLang;
}

@property(copy,readwrite) NSMutableDictionary *offsets, *cityLang, *clubLang, 
*continentLang, *injuryLang, *nationLang, *awardLang, *stadiumLang, *compLang, 
*regionLang, *descriptionLang, *mediaLang, *stageNameLang, *localAreaLang,
*agreementLang, *derbyLang;

+ (void)extractLangDB:(NSString *)path;

@end
