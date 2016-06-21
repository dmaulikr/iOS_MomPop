//
//  MenuViewController.m
//  Obesidad
//
//  Created by Galileo Guzman on 6/20/16.
//  Copyright © 2016 Galileo Guzman. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()
@property (nonatomic, strong) NSArray *menuItems;
@property (nonatomic, strong) NSArray *menuIcons;
@end

@implementation MenuViewController

- (void)awakeFromNib {
    self.menuItems =  @[@"Mi hijo",
                        @"Calorias recomendadas",
                        @"Comida recomendada",
                        @"Acerca de"];
    self.menuIcons =  @[@"icMySon.png",
                        @"icCalories.png",
                        @"icFood.png",
                        @"icAbout.png"];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tblMenu setContentInset:UIEdgeInsetsMake(35, 0, 0, 0)];
    
    
    // ----------------------------------------------------------------
    // Tell it which view should be created under left
    // ----------------------------------------------------------------
    if (![self.slidingViewController.underLeftViewController isKindOfClass:[MenuViewController class]]) {
        self.slidingViewController.underLeftViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"MenuView"];
    }
    
    
    // ----------------------------------------------------------------
    // Add the pan gesture to allow sliding
    // ----------------------------------------------------------------
    [self.view addGestureRecognizer:self.slidingViewController.panGesture];
    [self.slidingViewController setAnchorRightRevealAmount:280.0f];
    self.slidingViewController.underLeftWidthLayout = ECFullWidth;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/**********************************************************************************************/
#pragma mark - Table delegate methods
/**********************************************************************************************/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
//-------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.menuItems count];
}
//-------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}
//-------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"cellMenu";
    
    CellMenu *cell = (CellMenu *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"CellMenu" bundle:nil] forCellReuseIdentifier:CellIdentifier];
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    }
    
    cell.lblItemMenu.text = self.menuItems[indexPath.row];
    cell.imgItemMenu.image = [UIImage imageNamed:self.menuIcons[indexPath.row]];
    
    return cell;
}
//-------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *newTopViewController;
    switch (indexPath.row + 1)
    {
        case nHome:
            //newTopViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"HomeView"];
            newTopViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"homeController"];
            break;
        case nCalories:
            newTopViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"homeController"];
            break;
        case nFood:
            newTopViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"homeController"];
            break;
        case nAbout:
            newTopViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"aboutController"];
            break;
        default:
            break;
    }
    
    [self.slidingViewController anchorTopViewOffScreenTo:ECRight animations:nil onComplete:^{
        CGRect frame = self.slidingViewController.topViewController.view.frame;
        self.slidingViewController.topViewController = newTopViewController;
        self.slidingViewController.topViewController.view.frame = frame;
        [self.slidingViewController resetTopView];
    }];
}
@end
