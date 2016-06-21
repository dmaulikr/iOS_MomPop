//
//  AppDelegate.m
//  Obesidad
//
//  Created by Galileo Guzman on 6/20/16.
//  Copyright © 2016 Galileo Guzman. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    if ([UIApplication instancesRespondToSelector:@selector(registerUserNotificationSettings:)]){
        
        [application registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeBadge|UIUserNotificationTypeSound categories:nil]];
    }
    
    [launchOptions valueForKey:UIApplicationLaunchOptionsLocalNotificationKey];
    
    return YES;
}

-(void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    
    
    
    
    Notification *popin = [[Notification alloc] init];
    
    popin.stNotificationText = [notification.userInfo objectForKey:@"message"];
    
    [popin setPopinTransitionStyle:BKTPopinTransitionStyleZoom];
    [popin setPopinTransitionDirection:BKTPopinTransitionDirectionTop];
    [popin setPopinAlignment:0];
    
    BKTBlurParameters *blurParameters       = [BKTBlurParameters new];
    blurParameters.alpha                    = 1.0f;
    blurParameters.radius                   = 8.0f;
    blurParameters.saturationDeltaFactor    = 1.8f;
    [popin setBlurParameters:blurParameters];
    [popin setPopinOptions:[popin popinOptions]|BKTPopinBlurryDimmingView];
    [popin setPopinOptions:BKTPopinIgnoreKeyboardNotification];
    [popin setPreferedPopinContentSize:CGSizeMake(self.window.frame.size.width, self.window.frame.size.height)];
    [popin setPopinTransitionDirection:BKTPopinTransitionDirectionTop];
    [self.window.rootViewController presentPopinController:popin animated:YES completion:nil];
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

/*TRANSITION TO VIEW CONTROLLER*/

- (void)transitionToViewController:(UIViewController *)viewController
                    withTransition:(UIViewAnimationOptions)transition
{
    [UIView transitionFromView:self.window.rootViewController.view
                        toView:viewController.view
                      duration:0.65f
                       options:transition
                    completion:^(BOOL finished){
                        self.window.rootViewController = viewController;
                    }];
}
@end
