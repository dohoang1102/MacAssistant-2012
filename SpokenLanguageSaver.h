//
//  SpokenLanguageSaver.h
//  FM10SX
//
//  Created by Amy Kettlewell on 10/01/15.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "SpokenLanguage.h"

@interface SpokenLanguageSaver : NSObject {

}

+ (void)saveLanguage:(SpokenLanguage *)object toData:(NSMutableData *)data;

@end
