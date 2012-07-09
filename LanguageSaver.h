//
//  LanguageSaver.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/31.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Language.h"

@interface LanguageSaver : NSObject {

}

+ (void)saveLanguage:(Language *)object toData:(NSMutableData *)data;

@end
