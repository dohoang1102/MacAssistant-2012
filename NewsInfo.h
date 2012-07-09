//
//  NewsInfo.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/22.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface NewsInfo : NSObject {
	char unknownChar1;
	int unknownInt1;
	NSData *unknownData1, *unknownData2, *unknownData3;
	NSString *type, *unknownString1;
	NSMutableArray *infos;
}

@property(assign,readwrite) char unknownChar1;
@property(assign,readwrite) int unknownInt1;
@property(readwrite,copy) NSData *unknownData1, *unknownData2, *unknownData3;
@property(readwrite,copy) NSString *type, *unknownString1;
@property(readwrite,copy) NSMutableArray *infos;

@end
