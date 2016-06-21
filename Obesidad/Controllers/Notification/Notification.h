//
//  Notification.h
//  Obesidad
//
//  Created by Galileo Guzman on 6/21/16.
//  Copyright © 2016 Galileo Guzman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Notification : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *lblTextNotification;

@property (weak, nonatomic) IBOutlet UIView *vWrapper;

@property (nonatomic, strong) NSString *stNotificationText;
@end
