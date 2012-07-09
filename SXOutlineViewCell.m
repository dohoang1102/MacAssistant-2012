//
//  SXOutlineViewCell.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/28.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "SXOutlineViewCell.h"

@implementation SXOutlineViewCell

@synthesize text, image, badgeCount, isChild, color, backgroundColor, rightClickMenu, images;

// Initialize badge variables, based on Apple Mail.
static int BADGE_BUFFER_LEFT = 4;
static int BADGE_BUFFER_TOP = 10;
static int BADGE_BUFFER_LEFT_SMALL = 2;
static int BADGE_CIRCLE_BUFFER_RIGHT = 5;
static int BADGE_TEXT_HEIGHT = 14;
static int BADGE_X_RADIUS = 7;
static int BADGE_Y_RADIUS = 8;
static int BADGE_TEXT_SMALL = 20;


- (NSColor *)highlightColorInView:(NSView *)controlView
{
    return [NSColor clearColor];
}

- (void)drawInteriorWithFrame:(NSRect)aRect inView:(NSView *)controlView
{
	if (backgroundColor!=nil) {		
		if ([self isHighlighted]) {
			NSColor *backgroundBackup = backgroundColor;
			backgroundColor = color;
			color = backgroundBackup;
		}
		[backgroundColor set];
		NSRectFill(aRect);
	}
	
	NSMutableDictionary * textAttributes = [NSMutableDictionary dictionary];
	if ([self isHighlighted]) { [textAttributes setObject:[NSColor whiteColor] forKey:NSForegroundColorAttributeName]; }
    if (![self isChild]) {
		[textAttributes setObject:[NSFont boldSystemFontOfSize:12.0] forKey:NSFontAttributeName]; 
		[textAttributes setObject:[NSColor grayColor] forKey:NSForegroundColorAttributeName]; 
	}
	else {
		[textAttributes setObject:[NSFont controlContentFontOfSize:12.0] forKey:NSFontAttributeName];
		if (color!=nil) {
			[textAttributes setObject:color forKey:NSForegroundColorAttributeName]; 
	
		}
	}
	NSPoint cellPoint = aRect.origin;
    
    [controlView lockFocus];
    
	int xIndent, xIndent2;
	
	if (image) { xIndent = 40; }
	else { xIndent = 5; }
	
	if (isChild) { xIndent2 = 10; xIndent += 10; }
	
	
	if (image) {
		[image setSize:NSMakeSize(50, 50)];
		[image lockFocus];
		[image unlockFocus];
		[image compositeToPoint:NSMakePoint(cellPoint.x,cellPoint.y+42) operation:NSCompositeSourceOver];
	}
	[text drawAtPoint:NSMakePoint(cellPoint.x+xIndent,
														 cellPoint.y+8) withAttributes:textAttributes];

	[controlView unlockFocus];
	
	if (badgeCount > 0) { 
		// Set up badge string and size.
		NSString *badge = [NSString stringWithFormat:@"%d", badgeCount];
		NSSize badgeNumSize = [badge sizeWithAttributes:nil];
	
		// Calculate the badge's coordinates.
		int badgeWidth = badgeNumSize.width + BADGE_BUFFER_LEFT * 2;
		if (badgeWidth < BADGE_TEXT_SMALL)
		{
			// The text is too short. Decrease the badge's size.
			badgeWidth = BADGE_TEXT_SMALL;
		}
		int badgeX = aRect.origin.x + aRect.size.width - BADGE_CIRCLE_BUFFER_RIGHT - badgeWidth;
		int badgeY = aRect.origin.y + BADGE_BUFFER_TOP;
		int badgeNumX = badgeX + BADGE_BUFFER_LEFT;
		if (badgeWidth == BADGE_TEXT_SMALL)
		{
			badgeNumX += BADGE_BUFFER_LEFT_SMALL;
		}
		NSRect badgeRect = NSMakeRect(badgeX, badgeY, badgeWidth, BADGE_TEXT_HEIGHT);
	
		// Draw the badge and number.
		NSBezierPath *badgePath = [NSBezierPath bezierPathWithRoundedRect:badgeRect xRadius:BADGE_X_RADIUS yRadius:BADGE_Y_RADIUS];
		if ([[NSApp mainWindow] isVisible] && ![self isHighlighted])
		{
			// The row is not selected and the window is in focus.
			
			[[NSColor colorWithCalibratedRed:.53 green:.60 blue:.74 alpha:1.0] set];
			[badgePath fill];
			NSDictionary *dict = [[NSMutableDictionary alloc] init];
			[dict setValue:[NSFont boldSystemFontOfSize:11] forKey:NSFontAttributeName];
			[dict setValue:[NSNumber numberWithFloat:-.25] forKey:NSKernAttributeName];
			[dict setValue:[NSColor whiteColor] forKey:NSForegroundColorAttributeName];
			[badge drawAtPoint:NSMakePoint(badgeNumX,badgeY) withAttributes:dict];
		}
		else if ([[NSApp mainWindow] isVisible])
		{
			// The row is selected and the window is in focus.
			[[NSColor whiteColor] set];
			[badgePath fill];
			NSDictionary *dict = [[NSMutableDictionary alloc] init];
			[dict setValue:[NSFont boldSystemFontOfSize:11] forKey:NSFontAttributeName];
			[dict setValue:[NSNumber numberWithFloat:-.25] forKey:NSKernAttributeName];
			[dict setValue:[NSColor alternateSelectedControlColor] forKey:NSForegroundColorAttributeName];
			[badge drawAtPoint:NSMakePoint(badgeNumX,badgeY) withAttributes:dict];
		}
		else if (![[NSApp mainWindow] isVisible] && ![self isHighlighted])
		{
			// The row is not selected and the window is not in focus.
			[[NSColor disabledControlTextColor] set];
			[badgePath fill];
			NSDictionary *dict = [[NSMutableDictionary alloc] init];
			[dict setValue:[NSFont boldSystemFontOfSize:11] forKey:NSFontAttributeName];
			[dict setValue:[NSNumber numberWithFloat:-.25] forKey:NSKernAttributeName];
			[dict setValue:[NSColor whiteColor] forKey:NSForegroundColorAttributeName];
			[badge drawAtPoint:NSMakePoint(badgeNumX,badgeY) withAttributes:dict];
		}	
		else
		{
			// The row is selected and the window is not in focus.
			[[NSColor whiteColor] set];
			[badgePath fill];
			NSDictionary *dict = [[NSMutableDictionary alloc] init];
			[dict setValue:[NSFont boldSystemFontOfSize:11] forKey:NSFontAttributeName];
			[dict setValue:[NSNumber numberWithFloat:-.25] forKey:NSKernAttributeName];
			[dict setValue:[NSColor disabledControlTextColor] forKey:NSForegroundColorAttributeName];
			[badge drawAtPoint:NSMakePoint(badgeNumX,badgeY) withAttributes:dict];
		}
	}
}

- (NSMenu *)menu 
{
	return rightClickMenu;
}
@end
