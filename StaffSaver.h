//
//  StaffSaver.h
//  FM10SX
//
//  Created by Amy Kettlewell on 10/07/25.
//  Copyright 2010 littleblue. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Staff.h"

@interface StaffSaver : NSObject {

}

+ (void)saveStaff:(Staff *)object toData:(NSMutableData *)data version:(short)version;

@end
