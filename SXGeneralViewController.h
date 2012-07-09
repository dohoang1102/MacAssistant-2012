//
//  SXGeneralViewController.h
//  MBPreferencesController
//
//  Created by Amy Kettlewell on 09/10/24.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "MBPreferencesController.h"

@class Controller;

@interface SXGeneralViewController : NSViewController <MBPreferencesModule> {
	Controller *controller;
}

- (NSString *)identifier;
- (NSImage *)image;

@property(readwrite,assign) Controller *controller;

@end
