//
//  Register.h
//  Obesidad
//
//  Created by Galileo Guzman on 6/21/16.
//  Copyright © 2016 Galileo Guzman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DigitsKit/DigitsKit.h>
#import <QuartzCore/QuartzCore.h>
#import "AppDelegate.h"
#import "ECSlidingViewController.h"
#import "MenuViewController.h"
#import "InitialSlidingViewController.h"
#import "Declarations.h"

@interface Register : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *txtPhone;
- (IBAction)btnSignInPressed:(id)sender;
@end
