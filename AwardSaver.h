//
//  AwardSaver.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/14.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Award.h"

@interface AwardSaver : NSObject {

}

+ (void)saveAward:(Award *)object toData:(NSMutableData *)data;

@end
