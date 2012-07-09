//
//  NewsFilterLoader.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/22.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "NewsFilter.h"

@interface NewsFilterLoader : NSObject {

}

+ (NewsFilter *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset;

@end
