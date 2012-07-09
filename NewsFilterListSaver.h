//
//  NewsFilterListSaver.h
//  FM10SX
//
//  Created by Amy Kettlewell on 10/07/26.
//  Copyright 2010 littleblue. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "NewsFilterList.h"

@interface NewsFilterListSaver : NSObject {

}

+ (void)saveFilterList:(NewsFilterList *)object toData:(NSMutableData *)data version:(short)version;

@end
