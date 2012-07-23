//
//  MAView.h
//  MacAssistant
//
//  Created by Tom Siopoudis on 23/07/2012.
//  Copyright (c) 2012 Thanos. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MAView : NSView {
    NSColor *background;
}

@property (nonatomic, assign, readwrite) NSColor *background;

@end
