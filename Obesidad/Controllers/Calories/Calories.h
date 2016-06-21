//
//  Calories.h
//  Obesidad
//
//  Created by Galileo Guzman on 6/20/16.
//  Copyright © 2016 Galileo Guzman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <CoreLocation/CoreLocation.h>
#import "ECSlidingViewController.h"
#import "MenuViewController.h"
#import "InitialSlidingViewController.h"
#import "Declarations.h"
#import "CellCalories.h"
#import "WebServices.h"
#import "FoodModel.h"
#import "UIImageView+WebCache.h"
#import "MemoryServices.h"

@interface Calories : UIViewController<UITableViewDataSource, UITableViewDelegate>
- (IBAction)btnMenuPressed:(id)sender;

@property (weak, nonatomic) IBOutlet UIImageView *imgBackground;
@property (weak, nonatomic) IBOutlet UITableView *tblCalories;
@end
