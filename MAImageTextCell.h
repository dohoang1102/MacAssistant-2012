//
//  MAImageTextCell.h
//  MacAssistant
//
//  Created by Athanasios Siopoudis on 20/08/2012.
//
//

#import <Cocoa/Cocoa.h>

@interface MAImageTextCell : NSTextFieldCell {
    NSImage *icon;
}

@property(nonatomic, retain) NSImage *icon;

@end
