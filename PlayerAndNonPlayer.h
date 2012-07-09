//
//  PlayerAndNonPlayer.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/21.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface PlayerAndNonPlayer : NSObject {
	char nonPlayerClubJob, nonPlayerNationalJob;
}

@property(assign,readwrite) char nonPlayerClubJob, nonPlayerNationalJob;

@end
