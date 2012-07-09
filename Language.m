//
//  Language.m
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/31.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Language.h"


@implementation Language

@synthesize databaseClass, nameGender, influence, difficulty, family, group,
subGroup, databaseFileOffset, nationID, rowID, UID, name;

- (id)init
{
	[super init];
	
	name = @"---";
	
	return self;
}

- (NSArray *)familyStrings
{
	NSArray *strings = [NSArray arrayWithObjects:
						NSLocalizedString(@"Invalid", @"general 'invalid' option"),
						NSLocalizedString(@"Afro-Asiatic", @"language family"),
						NSLocalizedString(@"Alacalufan", @"language family"),
						NSLocalizedString(@"Algic", @"language family"),
						NSLocalizedString(@"Altaic", @"language family"),
						NSLocalizedString(@"Amto-Musan", @"language family"),
						NSLocalizedString(@"Andamanese", @"language family"),
						NSLocalizedString(@"Arauan", @"language family"),
						NSLocalizedString(@"Araucanian", @"language family"),
						NSLocalizedString(@"Arawakan", @"language family"),
						NSLocalizedString(@"Artificial", @"language family"),
						NSLocalizedString(@"Arutani-Sape", @"language family"),
						NSLocalizedString(@"Australian", @"language family"),
						NSLocalizedString(@"Austro-Asiatic", @"language family"),
						NSLocalizedString(@"Austronesian", @"language family"),
						NSLocalizedString(@"Aymaran", @"language family"),
						NSLocalizedString(@"Barbacon", @"language family"),
						NSLocalizedString(@"Basque", @"language family"),
						NSLocalizedString(@"Bayono-Awbono", @"language family"),
						NSLocalizedString(@"Caddoan", @"language family"),
						NSLocalizedString(@"Cahuapanan", @"language family"),
						NSLocalizedString(@"Cant", @"language family"),
						NSLocalizedString(@"Carib", @"language family"),
						NSLocalizedString(@"Chapacura-Wanham", @"language family"),
						NSLocalizedString(@"Chibchan", @"language family"),
						NSLocalizedString(@"Chimakuan", @"language family"),
						NSLocalizedString(@"Choco", @"language family"),
						NSLocalizedString(@"Chon", @"language family"),
						NSLocalizedString(@"Chukotko-Kamchatkan", @"language family"),
						NSLocalizedString(@"Chumash", @"language family"),
						NSLocalizedString(@"Coahuiltecan", @"language family"),
						NSLocalizedString(@"Creole", @"language family"),
						NSLocalizedString(@"Deaf Sign Language", @"language family"),
						NSLocalizedString(@"Dravidian", @"language family"),
						NSLocalizedString(@"East Birds Head", @"language family"),
						NSLocalizedString(@"East Papuan", @"language family"),
						NSLocalizedString(@"Eskimo-Aleut", @"language family"),
						NSLocalizedString(@"Geelvink Bay", @"language family"),
						NSLocalizedString(@"Guahiban", @"language family"),
						NSLocalizedString(@"Gulf", @"language family"),
						NSLocalizedString(@"Harakmbet", @"language family"),
						NSLocalizedString(@"Hmong-Mien", @"language family"),
						NSLocalizedString(@"Hokan", @"language family"),
						NSLocalizedString(@"Huavean", @"language family"),
						NSLocalizedString(@"Indo-European", @"language family"),
						NSLocalizedString(@"Iroquoian", @"language family"),
						NSLocalizedString(@"Japanese", @"language family"),
						NSLocalizedString(@"Jivaroan", @"language family"),
						NSLocalizedString(@"Katukinan", @"language family"),
						NSLocalizedString(@"Keres", @"language family"),
						NSLocalizedString(@"Khoisan", @"language family"),
						NSLocalizedString(@"Kiowa-Tanoan", @"language family"),
						NSLocalizedString(@"Kwomtari-Baibai", @"language family"),
						NSLocalizedString(@"Language Isolate", @"language family"),
						NSLocalizedString(@"Left May", @"language family"),
						NSLocalizedString(@"Lower Mamberamo", @"language family"),
						NSLocalizedString(@"Lule-Vilela", @"language family"),
						NSLocalizedString(@"Macro-Ge", @"language family"),
						NSLocalizedString(@"Maku", @"language family"),
						NSLocalizedString(@"Masconian", @"language family"),
						NSLocalizedString(@"Mataco-Guaicuru", @"language family"),
						NSLocalizedString(@"Mayan", @"language family"),
						NSLocalizedString(@"Misumalpan", @"language family"),
						NSLocalizedString(@"Mixe-Zoque", @"language family"),
						NSLocalizedString(@"Mixed Language", @"language family"),
						NSLocalizedString(@"Mosetanan", @"language family"),
						NSLocalizedString(@"Mura", @"language family"),
						NSLocalizedString(@"Muskogean", @"language family"),
						NSLocalizedString(@"Na-Dene", @"language family"),
						NSLocalizedString(@"Nambiquaran", @"language family"),
						NSLocalizedString(@"Niger-Congo", @"language family"),
						NSLocalizedString(@"Nilo-Saharan", @"language family"),
						NSLocalizedString(@"North Caucasian", @"language family"),
						NSLocalizedString(@"Oto-Manguean", @"language family"),
						NSLocalizedString(@"Paezan", @"language family"),
						NSLocalizedString(@"Panoan", @"language family"),
						NSLocalizedString(@"Peba-Yaguan", @"language family"),
						NSLocalizedString(@"Penutian", @"language family"),
						NSLocalizedString(@"Pidgin", @"language family"),
						NSLocalizedString(@"Quechuan", @"language family"),
						NSLocalizedString(@"Salishan", @"language family"),
						NSLocalizedString(@"Salivan", @"language family"),
						NSLocalizedString(@"Sepik-Ramu", @"language family"),
						NSLocalizedString(@"Sign Language", @"language family"),
						NSLocalizedString(@"Sino-Tibetan", @"language family"),
						NSLocalizedString(@"Siouan", @"language family"),
						NSLocalizedString(@"Sko", @"language family"),
						NSLocalizedString(@"South Caucasian", @"language family"),
						NSLocalizedString(@"Subtiaba-Tlapanec", @"language family"),
						NSLocalizedString(@"Tacanan", @"language family"),
						NSLocalizedString(@"Tai-Kadai", @"language family"),
						NSLocalizedString(@"Torricelli", @"language family"),
						NSLocalizedString(@"Totonacan", @"language family"),
						NSLocalizedString(@"Trans New Guinea", @"language family"),
						NSLocalizedString(@"Tucanoan", @"language family"),
						NSLocalizedString(@"Tupi", @"language family"),
						NSLocalizedString(@"Unclassified", @"language family"),
						NSLocalizedString(@"Uralic", @"language family"),
						NSLocalizedString(@"Uru-Chipaya", @"language family"),
						NSLocalizedString(@"Uto-Aztecan", @"language family"),
						NSLocalizedString(@"Wakashan", @"language family"),
						NSLocalizedString(@"West Papuan", @"language family"),
						NSLocalizedString(@"Witotoan", @"language family"),
						NSLocalizedString(@"Yanomam", @"language family"),
						NSLocalizedString(@"Yenisei-Ostyak", @"language family"),
						NSLocalizedString(@"Yukaghir", @"language family"),
						NSLocalizedString(@"Yuki", @"language family"),
						NSLocalizedString(@"Zamucoan", @"language family"),
						NSLocalizedString(@"Zaparoan", @"language family"),
						NSLocalizedString(@"Korean", @"language family"),
						nil];
	return strings;
}

