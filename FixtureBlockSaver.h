//
//  FixtureBlockSaver.h
//  FM10SX
//
//  Created by Amy Kettlewell on 10/07/25.
//  Copyright 2010 EnjoyLocally.co.uk. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "FixtureBlock.h"

@interface FixtureBlockSaver : NSObject {

}

+ (void)saveFixtureBlock:(FixtureBlock *)object toData:(NSMutableData *)data;

@end
