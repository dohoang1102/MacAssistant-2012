//
//  ClubFinanceLoader.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/25.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ClubFinance.h"

@interface ClubFinanceLoader : NSObject {

}

+ (ClubFinance *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset version:(short)version;

@end
