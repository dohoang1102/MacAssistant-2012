//
//  NameSaver.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/18.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Name.h"

@interface NameSaver : NSObject {

}

+ (void)saveName:(Name *)object toData:(NSMutableData *)data;

@end
