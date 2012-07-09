//
//  RetiredPerson.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/22.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface RetiredPerson : NSObject {
	char job, unknownChar1, unknownChar2;
	NSString *firstName, *surname;
}

@property(readwrite,assign) char job, unknownChar1, unknownChar2;
@property(readwrite,copy) NSString *firstName, *surname;

@end
