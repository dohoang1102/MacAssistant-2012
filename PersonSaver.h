//
//  PersonSaver.h
//  FM10SX
//
//  Created by Amy Kettlewell on 10/07/25.
//  Copyright 2010 EnjoyLocally.co.uk. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Person.h"

@interface PersonSaver : NSObject {

}

+ (void)savePerson:(Person *)object toData:(NSMutableData *)data version:(short)version;

@end
