//
//  FifaRankingMatch.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/16.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface FifaRankingMatch : NSObject {
	char points, month, unknownChar;
	short year;
}

@property(readwrite,assign) char points, month, unknownChar;
@property(readwrite,assign) short year;

@end
