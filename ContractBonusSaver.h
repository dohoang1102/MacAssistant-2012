//
//  ContractBonusSaver.h
//  FM11SX
//
//  Created by Amy Kettlewell on 10/11/27.
//  Copyright 2010 littleblue. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ContractBonus.h"

@interface ContractBonusSaver : NSObject {

}

+ (void)saveBonus:(ContractBonus *)object toData:(NSMutableData *)data;

@end
