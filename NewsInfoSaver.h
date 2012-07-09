//
//  NewsInfoSaver.h
//  FM10SX
//
//  Created by Amy Kettlewell on 10/07/26.
//  Copyright 2010 littleblue. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "NewsInfo.h"

@interface NewsInfoSaver : NSObject {

}

+ (void)saveInfo:(NewsInfo *)object toData:(NSMutableData *)data inType:(NSString *)type;

@end
