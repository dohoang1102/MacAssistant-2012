//
//  ContractBonusLoader.h
//  FM11SX
//
//  Created by Amy Kettlewell on 10/11/15.
//  Copyright 2010 littleblue. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ContractBonus.h"

@interface ContractBonusLoader : NSObject {

}

+ (ContractBonus *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset;

@end
