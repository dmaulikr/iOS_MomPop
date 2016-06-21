//
//  WebServices.m
//  Obesidad
//
//  Created by Galileo Guzman on 6/21/16.
//  Copyright © 2016 Galileo Guzman. All rights reserved.
//

#import "WebServices.h"


#define URLServer           @"https://dxennmnpgv.localtunnel.me/"
#define URLFoods            @"api/v1/foods/?format=json"

@implementation WebServices

+ (void)getFoodsWithCompletionHandler:(void (^)(NSMutableArray *foods)) handler{
    
    NSURLSession *session = [self getSession];
    NSMutableURLRequest * request = [self getRequest:[URLServer stringByAppendingString:URLFoods] forData:nil];
    
    // Request with handler
    [[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSDictionary *jsonResponse = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        
        
        if(jsonResponse!=nil){
            dispatch_async(dispatch_get_main_queue(), ^{
                
                NSError *err = nil;
                
                NSMutableArray *foods = [FoodModel arrayOfModelsFromDictionaries:[jsonResponse objectForKey:@"objects"] error:&err];
                
                handler(foods);
                
            });
        }
        
    }] resume];
}


//----------------------------------------------------------------------------------------------
#pragma mark - Common methods
//----------------------------------------------------------------------------------------------
+ (NSMutableURLRequest *) getRequest:(NSString *)postUrl forData:(NSString *)data{
    
    NSString * tempUrl = postUrl;
    NSString * tempData = data;
    NSString *post = [[NSString alloc] initWithFormat:@"data=%@", tempData];
    post = [post stringByReplacingOccurrencesOfString:@"+" withString:@"%2B"];
    NSURL *url = [NSURL URLWithString:tempUrl];
    NSData *postData = [post dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:url];
    [request setHTTPMethod:@"GET"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"iOS Mom and Pop" forHTTPHeaderField:@"User-Agent"];
    
    
    [request setHTTPBody:postData];
    [NSURLRequest requestWithURL:url];
    
    return request;
}
//--------------------------------------------------------------------------------------------
+(NSURLSession *)getSession{
    
    // Create Session Configuration
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    // Configure Session Configuration
    [sessionConfiguration setAllowsCellularAccess:YES];
    [sessionConfiguration setHTTPMaximumConnectionsPerHost:20];
    [sessionConfiguration setHTTPAdditionalHeaders:@{@"Accept" : @"application/json"}];
    
    return [NSURLSession sessionWithConfiguration:sessionConfiguration];
}
//*********************************************************************************************
#pragma mark                                alloc
//*********************************************************************************************
+ (id)alloc {
    [NSException raise:@"Cannot be instantiated!" format:@"Static class 'WebServices' cannot be instantiated!"];
    return nil;
}
@end
