//
//  Colour.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/24.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Colour.h"
#import "QuartzCore/CIFilter.h"

@implementation Colour

@synthesize kitStyle, foreground, background, trim, number, numberTrim,
kitNumber, type, alternativeKitNumber, year, competitionUID, outfieldKit;

+ (unsigned short)setColor:(NSColor *)color
{
	unsigned char r,g,b;
	
	r = ([color redComponent] * 31.875);
	g = ([color greenComponent] * 31.875);
	b = ([color blueComponent] * 31.875);
	
	return ((r << 10) | (g << 5) | (b << 0));
}

+ (NSColor *)getColor:(unsigned short)val
{
	unsigned char r,g,b;
	float red,green,blue;
	
	r = ((val & 0x7C00) >> 10);
	g = ((val & 0x03E0) >> 5);
	b = ((val & 0x001F) >> 0);
	
	red = r/31.875f;
	green = g/31.875f;
	blue = b/31.875f;
	
	NSColor *colour = [NSColor colorWithDeviceRed:red green:green blue:blue alpha:1.0];
	
	return colour;
}

- (NSColor *)backgroundColour					{ return [[Colour getColor:background] retain]; }
- (void)setBackgroundColour:(NSColor *)color	{ background = [Colour setColor:color]; }

- (NSColor *)foregroundColour					{ return [[Colour getColor:foreground] retain]; }
- (void)setForegroundColour:(NSColor *)color	{ foreground = [Colour setColor:color]; }

- (NSColor *)trimColour							{ return [[Colour getColor:trim] retain]; }
- (void)setTrimColour:(NSColor *)color			{ trim = [Colour setColor:color]; }

- (NSColor *)numberColour						{ return [[Colour getColor:number] retain]; }
- (void)setNumberColour:(NSColor *)color		{ number = [Colour setColor:color]; }

- (NSColor *)numberTrimColour					{ return [[Colour getColor:numberTrim] retain]; }
- (void)setNumberTrimColour:(NSColor *)color	{ numberTrim = [Colour setColor:color]; }

- (NSArray *)kitStyleStrings
{
	NSArray *strings = [NSArray arrayWithObjects:
						NSLocalizedString(@"Invalid", @"general 'invalid' option"),
						NSLocalizedString(@"Plain", @"kit style"),
						NSLocalizedString(@"Plain (Different Sleeves)", @"kit style"),
						NSLocalizedString(@"Stripes", @"kit style"),
						NSLocalizedString(@"Hoops", @"kit style"),
						NSLocalizedString(@"Halves (Left-Right)", @"kit style"),
						NSLocalizedString(@"Quarters", @"kit style"),
						NSLocalizedString(@"Checks", @"kit style"),
						NSLocalizedString(@"Diagonal Stripe (Bottom-Top)", @"kit style"),
						NSLocalizedString(@"Stripe (Ajax)", @"kit style"),
						NSLocalizedString(@"Side Stripes", @"kit style"),
						NSLocalizedString(@"Stripes (Wide)", @"kit style"),
						NSLocalizedString(@"Stripes (Pinstripe)", @"kit style"),
						NSLocalizedString(@"Hoops (Wide)", @"kit style"),
						NSLocalizedString(@"Hoops (Pinstripes)", @"kit style"),
						NSLocalizedString(@"Hoop (Boca)", @"kit style"),
						NSLocalizedString(@"Stripe (PSG)", @"kit style"),
						NSLocalizedString(@"Stripe (Right)", @"kit style"),
						NSLocalizedString(@"Stripe (Left)", @"kit style"),
						NSLocalizedString(@"Halves (Top-Bottom)", @"kit style"),
						NSLocalizedString(@"Diagonal Stripe (Top-Bottom)", @"kit style"),
						NSLocalizedString(@"Horizontal Stripe (Middle)", @"kit style"),
						NSLocalizedString(@"Vertical Stripe (Right)", @"kit style"),
						NSLocalizedString(@"Vertical Stripe (Left)", @"kit style"),
						NSLocalizedString(@"Vertical Stripe (Centre)", @"kit style"),
						NSLocalizedString(@"Large Horizontal Stripe (Top)", @"kit style"),
						NSLocalizedString(@"Plain One Sleeve (Right)", @"kit style"),
						NSLocalizedString(@"Plain One Sleeve (Left)", @"kit style"),
						NSLocalizedString(@"Diagonal Halves", @"kit style"),
						NSLocalizedString(@"V Stripe", @"kit style"),
						NSLocalizedString(@"Double Horizontal Stripe (Middle Space)", @"kit style"),
						NSLocalizedString(@"Double Vertical Stripe (Right Space)", @"kit style"),
						NSLocalizedString(@"Double Vertical Stripe (Left Space)", @"kit style"),
						NSLocalizedString(@"Double Vertical Stripe (Centre Space)", @"kit style"),
						NSLocalizedString(@"Bold Top Panel", @"kit style"),
						NSLocalizedString(@"Large V Area", @"kit style"),
						NSLocalizedString(@"Shoulder Stripe Down (Epaulets)", @"kit style"),
						NSLocalizedString(@"Five Stripes", @"kit style"),
						NSLocalizedString(@"Dual Striped Sash", @"kit style"),
						NSLocalizedString(@"Dual Striped Sash (Reversed)", @"kit style"),
						NSLocalizedString(@"Two Chevrons", @"kit style"),
						NSLocalizedString(@"Seven Stripes With Outline", @"kit style"),
						NSLocalizedString(@"Vertical Thirds", @"kit style"),
						NSLocalizedString(@"Digonal Halves (Reversed)", @"kit style"),
						NSLocalizedString(@"Thinner Hoops", @"kit style"),
						NSLocalizedString(@"Central Cross", @"kit style"),
						NSLocalizedString(@"Left Cross", @"kit style"),
						NSLocalizedString(@"Right Cross", @"kit style"),
						NSLocalizedString(@"Seven Stripes Plain Arms", @"kit style"),
						NSLocalizedString(@"Hoops Plain Arms", @"kit style"),
						NSLocalizedString(@"Horizontal Sections Split", @"kit style"),
						NSLocalizedString(@"Hoops With Outline", @"kit style"),
						NSLocalizedString(@"Double Chevrons", @"kit style"),
						NSLocalizedString(@"Vertical Thirds Same Sleeves", @"kit style"),
						nil];
	return strings;
}

