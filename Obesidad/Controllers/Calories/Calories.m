//
//  Calories.m
//  Obesidad
//
//  Created by Galileo Guzman on 6/20/16.
//  Copyright © 2016 Galileo Guzman. All rights reserved.
//

#import "Calories.h"

#define URLMedia           @"https://jjozstjtbh.localtunnel.me/public/"

@interface Calories ()
@property (nonatomic, strong) NSArray *arDataCalories;
@end

@implementation Calories

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initController];
}

-(void)initController{
    
    UIColor *myColor = [UIColor colorWithRed:(0 / 255.0) green:(0 / 255.0) blue:(0 / 255.0) alpha: 0.6];
    UIView *vImageBackground = [[UIView alloc] init];
    vImageBackground.frame = self.view.frame;
    vImageBackground.backgroundColor = myColor;
    
    [self.imgBackground addSubview:vImageBackground];
    [UIApplication sharedApplication].networkActivityIndicatorVisible   = YES;
    
    [self queueLoadData];
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


/**********************************************************************************************/
#pragma mark - Table delegate methods
/**********************************************************************************************/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
//-------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.arDataCalories count];
}
//-------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 160;
}
//-------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"cellCalories";
    CellCalories *cell = (CellCalories *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"CellCalories" bundle:nil] forCellReuseIdentifier:CellIdentifier];
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    }
    
    FoodModel *food = [FoodModel alloc];
    food = self.arDataCalories[indexPath.row];
    
    cell.titleCell.text = food.name;
    cell.descriptionCell.text = food.desc;
    
    //NSURL *urlImage = [NSURL URLWithString:[URLMedia stringByAppendingString:food.image]];
    
    cell.imageCell.image = [UIImage imageNamed:@"imageFood.png"];
    
    //[cell.imageCell sd_setImageWithURL:urlImage placeholderImage:[UIImage imageNamed:@"imageFood.png"] options:SDWebImageRefreshCached];
    
    return cell;
}
//-------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - LOAD DATA FROM WEB SERVICES

-(void)queueLoadData{
    [UIApplication sharedApplication].networkActivityIndicatorVisible   = YES;
    
    
    
    NSOperationQueue *queue         = [NSOperationQueue new];
    
    NSInvocationOperation *opInit = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(loadDataMemory) object:nil];
    [queue addOperation:opInit];
    
    NSInvocationOperation *opRequest = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(loadDataRequest) object:nil];
    [opRequest addDependency:opInit];
    [queue addOperation:opRequest];
    
    NSInvocationOperation *opSaveMem = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(saveOnMemory) object:nil];
    [opSaveMem addDependency:opRequest];
    [queue addOperation:opSaveMem];
    
    NSInvocationOperation *opDidGet = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(didLoadData) object:nil];
    [opDidGet addDependency:opInit];
    [queue addOperation:opDidGet];
}

-(void)loadDataMemory{
    self.arDataCalories = (NSArray*)[MemoryServices readCustomArrayFromFile:arFood];
}

-(void)loadDataRequest{
    [WebServices getFoodsWithCompletionHandler:^(NSMutableArray *foods) {
        // code
        
        if(foods != nil){
            self.arDataCalories = foods;
            [MemoryServices saveCustomArray:(NSMutableArray*)self.arDataCalories inFile:arFood];
        }else{
            self.arDataCalories = [MemoryServices readCustomArrayFromFile:arFood];
        }

        [self didLoadData];
    }];
}

-(void)saveOnMemory{
    [MemoryServices saveCustomArray:(NSMutableArray*)self.arDataCalories inFile:arFood];
}

- (void)didLoadData {
    [UIApplication sharedApplication].networkActivityIndicatorVisible   = NO;
    dispatch_async(dispatch_get_main_queue(), ^{
        [self reloadCurrentTable];
    });
}

- (void) reloadCurrentTable {
    [self.tblCalories reloadData];
}
@end
