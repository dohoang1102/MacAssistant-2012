//
//  RelationshipSaver.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/23.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Relationship.h"

@interface RelationshipSaver : NSObject {

}

+ (void)saveRelationship:(Relationship *)object toData:(NSMutableData *)data;

@end
