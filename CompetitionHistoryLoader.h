//
//  CompetitionHistoryLoader.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/17.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Loader.h"

@interface Loader (CompetitionHistoryLoader)

+ (CompetitionHistory *)readCompetitionHistoryFromData:(NSData *)data atOffset:(unsigned int *)byteOffset;

@end
