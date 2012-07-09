//
//  GeneralInfoSaver.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/31.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "GeneralInfo.h"

@interface GeneralInfoSaver : NSObject {

}

+ (void)saveInfo:(GeneralInfo *)object toData:(NSMutableData *)data saveInfo:(BOOL)saveInfo;

@end
