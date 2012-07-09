//
//  TreatedNationsSaver.h
//  FM11SX
//
//  Created by Amy Kettlewell on 10/11/27.
//  Copyright 2010 littleblue. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "TreatedNations.h"

@interface TreatedNationsSaver : NSObject {

}

+ (void)saveNations:(TreatedNations *)object toData:(NSMutableData *)data;

@end
