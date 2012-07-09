//
//  ClubDebtSaver.h
//  FM10SX
//
//  Created by Amy Kettlewell on 10/10/17.
//  Copyright 2010 littleblue. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ClubDebt.h"

@interface ClubDebtSaver : NSObject {
	
}

+ (void)saveDebt:(ClubDebt *)object toData:(NSMutableData *)data;

@end