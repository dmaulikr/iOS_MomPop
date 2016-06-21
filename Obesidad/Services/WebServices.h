//
//  WebServices.h
//  Obesidad
//
//  Created by Galileo Guzman on 6/21/16.
//  Copyright © 2016 Galileo Guzman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FoodModel.h"

@interface WebServices : NSObject
+ (void)getFoodsWithCompletionHandler:(void (^)(NSMutableArray *foods)) handler;
@end
