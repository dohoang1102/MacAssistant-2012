//
//  RegionalDivisionSaver.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/23.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "RegionalDivision.h"

@interface RegionalDivisionSaver : NSObject {

}

+ (void)saveDivision:(RegionalDivision *)object toData:(NSMutableData *)data;

@end