- (NSArray *)kitNumberStrings
{
	NSArray *strings = [NSArray arrayWithObjects:
						NSLocalizedString(@"Home", @"kit type"),
						NSLocalizedString(@"Away", @"kit type"),
						NSLocalizedString(@"Third", @"kit type"),
						nil];
	return strings;
}

- (NSArray *)typeStrings
{
	NSArray *strings = [NSArray arrayWithObjects:
						NSLocalizedString(@"Invalid", @"general 'invalid' option"),
						NSLocalizedString(@"Shirt", @"kit type"),
						NSLocalizedString(@"Icon", @"kit type"),
						NSLocalizedString(@"Text", @"kit type"),
						NSLocalizedString(@"Shorts", @"kit type"),
						NSLocalizedString(@"Socks", @"kit type"),
						nil];
	return strings;
}

- (NSImage *)image1
{
	char styleImage;
	if (kitStyle>53 || kitStyle<1) { styleImage = 1; }
	else { styleImage = kitStyle; }
	
	NSString *imgType;
	
	if (type==AKT_SHIRT) { imgType = @"front"; }
	else if (type==AKT_SHORTS) { imgType = @"shorts"; }
	else if (type==AKT_SOCKS) { imgType = @"socks"; }
	else { return nil; }
	
	NSBitmapImageRep *bitmapImageRep = [[NSBitmapImageRep alloc] initWithData:[[NSImage imageNamed:[NSString stringWithFormat:@"kit_%@_%d.png",imgType,styleImage]] TIFFRepresentation]];
	
	NSImage *colouredImage = [[NSImage alloc] init];
	[colouredImage addRepresentation:[self transformImage:bitmapImageRep type:0]];
	[bitmapImageRep release];
	
	if (type==AKT_SHIRT) {
		NSImage *finalImage;
	
		CIImage *inputImage = [[CIImage alloc] initWithData:[colouredImage TIFFRepresentation]];
		CIImage *effectImage = [[CIImage alloc] initWithData:[[NSImage imageNamed:@"kit_front_effect.png"] TIFFRepresentation]];
		
		CIFilter *filter1 = [CIFilter filterWithName:@"CISourceOverCompositing"];
		[filter1 setDefaults];
		[filter1 setValue:inputImage forKey:@"inputBackgroundImage"];
		[filter1 setValue:effectImage forKey:@"inputImage"];
		
		CIFilter *filter3 = [CIFilter filterWithName:@"CISourceOverCompositing"];
		[filter3 setDefaults];
		[filter3 setValue:[filter1 valueForKey:@"outputImage"] forKey:@"inputBackgroundImage"];
		[filter3 setValue:effectImage forKey:@"inputImage"];
		
		finalImage = [[NSImage alloc] initWithSize:NSMakeSize([[filter3 valueForKey:@"outputImage"] extent].size.width,[[filter3 valueForKey:@"outputImage"] extent].size.height)];
		NSCIImageRep *rep = [NSCIImageRep imageRepWithCIImage:[filter3 valueForKey:@"outputImage"]];
		
		[finalImage addRepresentation:rep];
		return finalImage;
	}
	else if (type==AKT_SHORTS) {
		return colouredImage;
	}
	else if (type==AKT_SOCKS) {
		return colouredImage;
	}
	
	return nil;
}
- (void)setImage1:(NSImage *)img
{
	image1 = [img copy];
}

