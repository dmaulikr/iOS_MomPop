//
//  AppDelegate.h
//  Obesidad
//
//  Created by Galileo Guzman on 6/20/16.
//  Copyright © 2016 Galileo Guzman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Notification.h"
#import "UIViewController+MaryPopin.h"
#import <Fabric/Fabric.h>
#import <DigitsKit/DigitsKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
- (void)transitionToViewController:(UIViewController *)viewController withTransition:(UIViewAnimationOptions)transition;

@end

