//
//  ClubDebtLoader.h
//  FM10SX
//
//  Created by Amy Kettlewell on 10/10/17.
//  Copyright 2010 littleblue. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Loader.h"
#import "ClubDebt.h"

@interface Loader (ClubDebtLoader)

+ (id)readDebtFromData:(NSData *)data atOffset:(unsigned int *)byteOffset;

@end
