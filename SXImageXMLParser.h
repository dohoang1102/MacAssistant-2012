//
//  SXImageXMLParser.h
//  FM10SX
//
//  Created by Amy Kettlewell on 09/10/30.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface SXImageXMLParser : NSObject {
	NSString *fileBase;
	
	NSMutableDictionary *homeKits, *awayKits, *thirdKits;
	NSMutableDictionary *smallClubLogos, *clubLogos, *hugeClubLogos;
	NSMutableDictionary *smallCompetitionLogos, *competitionLogos, *hugeCompetitionLogos;
	NSMutableDictionary *smallNationLogos, *nationLogos, *hugeNationLogos, *nationFlags;
	NSMutableDictionary *smallContinentLogos, *continentLogos, *hugeContinentLogos;
	NSMutableDictionary *personPhotos, *smallPersonPhotos;
}

- (void)parsePathForGraphics:(NSString *)basePath;
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict;

@property (copy,readwrite) NSMutableDictionary *homeKits, *awayKits, *thirdKits, *smallClubLogos,
*clubLogos, *hugeClubLogos, *smallCompetitionLogos, *competitionLogos, *hugeCompetitionLogos,
*smallNationLogos, *nationLogos, *hugeNationLogos, *nationFlags, *smallContinentLogos, 
*continentLogos, *hugeContinentLogos, *personPhotos, *smallPersonPhotos;

@end
