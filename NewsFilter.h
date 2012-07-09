//
//  NewsFilter.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/22.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface NewsFilter : NSObject {
	char unknownChar1;
	NSData *unknownData1, *unknownData2;
	NSMutableArray *infos;
	NSString *type, *unknownString1;
}

@property(assign,readwrite) char unknownChar1;
@property(copy,readwrite) NSData *unknownData1, *unknownData2;
@property(copy,readwrite) NSMutableArray *infos;
@property(copy,readwrite) NSString *type, *unknownString1;

@end
