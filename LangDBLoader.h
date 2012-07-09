//
//  LangDBLoader.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/27.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "LangDB.h"

@interface LangDBLoader : NSObject {

}

+ (LangDB *)readFromFile:(NSString *)path;

@end
