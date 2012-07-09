//
//  SXLanguagesViewController.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/24.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "SXLanguagesViewController.h"


@implementation SXLanguagesViewController

- (NSString *)title
{
	return NSLocalizedString(@"Languages", @"Language Preferences");
}

- (NSString *)identifier
{
	return @"SXLanguagesPane";
}

- (NSImage *)image
{
	return [NSImage imageNamed:@"Nation"];
}

@end
