//
//  CompetitionHistorySaver.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/14.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "CompetitionHistory.h"

@interface CompetitionHistorySaver : NSObject {
	
}

+ (void)saveCompetitionHistory:(CompetitionHistory *)object toData:(NSMutableData *)data;

@end
