//
//  ScoutingKnowledgeLoader.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/25.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ScoutingKnowledge.h"
#import "GameVersions.h"

@interface ScoutingKnowledgeLoader : NSObject {

}

+ (ScoutingKnowledge *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset version:(short)version;

@end
