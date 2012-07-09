//
//  FixtureSaver.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/31.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Fixture.h"

@interface FixtureSaver : NSObject {

}

+ (void)saveFixture:(Fixture *)object toData:(NSMutableData *)data;

@end
