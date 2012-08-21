//
//  MAImageTextCell.m
//  MacAssistant
//
//  Created by Athanasios Siopoudis on 20/08/2012.
//
//

#import "MAImageTextCell.h"

@implementation MAImageTextCell

@synthesize icon;

- (void)drawInteriorWithFrame:(NSRect)cellFrame
                       inView:(NSView *)controlView
{
    cellFrame.origin.x += 18.0;
    cellFrame.size.width -= 18.0;
    [super drawInteriorWithFrame:cellFrame
                          inView:controlView];
}

- (void)drawWithFrame:(NSRect)cellFrame inView:(NSView *)controlView {
    
    int numberOfNationalities = 1;
    
    NSArray *nationalities = [[NSArray alloc] init];
    NSString *nationality = [self stringValue];
    
    // Lookup for the country's image, and draw it if the file exists
    // But first split the countries if they're multiple
    // So check for the country divider '/'
    if ([[self stringValue] rangeOfString:@" / "].location != NSNotFound) {
        // Multiple countries, so split
        nationalities = [[self stringValue] componentsSeparatedByString:@" / "];
        numberOfNationalities = [nationalities count];
    }
    
    if (numberOfNationalities > 1) {
        // Get the first nationality only for the flag. This is the primary nationality
        nationality = [nationalities objectAtIndex:0];
    }
    
    NSString *iconFileName = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.png", nationality]];
    
    [[NSGraphicsContext currentContext] saveGraphicsState];

    float yOffset = cellFrame.origin.y;
    if ([controlView isFlipped]) {
        NSAffineTransform* xform = [NSAffineTransform transform];
        [xform translateXBy:0.0 yBy: cellFrame.size.height];
        [xform scaleXBy:1.0 yBy:-1.0];
        [xform concat];
        yOffset = 0-cellFrame.origin.y;
    }
    
    NSImageInterpolation interpolation = [[NSGraphicsContext currentContext] imageInterpolation];
    [[NSGraphicsContext currentContext] setImageInterpolation: NSImageInterpolationHigh];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:iconFileName]) {
        icon = [[NSImage alloc] initWithContentsOfFile:iconFileName];
        
        [icon drawInRect:NSMakeRect(cellFrame.origin.x,yOffset+5,[icon size].width, [icon size].height)
                fromRect:NSMakeRect(0,0,[icon size].width, [icon size].height)
               operation:NSCompositeSourceOver
                fraction:1.0];
    }
    
    [[NSGraphicsContext currentContext] setImageInterpolation: interpolation];
    
    [[NSGraphicsContext currentContext] restoreGraphicsState];
    [super drawWithFrame:cellFrame inView:controlView];
}

- (void)selectWithFrame:(NSRect)aRect inView:(NSView *)controlView editor:(NSText *)textObj delegate:(id)anObject start:(NSInteger)selStart length:(NSInteger)selLength
{
    aRect.origin.x += 18.0;
    aRect.size.width -= 18.0;
    [super selectWithFrame:aRect
                    inView:controlView
                    editor:textObj
                  delegate:anObject
                     start:selStart
                    length:selLength];
}

@end
