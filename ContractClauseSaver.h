//
//  ContractClauseSaver.h
//  FM10SX
//
//  Created by Amy Kettlewell on 10/07/25.
//  Copyright 2010 littleblue. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ContractClause.h"

@interface ContractClauseSaver : NSObject {

}

+ (void)saveClause:(ContractClause *)object toData:(NSMutableData *)data;

@end
