//
//  ViewController.m
//  Obesidad
//
//  Created by Galileo Guzman on 6/20/16.
//  Copyright © 2016 Galileo Guzman. All rights reserved.
//

#import "Start.h"

@interface Start ()

@end

@implementation Start

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    UIStoryboard *board = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    InitialSlidingViewController *vc    = [board instantiateViewControllerWithIdentifier:@"InitialSlidingViewController"];
    AppDelegate *appDelegate            = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [appDelegate transitionToViewController:vc withTransition:UIViewAnimationOptionTransitionFlipFromRight];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
