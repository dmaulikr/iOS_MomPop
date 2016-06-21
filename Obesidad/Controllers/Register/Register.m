//
//  Register.m
//  Obesidad
//
//  Created by Galileo Guzman on 6/21/16.
//  Copyright © 2016 Galileo Guzman. All rights reserved.
//

#import "Register.h"

@interface Register ()

@end

@implementation Register

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnSignInPressed:(id)sender {
    
    
    [[Digits sharedInstance] authenticateWithCompletion:^(DGTSession *session, NSError *error) {
        [[Digits sharedInstance]logOut];
        
        
        UIStoryboard *board = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        InitialSlidingViewController *vc    = [board instantiateViewControllerWithIdentifier:@"InitialSlidingViewController"];
        AppDelegate *appDelegate            = (AppDelegate *)[UIApplication sharedApplication].delegate;
        [appDelegate transitionToViewController:vc withTransition:UIViewAnimationOptionTransitionFlipFromRight];
    }];
}
@end
