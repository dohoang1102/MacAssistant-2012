//
//  InjurySaver.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/31.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Injury.h"

@interface InjurySaver : NSObject {

}

+ (void)saveInjury:(Injury *)object toData:(NSMutableData *)data;

@end
