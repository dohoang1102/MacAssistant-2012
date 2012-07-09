//
//  TeamSaver.h
//  FM10SX
//
//  Created by Amy Kettlewell on 10/07/25.
//  Copyright 2010 EnjoyLocally.co.uk. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Team.h"

@interface TeamSaver : NSObject {

}

+ (void)saveTeam:(Team *)object toData:(NSMutableData *)data version:(short)version;

@end
