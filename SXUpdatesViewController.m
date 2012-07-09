//
//  SXUpdatesViewController.m
//  MBPreferencesController
//
//  Created by Amy Kettlewell on 09/10/24.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "SXUpdatesViewController.h"


@implementation SXUpdatesViewController

- (NSString *)title
{
	return NSLocalizedString(@"Updates", @"Update Preferences");
}

- (NSString *)identifier
{
	return @"SXUpdatesPane";
}

- (NSImage *)image
{
	return [NSImage imageNamed:@"Updates"];
}

@end
