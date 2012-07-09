//
//  DescriptionSaver.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/18.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Description.h"

@interface DescriptionSaver : NSObject {

}

+ (void)saveDescription:(Description *)object toData:(NSMutableData *)data;

@end
