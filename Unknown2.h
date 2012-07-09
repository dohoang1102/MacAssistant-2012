//
//  Unknown2.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/12/27.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "FMDate.h"

@interface Unknown2 : NSObject {
	char unknownChar1, unknownChar2;
	int unknownInt1, unknownInt2, unknownInt3;
	FMDate *unknownDate;
	NSString *firstName, *surname, *commonName, *businessName;
}

@property(assign,readwrite) char unknownChar1, unknownChar2;
@property(assign,readwrite) int unknownInt1, unknownInt2, unknownInt3;
@property(assign,readwrite) FMDate *unknownDate;
@property(copy,readwrite) NSString *firstName, *surname, *commonName, *businessName;

@end
