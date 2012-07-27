//
//  PreferencesControllerWindowController.m
//  MacAssistant
//
//  Created by Athanasios Siopoudis on 26/07/2012.
//
//

#import "PreferencesController.h"

@interface PreferencesController ()

@end

@implementation PreferencesController

- (id)init
{
    self = [super initWithWindow:window];
    if (self) {
        if ([[NSUserDefaults standardUserDefaults] objectForKey:@"loadLangDB"] == nil) {
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"loadLangDB"];
        }
        
        if ([[NSUserDefaults standardUserDefaults] objectForKey:@"langDBPath"] == nil) {
            [[NSUserDefaults standardUserDefaults] setValue:@"/Users" forKey:@"langDBPath"];
        }
        
        if ([[NSUserDefaults standardUserDefaults] objectForKey:@"selectedCurrency"] == nil) {
            [[NSUserDefaults standardUserDefaults] setValue:@"British Pound Sterling" forKey:@"selectedCurrency"];
        }
    }
    
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
}

@end
