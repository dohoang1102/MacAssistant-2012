//
//  IDPCSaver.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/18.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "IDPC.h"

@interface IDPCSaver : NSObject {

}

+ (void)saveIDPC:(IDPC *)object toData:(NSMutableData *)data;

@end