- (NSImage *)image2
{
	return nil;
}

- (void)redrawImages { [self setImage1:[self image1]]; }

- (NSBitmapImageRep *)transformImage:(NSBitmapImageRep *)bitmapImageRep type:(int)colourType
{
	float foreRed = [[self foregroundColour] redComponent];
	float foreGreen = [[self foregroundColour] greenComponent];
	float foreBlue = [[self foregroundColour] blueComponent];
	float backRed = [[self backgroundColour] redComponent];
	float backGreen = [[self backgroundColour] greenComponent];
	float backBlue = [[self backgroundColour] blueComponent];
	float trimRed = [[self trimColour] redComponent];
	float trimGreen = [[self trimColour] greenComponent];
	float trimBlue = [[self trimColour] blueComponent];
	
	for (int x=0; x<=[bitmapImageRep pixelsWide]; x++) {
		for (int y=0; y<=[bitmapImageRep pixelsHigh]; y++) {
			float oRed = [[bitmapImageRep colorAtX:x y:y] redComponent];
			float oGreen = [[bitmapImageRep colorAtX:x y:y] greenComponent];
			float oBlue = [[bitmapImageRep colorAtX:x y:y] blueComponent];
			
			float rcalc = (foreRed * oGreen) + (backRed * oRed) + (trimRed * oBlue);
			float gcalc = (foreGreen * oGreen) + (backGreen * oRed) + (trimGreen * oBlue);
			float bcalc = (foreBlue *oGreen) + (backBlue * oRed) + (trimBlue * oBlue);
			float acalc = [[bitmapImageRep colorAtX:x y:y] alphaComponent];
			
			[bitmapImageRep setColor:[NSColor colorWithCalibratedRed:rcalc green:gcalc blue:bcalc alpha:acalc] atX:x y:y];
		}
	}
	
	return bitmapImageRep;
}

- (NSImage *)bgImageWithDefault:(BOOL)isDefault customStyle:(int)customStyle
{
	char styleImage;
	if (isDefault) { 
		styleImage = 0;
		[self setBackgroundColour:[NSColor blackColor]];
		[self setForegroundColour:[NSColor whiteColor]];
		[self setTrimColour:[NSColor whiteColor]];
	}
	else if (kitStyle>53 || kitStyle<1) { styleImage = 0; }
	else { styleImage = kitStyle; }
	
	if (customStyle>-1) { styleImage = customStyle; }
	
	NSBitmapImageRep *bitmapImageRep = [[NSBitmapImageRep alloc] initWithData:[[NSImage imageNamed:[NSString stringWithFormat:@"club_titlebg_%d.png",styleImage]] TIFFRepresentation]];
	
	NSImage *colouredImage = [[NSImage alloc] init];
	[colouredImage addRepresentation:[self transformImage:bitmapImageRep type:1]];
	[bitmapImageRep release];
	
	return colouredImage;
}

- (NSImage *)logoImageWithDefault:(BOOL)isDefault customStyle:(int)customStyle
{
	char styleImage;
	if (isDefault) { 
		styleImage = 0;
		[self setBackgroundColour:[NSColor blackColor]];
		[self setForegroundColour:[NSColor whiteColor]];
		[self setTrimColour:[NSColor whiteColor]];
	}
	else if (kitStyle>53 || kitStyle<1) { styleImage = 0; }
	else { styleImage = kitStyle; }
	
	if (customStyle>-1) { styleImage = customStyle; }

	NSBitmapImageRep *bitmapImageRep = [[NSBitmapImageRep alloc] initWithData:[[NSImage imageNamed:[NSString stringWithFormat:@"default_logo_%d.png",styleImage]] TIFFRepresentation]];
	
	NSImage *colouredImage = [[NSImage alloc] init];
	[colouredImage addRepresentation:[self transformImage:bitmapImageRep type:1]];
	[bitmapImageRep release];
	
	return colouredImage;
}
@end
