//
//  Currency.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/31.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Currency : NSObject {
	char databaseClass;
	NSString *name, *shortName, *threeLetterName, *symbol;
	float exchangeRate, approxExchangeRate, veryApproxExchangeRate;
	int rowID, UID;
}

@property(assign,readwrite) char databaseClass;
@property(assign,readwrite) float exchangeRate, approxExchangeRate, veryApproxExchangeRate;
@property(assign,readwrite) int rowID, UID;
@property(copy,readwrite) NSString *name, *shortName, *threeLetterName, *symbol;

@end
