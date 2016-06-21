//
//  MemoryServices.m
//  Transporte
//
//  Created by Galileo Guzman on 06/04/16.
//  Copyright © 2016 Galileo Guzman. All rights reserved.
//

#import "MemoryServices.h"

#define nNewRoutesData                             @"nNewRoutesData"
#define nNewCabRatesData                           @"nNewCabRatesData"
#define nRoutesProcessed                           @"nRoutesProcessed"



@implementation MemoryServices


//**********************************************************************************************
#pragma mark                            Routes
//**********************************************************************************************
+(void)setNewRoutesInfo:(NSString *)newInfo{
    
    
    NSUserDefaults *userDefaults       = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject: newInfo forKey: nNewRoutesData];
    [userDefaults synchronize];
    
}
+(NSString *)isNewRoutesInfo{
    
    NSUserDefaults *userDefaults       = [NSUserDefaults standardUserDefaults];
    return [userDefaults objectForKey:nNewRoutesData];
}
//-----------------------------------------------------------------------------------------------
+(void)setNewCabRatesInfo:(NSString *)newInfo{
    
    
    NSUserDefaults *userDefaults       = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject: newInfo forKey: nNewCabRatesData];
    [userDefaults synchronize];
    
}
+(NSString *)isNewCabRatesInfo{
    
    NSUserDefaults *userDefaults       = [NSUserDefaults standardUserDefaults];
    return [userDefaults objectForKey:nNewCabRatesData];
}
//-----------------------------------------------------------------------------------------------
+(void)setRoutesProcessed:(NSString *)newInfo{
    
    
    NSUserDefaults *userDefaults       = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject: newInfo forKey: nRoutesProcessed];
    [userDefaults synchronize];
    
}
+(NSString *)areRoutesProcessed{
    
    NSUserDefaults *userDefaults       = [NSUserDefaults standardUserDefaults];
    return [userDefaults objectForKey:nRoutesProcessed];
}
//-----------------------------------------------------------------------------------------------
+ (void)saveJson:(NSDictionary*)json inFile:(NSString*)fileName {
    NSData *data            = [NSKeyedArchiver archivedDataWithRootObject:json];
    NSArray *paths          = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory , NSUserDomainMask, YES);
    NSString *documentsDir  = [paths objectAtIndex:0];
    NSString *fullPath      = [documentsDir stringByAppendingPathComponent:fileName];
    [data writeToFile:fullPath atomically:YES];
}
//-------------------------------------------------------------------
+ (NSDictionary*)readJson:(NSString*)fileName {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory , NSUserDomainMask, YES);
    NSString *documentsDir  = [paths objectAtIndex:0];
    NSString *fullPath      = [documentsDir stringByAppendingPathComponent:fileName];
    NSData *data            = [NSData dataWithContentsOfFile:fullPath];
    NSDictionary *json      = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    return json;
}

//-------------------------------------------------------------------
+ (void)saveCustomArray:(NSMutableArray*)array inFile:(NSString*)fileName {
    //NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:array];
    //[mUserDefaults setObject:encodedObject forKey:fileName];
    //[mUserDefaults synchronize];
    
    NSData *data            = [NSKeyedArchiver archivedDataWithRootObject:array];
    NSArray *paths          = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory , NSUserDomainMask, YES);
    NSString *documentsDir  = [paths objectAtIndex:0];
    NSString *fullPath      = [documentsDir stringByAppendingPathComponent:fileName];
    [data writeToFile:fullPath atomically:YES];
}
//-------------------------------------------------------------------
+ (NSMutableArray*)readCustomArrayFromFile:(NSString*)fileName {
    NSArray *paths          = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory , NSUserDomainMask, YES);
    NSString *documentsDir  = [paths objectAtIndex:0];
    NSString *fullPath      = [documentsDir stringByAppendingPathComponent:fileName];
    NSData *data            = [NSData dataWithContentsOfFile:fullPath];
    NSMutableArray *array   = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    return array;
}
//-------------------------------------------------------------------
+ (void)saveInteger:(int)integer inFile:(NSString*)fileName {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *stTemp = [NSString stringWithFormat:@"%d", integer];
    [defaults setObject: stTemp forKey: fileName];
}
//-------------------------------------------------------------------
+ (int)readIntegerFromFile:(NSString*)fileName {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *stTemp = [defaults objectForKey:fileName];
    return [stTemp intValue];
}
//-------------------------------------------------------------------
+ (void)saveString:(NSString*)string inFile:(NSString*)fileName {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject: string forKey: fileName];
}
//-------------------------------------------------------------------
+ (NSString *)readStringFromFile:(NSString*)fileName {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:fileName];
}
//-------------------------------------------------------------------
+ (void)saveImage:(UIImageView *)myImage inFile:(NSString*)fileName {
    NSData *imageData   = UIImagePNGRepresentation(myImage.image);
    NSString *imagePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:fileName];
    [imageData writeToFile:imagePath atomically:YES];
}
//-------------------------------------------------------------------
+ (UIImage *)readImageFromFile:(NSString*)fileName {
    NSString *imagePath     = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:fileName];
    NSData *imageData       = [NSData dataWithContentsOfFile:imagePath];
    UIImage *imageView;
    imageView               = [UIImage imageWithData:imageData];
    return imageView;
}

@end
