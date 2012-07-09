//
//  ContractSaver.h
//  FM10SX
//
//  Created by Amy Kettlewell on 10/07/25.
//  Copyright 2010 littleblue. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Contract.h"

@interface ContractSaver : NSObject {

}

+ (void)saveContract:(Contract *)object toData:(NSMutableData *)data type:(char)type offer:(BOOL)isOffer;

@end
