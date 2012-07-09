//
//  CitySaver.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/14.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "City.h"

@interface CitySaver : NSObject {

}

+ (void)saveCity:(City *)object toData:(NSMutableData *)data;

@end
