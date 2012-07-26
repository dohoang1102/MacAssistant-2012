//
//  FMFArchiver.m
//  FM10SX
//
//  Created by Amy Kettlewell on 10/08/05.
//  Copyright 2010 littleblue. All rights reserved.
//

#import "FMFArchiver.h"
#import "SupportFunctions.h"
#import "SXzlib.h"
#import "FMString.h"

@implementation FMFArchiver

+ (void)extractFMF:(NSString *)path
{
	unsigned int byteOffset = 0;
	unsigned int fmf1Length, fmf2Offset;
	NSData *decompressedData;
	BOOL compressed;
	
	NSString *decompressPath = [NSString stringWithFormat:@"%@",[path stringByDeletingPathExtension]];
	[[NSFileManager defaultManager] createDirectoryAtPath:decompressPath withIntermediateDirectories:YES attributes:nil error:nil];
	
	// load the file into memory
	NSData *fileData = [[NSData alloc] initWithContentsOfFile:path];
	
	byteOffset +=2;
	
	// read the file extension
	[SupportFunctions readCStringFromData:fileData atOffset:&byteOffset length:4];
	
	byteOffset += 3;
	
	[fileData getBytes:&fmf1Length range:NSMakeRange(byteOffset, 4)]; byteOffset += 4;
	
	//	0x04 ???
	byteOffset += 4;
	
	[fileData getBytes:&compressed range:NSMakeRange(byteOffset, 1)]; byteOffset += 1;
	
	// skip to fmf 2 (post headers) for filenames
	fmf2Offset = fmf1Length + 18;
	
	// decompress info
	decompressedData = [[fileData subdataWithRange:NSMakeRange(fmf2Offset, ([fileData length] - fmf2Offset))] zlibInflate];

	// skip unknown bytes
	fmf2Offset = 4;
	
	[self parseFMFDirectory:decompressedData atOffset:&fmf2Offset path:@"" fromFile:decompressPath withData:fileData isCompressed:compressed];
	
	[fileData release];
}

+ (void)parseFMFDirectory:(NSData *)decompressedData atOffset:(unsigned int *)offset path:(NSString *)path fromFile:(NSString *)filePath withData:(NSData *)fileData isCompressed:(BOOL)compressed
{
	NSMutableDictionary *fileInfo;
	unsigned int fmf2Offset = *offset;
	int ibuffer;
	short filecount, dircount;
	
	// parse root files
	[decompressedData getBytes:&filecount range:NSMakeRange(fmf2Offset, 2)]; fmf2Offset += 2;
	for (int i=0; i<filecount; i++) {
		fileInfo = [[NSMutableDictionary alloc] init];
		NSString *filename = [FMString readFromData:decompressedData atOffset:&fmf2Offset];
		NSString *extension = [FMString readFromData:decompressedData atOffset:&fmf2Offset];
		[fileInfo setObject:[NSString stringWithFormat:@"%@%@",filename,extension] forKey:@"filename"];
		[decompressedData getBytes:&ibuffer range:NSMakeRange(fmf2Offset, 4)]; fmf2Offset += 4;
		[fileInfo setObject:[NSNumber numberWithUnsignedInt:ibuffer] forKey:@"startOffset"];
	
		[decompressedData getBytes:&ibuffer range:NSMakeRange(fmf2Offset, 4)]; fmf2Offset += 4;
		[fileInfo setObject:[NSNumber numberWithUnsignedInt:ibuffer] forKey:@"compressedFileLength"];
		
		[decompressedData getBytes:&ibuffer range:NSMakeRange(fmf2Offset, 4)]; fmf2Offset += 4;
		[fileInfo setObject:[NSNumber numberWithUnsignedInt:ibuffer] forKey:@"fileLength"];
		
		NSMutableString *newPath = [NSMutableString stringWithFormat:@"%@/",filePath];
		if ([path length]>0) { [newPath appendString:[NSString stringWithFormat:@"%@/",path]] ; }
		[newPath appendString:[NSString stringWithFormat:@"%@",[fileInfo objectForKey:@"filename"]]];
		
		NSData *newData;
		
		if (compressed) {
			newData = [[fileData subdataWithRange:NSMakeRange(([[fileInfo objectForKey:@"startOffset"] intValue] +18),[[fileInfo objectForKey:@"compressedFileLength"] intValue])] zlibInflate];
		}
		else {
			newData = [fileData subdataWithRange:NSMakeRange(([[fileInfo objectForKey:@"startOffset"] intValue] +18),[[fileInfo objectForKey:@"fileLength"] intValue])];
		}
		[fileInfo release];
		
		[[NSFileManager defaultManager] createFileAtPath:newPath contents:newData attributes:nil];
	}
	// parse sub-directories
	[decompressedData getBytes:&dircount range:NSMakeRange(fmf2Offset, 2)]; fmf2Offset += 2;
	
	for (int j=0; j<dircount; j++) {
		NSString *str = [FMString readFromData:decompressedData atOffset:&fmf2Offset];
		
		NSString *newPath;
		if ([path length]>0) { newPath = [NSString stringWithFormat:@"%@/%@",path,str]; }
		else { newPath = str; }
		
		[[NSFileManager defaultManager] createDirectoryAtPath:[NSString stringWithFormat:@"%@/%@",filePath,newPath] withIntermediateDirectories:YES attributes:nil error:nil];
		
		[self parseFMFDirectory:decompressedData atOffset:&fmf2Offset path:newPath fromFile:filePath withData:fileData isCompressed:compressed];
	}
	*offset = fmf2Offset;
}	

@end
