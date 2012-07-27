//
//  CurrencyFormatTransformer.m
//  MacAssistant
//
//  Created by Tom Siopoudis on 24/07/2012.
//  Copyright (c) 2012 Thanos. All rights reserved.
//

#import "CurrencyFormatTransformer.h"

@implementation CurrencyFormatTransformer

+ (Class)transformedValueClass
{
    return [NSNumber class];
}

+ (BOOL)allowsReverseTransformation
{
    return NO;
}

- (id)transformedValue:(id)value {
    if (value == nil) return nil;
    
    NSNumber *currencyValue;
    
    if ([value isKindOfClass:[NSNumber class]]) {
        currencyValue = value;
    }
    else {
        NSLog(@"Currency value is not a number!");
    }
    
    NSNumberFormatter *numFormatter = [[NSNumberFormatter alloc] init];
    [numFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    NSString *cSymbol = @"";
    
    if ([[[NSUserDefaults standardUserDefaults] stringForKey:@"selectedCurrency"] isEqualToString:@"British Pound Sterling"]) {
        cSymbol = @"£";
    }
    else if ([[[NSUserDefaults standardUserDefaults] stringForKey:@"selectedCurrency"] isEqualToString:@"US Dollar"]) {
        cSymbol = @"$";
    }
    else if ([[[NSUserDefaults standardUserDefaults] stringForKey:@"selectedCurrency"] isEqualToString:@"European Euro"]) {
        cSymbol = @"€";
    }
    
    [numFormatter setCurrencySymbol:cSymbol]; // Needs to be selectable from the preferences in the future
    [numFormatter setMaximumFractionDigits:0];
    
    NSString *returnValue = [numFormatter stringFromNumber:currencyValue];
    return returnValue;
}

@end
