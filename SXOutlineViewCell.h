//
//  SXOutlineViewCell.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/28.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface SXOutlineViewCell : NSTextFieldCell {
	int badgeCount;
	BOOL isChild;
	
	NSImage *image;
	NSMenu *rightClickMenu;
	NSString *text;
	NSColor *backgroundColor, *color;
	NSMutableArray *images;
}

- (void)drawInteriorWithFrame:(NSRect)cellFrame inView:(NSView *)controlView;
- (NSMenu *)menu;

@property (assign,readwrite) int badgeCount;
@property (assign,readwrite) BOOL isChild;
@property (copy, readwrite) NSString *text;
@property (retain, readwrite) NSImage *image;
@property (retain, readwrite) NSMenu *rightClickMenu;
@property (copy, readwrite) NSColor *color, *backgroundColor;
@property (copy, readwrite) NSMutableArray *images;

@end
