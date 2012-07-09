//
//  ContinentSaver.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/18.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Continent.h"

@interface ContinentSaver : NSObject {

}

+ (void)saveContinent:(Continent *)object toData:(NSMutableData *)data;

@end
