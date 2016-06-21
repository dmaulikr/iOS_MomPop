//
//  MenuViewController.h
//  Obesidad
//
//  Created by Galileo Guzman on 6/20/16.
//  Copyright © 2016 Galileo Guzman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "ECSlidingViewController.h"
#import "CellMenu.h"
#import "Declarations.h"


@interface MenuViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tblMenu;
@end