- (NSArray *)groupStrings
{
	NSArray *strings = [NSArray arrayWithObjects:
						NSLocalizedString(@"Invalid", @"general 'invalid' option"),
						NSLocalizedString(@"Albanian", @"language group"),
						NSLocalizedString(@"Armenian", @"language group"),
						NSLocalizedString(@"Atlantic Congo", @"language group"),
						NSLocalizedString(@"Baltic", @"language group"),
						NSLocalizedString(@"Chinese", @"language group"),
						NSLocalizedString(@"Cushitic", @"language group"),
						NSLocalizedString(@"Finno-Ugric", @"language group"),
						NSLocalizedString(@"Georgian", @"language group"),
						NSLocalizedString(@"Germanic", @"language group"),
						NSLocalizedString(@"Greek", @"language group"),
						NSLocalizedString(@"Indo-Iranian", @"language group"),
						NSLocalizedString(@"Italic", @"language group"),
						NSLocalizedString(@"Japanese", @"language group"),
						NSLocalizedString(@"Kam-Tai", @"language group"),
						NSLocalizedString(@"Malayo-Polynesian", @"language group"),
						NSLocalizedString(@"Mon-Khmer", @"language group"),
						NSLocalizedString(@"Ramu", @"language group"),
						NSLocalizedString(@"Semitic", @"language group"),
						NSLocalizedString(@"Slavic", @"language group"),
						NSLocalizedString(@"Southern", @"language group"),
						NSLocalizedString(@"Tibeto-Burman", @"language group"),
						NSLocalizedString(@"Turkic", @"language group"),
						nil];
	return strings;
}

- (NSArray *)subGroupStrings
{
	NSArray *strings = [NSArray arrayWithObjects:
						NSLocalizedString(@"Invalid", @"general 'invalid' option"),
						NSLocalizedString(@"Armenian", @"language sub-group"),
						NSLocalizedString(@"Atlantic", @"language sub-group"),
						NSLocalizedString(@"Attic", @"language sub-group"),
						NSLocalizedString(@"Be-Tai", @"language sub-group"),
						NSLocalizedString(@"Central", @"language sub-group"),
						NSLocalizedString(@"Chinese", @"language sub-group"),
						NSLocalizedString(@"East", @"language sub-group"),
						NSLocalizedString(@"Finno-Permic", @"language sub-group"),
						NSLocalizedString(@"Georgian", @"language sub-group"),
						NSLocalizedString(@"Hungarian", @"language sub-group"),
						NSLocalizedString(@"Indio-Aryan", @"language sub-group"),
						NSLocalizedString(@"Iranian", @"language sub-group"),
						NSLocalizedString(@"Japanese", @"language sub-group"),
						NSLocalizedString(@"Korean", @"language sub-group"),
						NSLocalizedString(@"Lolo-Burmese", @"language sub-group"),
						NSLocalizedString(@"North", @"language sub-group"),
						NSLocalizedString(@"Romance", @"language sub-group"),
						NSLocalizedString(@"South", @"language sub-group"),
						NSLocalizedString(@"Tamil-Kannada", @"language sub-group"),
						NSLocalizedString(@"Tosk", @"language sub-group"),
						NSLocalizedString(@"Viet-Muong", @"language sub-group"),
						NSLocalizedString(@"Volta-Congo", @"language sub-group"),
						NSLocalizedString(@"West", @"language sub-group"),
						NSLocalizedString(@"Yuat-Waibuk", @"language sub-group"),
						nil];
	return strings;
}

@end
