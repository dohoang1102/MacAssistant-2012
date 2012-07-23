//
//  MAView.m
//  MacAssistant
//
//  Created by Tom Siopoudis on 23/07/2012.
//  Copyright (c) 2012 Thanos. All rights reserved.
//

#import "MAView.h"

@implementation MAView

@synthesize background;


- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
    CGContextRef context = (CGContextRef) [[NSGraphicsContext currentContext] graphicsPort];
    CGContextSetRGBFillColor(context, 1.0, 1.0, 1.0, 0.9);
    CGContextFillRect(context, NSRectToCGRect(dirtyRect));
}


@end
