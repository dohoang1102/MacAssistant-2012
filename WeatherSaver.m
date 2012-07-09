//
//  WeatherSaver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 10/07/25.
//  Copyright 2010 EnjoyLocally.co.uk. All rights reserved.
//

#import "WeatherSaver.h"
#import "FMString.h"

@implementation WeatherSaver

+ (void)saveWeather:(Weather *)object toData:(NSMutableData *)data
{
	char cbuffer;
	short sbuffer;
	int ibuffer;
	
	cbuffer = [object databaseClass];
	[data appendBytes:&cbuffer length:1];
	[FMString saveString:[object name] toData:data];
	
	cbuffer = [object wind];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object precipitation];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object temperature];
	[data appendBytes:&cbuffer length:1];
	
	sbuffer = [object springStartDay];
	[data appendBytes:&sbuffer length:2];
	cbuffer = [object springWindCalm];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object springWindBreezy];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object springWindGusty];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object springWindStrong];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object springWindGale];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object springPrecipitationDry];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object springPrecipitationWet];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object springPrecipitationDrizzle];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object springPrecipitationShower];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object springPrecipitationDownpour];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object springTemperatureFreezing];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object springTemperatureCold];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object springTemperatureMild];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object springTemperatureFine];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object springTemperatureWarm];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object springTemperatureHot];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object springTemperatureVeryHot];
	[data appendBytes:&cbuffer length:1];
	
	sbuffer = [object summerStartDay];
	[data appendBytes:&sbuffer length:2];
	cbuffer = [object summerWindCalm];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object summerWindBreezy];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object summerWindGusty];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object summerWindStrong];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object summerWindGale];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object summerPrecipitationDry];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object summerPrecipitationWet];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object summerPrecipitationDrizzle];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object summerPrecipitationShower];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object summerPrecipitationDownpour];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object summerTemperatureFreezing];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object summerTemperatureCold];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object summerTemperatureMild];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object summerTemperatureFine];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object summerTemperatureWarm];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object summerTemperatureHot];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object summerTemperatureVeryHot];
	[data appendBytes:&cbuffer length:1];
	
	sbuffer = [object autumnStartDay];
	[data appendBytes:&sbuffer length:2];
	cbuffer = [object autumnWindCalm];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object autumnWindBreezy];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object autumnWindGusty];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object autumnWindStrong];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object autumnWindGale];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object autumnPrecipitationDry];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object autumnPrecipitationWet];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object autumnPrecipitationDrizzle];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object autumnPrecipitationShower];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object autumnPrecipitationDownpour];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object autumnTemperatureFreezing];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object autumnTemperatureCold];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object autumnTemperatureMild];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object autumnTemperatureFine];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object autumnTemperatureWarm];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object autumnTemperatureHot];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object autumnTemperatureVeryHot];
	[data appendBytes:&cbuffer length:1];
	
	sbuffer = [object winterStartDay];
	[data appendBytes:&sbuffer length:2];
	cbuffer = [object winterWindCalm];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object winterWindBreezy];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object winterWindGusty];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object winterWindStrong];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object winterWindGale];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object winterPrecipitationDry];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object winterPrecipitationWet];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object winterPrecipitationDrizzle];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object winterPrecipitationShower];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object winterPrecipitationDownpour];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object winterTemperatureFreezing];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object winterTemperatureCold];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object winterTemperatureMild];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object winterTemperatureFine];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object winterTemperatureWarm];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object winterTemperatureHot];
	[data appendBytes:&cbuffer length:1];
	cbuffer = [object winterTemperatureVeryHot];
	[data appendBytes:&cbuffer length:1];
	
	ibuffer = [object rowID];
	[data appendBytes:&ibuffer length:4];
	ibuffer = [object UID];
	[data appendBytes:&ibuffer length:4];
}

@end
