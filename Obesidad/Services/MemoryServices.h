//
//  MemoryServices.h
//  Transporte
//
//  Created by Galileo Guzman on 06/04/16.
//  Copyright © 2016 Galileo Guzman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


#define arFood                 @"arFood"



@interface MemoryServices : NSObject
// -----------------------------------------------------------------
// CLASS FOR READ AND WRITE ON MEMORY
// -----------------------------------------------------------------
+ (void)saveJson:(NSDictionary*)json inFile:(NSString*)fileName;
+ (NSDictionary*)readJson:(NSString*)fileName;
+ (void)saveCustomArray:(NSMutableArray*)array inFile:(NSString*)fileName;
+ (NSMutableArray*)readCustomArrayFromFile:(NSString*)fileName;
+ (void)saveInteger:(int)integer inFile:(NSString*)fileName;
+ (int)readIntegerFromFile:(NSString*)fileName;
+ (void)saveString:(NSString*)string inFile:(NSString*)fileName;
+ (NSString *)readStringFromFile:(NSString*)fileName;
+ (void)saveImage:(UIImageView *)myImage inFile:(NSString*)fileName;
+ (UIImage *)readImageFromFile:(NSString*)fileName;

+(void)setNewRoutesInfo:(NSString *)newInfo;
+(NSString *)isNewRoutesInfo;

+(void)setNewCabRatesInfo:(NSString *)newInfo;
+(NSString *)isNewCabRatesInfo;

+(void)setRoutesProcessed:(NSString *)newInfo;
+(NSString *)areRoutesProcessed;
@end
