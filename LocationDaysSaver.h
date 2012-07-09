//
//  LocationDaysSaver.h
//  FM11SX
//
//  Created by Amy Kettlewell on 10/11/27.
//  Copyright 2010 littleblue. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "LocationDays.h"

@interface LocationDaysSaver : NSObject {

}

+ (void)saveDays:(LocationDays *)object toData:(NSMutableData *)data;

@end
