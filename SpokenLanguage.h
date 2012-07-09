//
//  SpokenLanguage.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/17.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface SpokenLanguage : NSObject {
	char speakersPercentage;
	int languageID;
}

@property(assign,readwrite) char speakersPercentage;
@property(assign,readwrite) int languageID;

@end
