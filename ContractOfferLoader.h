//
//  ContractOfferLoader.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/21.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ContractOffer.h"

@interface ContractOfferLoader : NSObject {

}

+ (ContractOffer *)readFromData:(NSData *)data atOffset:(unsigned int *)byteOffset version:(short)version;

@end
