//
//  Notification.m
//  Obesidad
//
//  Created by Galileo Guzman on 6/21/16.
//  Copyright © 2016 Galileo Guzman. All rights reserved.
//

#import "Notification.h"

@interface Notification ()

@end

@implementation Notification

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initController{
    UIColor *myColor = [UIColor colorWithRed:(0 / 255.0) green:(0 / 255.0) blue:(0 / 255.0) alpha: 0.6];
    self.view.backgroundColor = myColor;
    
    self.vWrapper.layer.cornerRadius = 10;
    self.vWrapper.layer.masksToBounds = YES;
    
}


@end
