//
//  DerbySaver.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/14.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Derby.h"

@interface DerbySaver : NSObject {
	
}

+ (void)saveDerby:(Derby *)object toData:(NSMutableData *)data;

@end
