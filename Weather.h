//
//  Weather.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/11/04.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Weather : NSObject {
	char databaseClass;
	char wind, precipitation, temperature;
	char springWindCalm, springWindBreezy, springWindGusty, springWindStrong, springWindGale, 
	springPrecipitationDry, springPrecipitationWet, springPrecipitationDrizzle, springPrecipitationShower,
	springPrecipitationDownpour, springTemperatureFreezing, springTemperatureCold, springTemperatureMild, 
	springTemperatureFine, springTemperatureWarm, springTemperatureHot, springTemperatureVeryHot;
	char summerWindCalm, summerWindBreezy, summerWindGusty, summerWindStrong, summerWindGale, 
	summerPrecipitationDry, summerPrecipitationWet, summerPrecipitationDrizzle, summerPrecipitationShower,
	summerPrecipitationDownpour, summerTemperatureFreezing, summerTemperatureCold, summerTemperatureMild, 
	summerTemperatureFine, summerTemperatureWarm, summerTemperatureHot, summerTemperatureVeryHot;
	char autumnWindCalm, autumnWindBreezy, autumnWindGusty, autumnWindStrong, autumnWindGale, 
	autumnPrecipitationDry, autumnPrecipitationWet, autumnPrecipitationDrizzle, autumnPrecipitationShower,
	autumnPrecipitationDownpour, autumnTemperatureFreezing, autumnTemperatureCold, autumnTemperatureMild, 
	autumnTemperatureFine, autumnTemperatureWarm, autumnTemperatureHot, autumnTemperatureVeryHot;
	char winterWindCalm, winterWindBreezy, winterWindGusty, winterWindStrong, winterWindGale, 
	winterPrecipitationDry, winterPrecipitationWet, winterPrecipitationDrizzle, winterPrecipitationShower,
	winterPrecipitationDownpour, winterTemperatureFreezing, winterTemperatureCold, winterTemperatureMild, 
	winterTemperatureFine, winterTemperatureWarm, winterTemperatureHot, winterTemperatureVeryHot;
	short winterStartDay, summerStartDay, springStartDay, autumnStartDay;
	int rowID, UID;
	NSString *name;
}

@property(assign,readwrite) char databaseClass;
@property(assign,readwrite) char springWindCalm, springWindBreezy, springWindGusty, springWindStrong, 
springWindGale, springPrecipitationDry, springPrecipitationWet, springPrecipitationDrizzle, springPrecipitationShower,
springPrecipitationDownpour, springTemperatureFreezing, springTemperatureCold, springTemperatureMild, 
springTemperatureFine, springTemperatureWarm, springTemperatureHot, springTemperatureVeryHot;
@property(assign,readwrite) char summerWindCalm, summerWindBreezy, summerWindGusty, summerWindStrong, 
summerWindGale, summerPrecipitationDry, summerPrecipitationWet, summerPrecipitationDrizzle, summerPrecipitationShower,
summerPrecipitationDownpour, summerTemperatureFreezing, summerTemperatureCold, summerTemperatureMild, 
summerTemperatureFine, summerTemperatureWarm, summerTemperatureHot, summerTemperatureVeryHot;
@property(assign,readwrite) char autumnWindCalm, autumnWindBreezy, autumnWindGusty, autumnWindStrong, 
autumnWindGale, autumnPrecipitationDry, autumnPrecipitationWet, autumnPrecipitationDrizzle, autumnPrecipitationShower,
autumnPrecipitationDownpour, autumnTemperatureFreezing, autumnTemperatureCold, autumnTemperatureMild, 
autumnTemperatureFine, autumnTemperatureWarm, autumnTemperatureHot, autumnTemperatureVeryHot;
@property(assign,readwrite) char winterWindCalm, winterWindBreezy, winterWindGusty, winterWindStrong, 
winterWindGale, winterPrecipitationDry, winterPrecipitationWet, winterPrecipitationDrizzle, winterPrecipitationShower,
winterPrecipitationDownpour, winterTemperatureFreezing, winterTemperatureCold, winterTemperatureMild, 
winterTemperatureFine, winterTemperatureWarm, winterTemperatureHot, winterTemperatureVeryHot;
@property(assign,readwrite) char wind, precipitation, temperature;
@property(assign,readwrite) short winterStartDay, summerStartDay, springStartDay, autumnStartDay;
@property(assign,readwrite) int rowID, UID;
@property(copy,readwrite) NSString *name;

@end
