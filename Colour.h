//
//  Colour.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/24.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

// kit numbers
#define AKN_HOME_KIT	0
#define AKN_AWAY_KIT	1
#define AKN_THIRD_KIT	2

// kit type
#define AKT_SHIRT	1
#define AKT_ICON	2
#define AKT_TEXT	3
#define AKT_SHORTS	4
#define AKT_SOCKS	5

// kit styles
#define KS_PLAIN						1
#define KS_PLAIN_DIFFERENT_SLEEVES		2
#define KS_STRIPES						3
#define KS_HOOPS						4
#define KS_HALVES_L_R					5
#define KS_QUARTERS						6
#define KS_CHECKS						7
#define KS_DIAGONAL_STRIPE_B_T			8
#define KS_STRIPE_AJAX					9
#define KS_SIDE_STRIPES					10
#define KS_STRIPES_WIDE					11
#define KS_STRIPES_PINSTRIPE			12
#define KS_HOOPS_WIDE					13
#define KS_HOOPS_PINSTRIPES				14
#define KS_HOOP_BOCA					15
#define KS_STRIPE_PSG					16
#define KS_STRIPE_RIGHT					17
#define KS_STRIPE_LEFT					18
#define KS_HALVES_T_B					19
#define KS_DIAGONAL_STRIPE_T_B			20
#define KS_HORIZONTAL_STRIPE_MIDDLE		21
#define KS_VERTICAL_STRIPE_RIGHT		22
#define KS_VERTICAL_STRIPE_LEFT			23
#define KS_VERTICAL_STRIPE_CENTRE		24
#define KS_LARGE_HORIZONTAL_STRIPE_TOP	25
#define KS_PLAIN_ONE_SLEEVE_RIGHT		26
#define KS_PLAIN_ONE_SLEEVE_LEFT		27
#define KS_HALVES_DIAGONAL				28
#define KS_V_STRIPE						29
#define KS_DOUBLE_HORIZONTAL_STRIPE_MIDDLE_SPACE	30
#define KS_DOUBLE_VERTICAL_STRIPE_RIGHT_SPACE		31
#define KS_DOUBLE_VERTICAL_STRIPE_LEFT_SPACE		32
#define KS_DOUBLE_VERTICAL_STIPE_MIDDLE_WITH_SPACE	33
#define KS_BOLD_TOP_PANEL				34
#define KS_LARGE_V_AREA					35
#define KS_SHOULDER_STRIPE_DOWN_EPAULETS	36
#define KS_FIVE_STRIPES					37
#define KS_DUAL_STRIPED_SASH			38
#define KS_DUAL_STRIPED_SASH_REVERSED	39
#define KS_TWO_CHEVRONS					40
#define KS_SEVEN_STRIPES_WITH_OUTLINE	41
#define KS_VERTICAL_THIRDS				42
#define KS_DIAGONAL_HALVES_REVERSED		43
#define KS_THINNER_HOOPS				44
#define KS_CENTRAL_CROSS				45
#define KS_LEFT_CROSS					46
#define KS_RIGHT_CROSS					47
#define KS_SEVEN_STRIPES_PLAIN_ARMS		48
#define KS_HOOPS_PLAIN_ARMS				49
#define KS_HORIZONTAL_SECTIONS_SPLIT	50
#define KS_HOOPS_WITH_OUTLINE			51
#define KS_DOUBLE_CHEVRONS				52
#define KS_VERTICAL_THIRDS_SAME_SLEEVES	53

#define KS_MAX	125

// kit sock styles
#define SOS_PLAIN					1
#define SOS_HALVES_TOP_BOTTOM		2
#define SOS_HALVES_BACK_FRONT		3
#define SOS_QUARTERS				4
#define SOS_TOP_DIFFERENT_COLOUR	5
#define SOS_HOOP_MIDDLE				6
#define SOS_HOOP_TOP				7
#define SOS_TWO_TOP_HOOPS			8
#define SOS_THREE_TOP_HOOPS			9
#define SOS_HOOPS					10
#define SOS_MIDDLE_THIN_HOOP		11
#define SOS_MIDDLE_HOOPS_DIFFERENT	12
#define SOS_TOP_TWO_HOOPS_DIFFERENT	13
#define SOS_STIPES					14
#define SOS_CHECKS					15

// kit short styles
#define SHS_PLAIN					1
#define SHS_SIDE_STRIPE				2
#define SHS_TWO_SIDE_STRIPES		3
#define SHS_THREE_SIDE_STRIPES		4
#define SHS_HALVES_LEFT_RIGHT		5
#define SHS_HALVES_TOP_BOTTOM		6
#define SHS_QUARTERS				7
#define SHS_STRIPES					8
#define SHS_HOOPS					9

@interface Colour : NSObject {
	BOOL outfieldKit;
	char kitNumber, type, alternativeKitNumber;
	short year;
	int competitionUID;
	
	char kitStyle;
	unsigned short foreground, background, trim, number, numberTrim;
	
	NSColor *foregroundColour, *backgroundColour, *trimColour;
	NSImage *image1;
}

@property (assign,readwrite) char kitStyle;
@property (assign,readwrite) unsigned short foreground, background, trim,
number, numberTrim;
@property (retain,readwrite) NSColor *foregroundColour, *backgroundColour, *trimColour,
*numberColour, *numberTrimColour;
@property(assign,readwrite) NSImage *image1;

@property(assign,readwrite) BOOL outfieldKit;
@property(assign,readwrite) char kitNumber, type, alternativeKitNumber;
@property(assign,readwrite) short year;
@property(assign,readwrite) int competitionUID;

- (NSColor *)foregroundColour;
- (NSColor *)backgroundColour;
- (NSColor *)trimColour;
- (NSColor *)numberColour;
- (NSColor *)numberTrimColour;
+ (unsigned short)setColor:(NSColor *)color;
+ (NSColor *)getColor:(unsigned short)val;

- (NSImage *)image1;
- (NSImage *)image2;

- (NSArray *)kitStyleStrings;

- (NSArray *)kitNumberStrings;
- (NSArray *)typeStrings;

- (void)redrawImages;
- (NSBitmapImageRep *)transformImage:(NSBitmapImageRep *)bitmapImageRep type:(int)colourType;
- (NSImage *)bgImageWithDefault:(BOOL)isDefault customStyle:(int)customStyle;
- (NSImage *)logoImageWithDefault:(BOOL)isDefault customStyle:(int)customStyle;

@end
