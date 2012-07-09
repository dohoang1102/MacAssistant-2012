//
//  TreatedNations.h
//  FM11SX
//
//  Created by Amy Kettlewell on 10/11/18.
//  Copyright 2010 littleblue. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface TreatedNations : NSObject {
	int nationID, continentID, excludedNationID, regionID, agreementID;
}

@property(assign,readwrite) int nationID, continentID, excludedNationID, regionID, agreementID;

@end
