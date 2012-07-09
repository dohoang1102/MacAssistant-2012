//
//  CurrencySaver.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/18.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Currency.h"

@interface CurrencySaver : NSObject {

}

+ (void)saveCurrency:(Currency *)object toData:(NSMutableData *)data;

@end
