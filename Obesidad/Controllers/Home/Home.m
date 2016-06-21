//
//  Home.m
//  Obesidad
//
//  Created by Galileo Guzman on 6/20/16.
//  Copyright © 2016 Galileo Guzman. All rights reserved.
//

#import "Home.h"

@interface Home ()

@end

@implementation Home

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self configLocalNotification];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
    
    // Add a shadow to the top view so it looks like it is on top of the others
    self.view.layer.shadowOpacity = 0.75f;
    self.view.layer.shadowRadius = 10.0f;
    self.view.layer.shadowColor = [[UIColor blackColor] CGColor];
    
    // Tell it which view should be created under left
    if (![self.slidingViewController.underLeftViewController isKindOfClass:[MenuViewController class]]) {
        self.slidingViewController.underLeftViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"MenuView"];
    }
    
    // Add the pan gesture to allow sliding
    [self.view addGestureRecognizer:self.slidingViewController.panGesture];
}

- (IBAction)btnMenuPressed:(id)sender {
    [self.slidingViewController anchorTopViewTo:ECRight];
}

-(void)configLocalNotification{
    
    NSLog(@"Config notification");
    
    NSDictionary *userInfo = @{@"message" : @"Hellow notification!!!"};
    
    
    
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    notification.fireDate = [NSDate dateWithTimeIntervalSinceNow:5];
    notification.alertBody = @"Hellow notification!!!";
    notification.userInfo = userInfo;
    notification.timeZone = [NSTimeZone defaultTimeZone];
    notification.soundName = UILocalNotificationDefaultSoundName;
    //notification.applicationIconBadgeNumber = 1;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
}
@end
