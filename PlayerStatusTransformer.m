//
//  PlayerStatusTransformer.m
//  MacAssistant
//
//  Created by Athanasios Siopoudis on 27/07/2012.
//
//

#import "PlayerStatusTransformer.h"

@implementation PlayerStatusTransformer


+ (Class)transformedValueClass
{
    return [NSImage class];
}

+ (BOOL)allowsReverseTransformation
{
    return NO;
}

- (id)transformedValue:(id)value {
    if (value == nil) return nil;
    
    NSImage *retImg = nil;
    NSString *playerStatus = @"";
    if ([value isKindOfClass:[NSString class]]) {
        playerStatus = value;
    }
    else {
        NSLog(@"Player Status value is not a string!");
    }
    
    if ([playerStatus length] > 0 ) {
        // Player has Contract offer(s)
        retImg = [[NSImage alloc] initWithContentsOfFile:[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:[NSString stringWithFormat:@"status_%@.png", playerStatus]]];
    }
    else {
        return nil;
    }
    
    return retImg;
}

@end
