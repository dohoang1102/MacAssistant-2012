//
//  TeamContainerSaver.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/23.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "TeamContainer.h"

@interface TeamContainerSaver : NSObject {

}

+ (void)saveTeamContainer:(TeamContainer *)object toData:(NSMutableData *)data;

@end
