//
//  InitialSlidingViewController.m
//  Obesidad
//
//  Created by Galileo Guzman on 6/20/16.
//  Copyright © 2016 Galileo Guzman. All rights reserved.
//

#import "InitialSlidingViewController.h"

@interface InitialSlidingViewController ()

@end

@implementation InitialSlidingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self prefersStatusBarHidden];
    [self preferredStatusBarStyle];
    UIStoryboard *storyboard;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    }
    else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    }
    
    self.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"homeController"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-------------------------------------------------------------------------------
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

@end
