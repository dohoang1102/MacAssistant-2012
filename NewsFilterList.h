	//
//  NewsFilterList.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/22.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface NewsFilterList : NSObject {
	NSString *type;
	NSMutableArray *filters;
	NSData *unknownData1, *unknownData2, *unknownData3;
}

@property(copy,readwrite) NSString *type;
@property(copy,readwrite) NSMutableArray *filters;
@property(readwrite,copy) NSData *unknownData1, *unknownData2, *unknownData3;

@end
