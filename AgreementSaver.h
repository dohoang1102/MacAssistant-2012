//
//  AgreementSaver.h
//  FM11SX
//
//  Created by Amy Kettlewell on 10/11/27.
//  Copyright 2010 littleblue. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Agreement.h"

@interface AgreementSaver : NSObject {

}

+ (void)saveAgreement:(Agreement *)object toData:(NSMutableData *)data;

@end
