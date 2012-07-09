//
//  TeamLoader.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/17.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Loader.h"
#import "Team.h"

@interface Loader (TeamLoader)

+ (Team *)readTeamFromData:(NSData *)data atOffset:(unsigned int *)byteOffset version:(short)version;

@end
