//
//  ClubFinanceSaver.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/23.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ClubFinance.h"

@interface ClubFinanceSaver : NSObject {

}

+ (void)saveFinance:(ClubFinance *)object toData:(NSMutableData *)data version:(short)version;

@end
