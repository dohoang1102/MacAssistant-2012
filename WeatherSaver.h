//
//  WeatherSaver.h
//  FM10SX
//
//  Created by Amy Kettlewell on 10/07/25.
//  Copyright 2010 EnjoyLocally.co.uk. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Weather.h"

@interface WeatherSaver : NSObject {

}

+ (void)saveWeather:(Weather *)object toData:(NSMutableData *)data;

@end
