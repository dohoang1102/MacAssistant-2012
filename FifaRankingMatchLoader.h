//
//  FifaRankingMatchLoader.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/16.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "FifaRankingMatch.h"

@interface FifaRankingMatchLoader : NSObject {

}

+ (FifaRankingMatch *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset;

@end
