//
//  Language.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/31.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

// family
#define LF_AFRO_ASIATIC			1
#define LF_ALACALUFAN			2
#define LF_ALGIC				3
#define LF_ALTAIC				4
#define LF_AMTO_MUSAN			5
#define LF_ANDAMANESE			6
#define LF_ARAUAN				7
#define LF_ARAUCANIAN			8
#define LF_ARAWAKAN				9
#define LF_ARTIFICIAL			10
#define LF_ARUTANI_SAPE			11
#define LF_AUSTRALIAN			12
#define LF_AUSTRO_ASIATIC		13
#define LF_AUSTRONESIAN			14
#define LF_AYMARAN				15
#define LF_BARBACOAN			16
#define LF_BASQUE				17
#define LF_BAYONO_AWBONO		18
#define LF_CADDOAN				19
#define LF_CAHUAPANAN			20
#define LF_CANT					21
#define LF_CARIB				22
#define LF_CHAPACURA_WANHAM		23
#define LF_CHIBCHAN				24
#define LF_CHIMAKUAN			25
#define LF_CHOCO				26
#define LF_CHON					27
#define LF_CHUKOTKO_KAMCHATKAN	28
#define LF_CHUMASH				29
#define LF_COAHUILTECAN			30
#define LF_CREOLE				31
#define LF_DEAF_SIGN_LANGUAGE	32
#define LF_DRAVIDIAN			33
#define LF_EAST_BIRDS_HEAD		34
#define LF_EAST_PAPUAN			35
#define LF_ESKIMO_ALEUT			36
#define LF_GEELVINK_BAY			37
#define LF_GUAHIBAN				38
#define LF_GULF					39
#define LF_HARAKMBET			40
#define LF_HMONG_MIEN			41
#define LF_HOKAN				42
#define LF_HUAVEAN				43
#define LF_INDO_EUROPEAN		44
#define LF_IROQUOIAN			45
#define LF_JAPANESE				46
#define LF_JIVAROAN				47
#define LF_KATUKINAN			48
#define LF_KERES				49
#define LF_KHOISAN				50
#define LF_KIOWA_TANOAN			51
#define LF_KWOMTARI_BAIBAI		52
#define LF_LANGUAGE_ISOLATE		53
#define LF_LEFT_MAY				54
#define LF_LOWER_MAMBERAMO		55
#define LF_LULE_VILELA			56
#define LF_MACRO_GE				57
#define LF_MAKU					58
#define LF_MASCOIAN				59
#define LF_MATACO_GUAICURU		60
#define LF_MAYAN				61
#define LF_MISUMALPAN			62
#define LF_MIXE_ZOQUE			63
#define LF_MIXED_LANGUAGE		64
#define LF_MOSETENAN			65
#define LF_MURA					66
#define LF_MUSKOGEAN			67
#define LF_NA_DENE				68
#define LF_NAMBIQUARAN			69
#define LF_NIGER_CONGO			70
#define LF_NILO_SAHARAN			71
#define LF_NORTH_CAUCASIAN		72
#define LF_OTO_MANGUEAN			73
#define LF_PAEZAN				74
#define LF_PANOAN				75
#define LF_PEBA_YAGUAN			76
#define LF_PENUTIAN				77
#define LF_PIDGIN				78
#define LF_QUECHUAN				79
#define LF_SALISHAN				80
#define LF_SALIVAN				81
#define LF_SEPIK_RAMU			82
#define LF_SIGN_LANGUAGE		83
#define LF_SINO_TIBETAN			84
#define LF_SIOUAN				85
#define LF_SKO					86
#define LF_SOUTH_CAUCASIAN		87
#define LF_SUBTIABA_TLAPANEC	88
#define LF_TACANAN				89
#define LF_TAI_KADAI			90
#define LF_TORRICELLI			91
#define LF_TOTONACAN			92
#define LF_TRANS_NEW_GUINEA		93
#define LF_TUCANOAN				94
#define LF_TUPI					95
#define LF_UNCLASSIFIED			96
#define LF_URALIC				97
#define LF_URU_CHIPAYA			98
#define LF_UTO_AZTECAN			99
#define LF_WAKASHAN				100
#define LF_WEST_PAPUAN			101
#define LF_WITOTOAN				102
#define LF_YANOMAM				103
#define LF_YENISEI_OSTYAK		104
#define LF_YUKAGHIR				105
#define LF_YUKI					106
#define LF_ZAMUCOAN				107
#define LF_ZAPAROAN				108
#define LF_KOREAN				109

// group
#define LG_ALBANIAN				1
#define LG_ARMENIAN				2
#define LG_ATLANTIC_CONGO		3
#define LG_BALTIC				4
#define LG_CHINESE				5
#define LG_CUSHITIC				6
#define LG_FINNO_UGRIC			7
#define LG_GEORGIAN				8
#define LG_GERMANIC				9
#define LG_GREEK				10
#define LG_INDO_IRANIAN			11
#define LG_ITALIC				12
#define LG_JAPANESE				13
#define LG_KAM_TAI				14
#define LG_MALAYO_POLYNESIAN	15
#define LG_MON_KHMER			16
#define LG_RAMU					17
#define LG_SEMITIC				18
#define LG_SLAVIC				19
#define LG_SOUTHERN				20
#define LG_TIBETO_BURMAN		21
#define LG_TURKIC				22

// sub group
#define LSG_ARMENIAN		1
#define LSG_ATLANTIC		2
#define LSG_ATTIC			3
#define LSG_BE_TAI			4
#define LSG_CENTRAL			5
#define LSG_CHINESE			6
#define LSG_EAST			7
#define LSG_FINNO_PERMIC	8
#define LSG_GEORGIAN		9
#define LSG_HUNGARIAN		10
#define LSG_INDO_ARYAN		11
#define LSG_IRANIAN			12
#define LSG_JAPANESE		13
#define LSG_KOREAN			14
#define LSG_LOLO_BURMESE	15
#define LSG_NORTH			16
#define LSG_ROMANCE			17
#define LSG_SOUTH			18
#define LSG_TAMIL_KANNADA	19
#define LSG_TOSK			20
#define LSG_VIET_MUONG		21
#define LSG_VOLTA_CONGO		22
#define LSG_WEST			23
#define LSG_YUAT_WAIBUK		24

@interface Language : NSObject {
	char databaseClass, nameGender, influence, difficulty;
	short family, group, subGroup;
	int databaseFileOffset, nationID, rowID, UID;
	
	NSString *name;
}

@property(assign,readwrite) char databaseClass, nameGender, influence, difficulty;
@property(assign,readwrite) short family, group, subGroup;
@property(assign,readwrite) int databaseFileOffset, nationID, rowID, UID;
@property(copy,readwrite) NSString *name;

- (NSArray *)familyStrings;
- (NSArray *)groupStrings;
- (NSArray *)subGroupStrings;

@end
