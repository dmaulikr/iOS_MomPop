//
//  Home.m
//  Obesidad
//
//  Created by Galileo Guzman on 6/20/16.
//  Copyright © 2016 Galileo Guzman. All rights reserved.
//

#import "Home.h"

@interface Home ()
@property (nonatomic, strong) NSArray *arTextNotification;
@end

@implementation Home

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initController];
    
}

-(void) initController{
    
    self.arTextNotification = @[
                                @"Coloca el recipiente de pompones y las tazas pequeñas vacías en una mesa o superficie plana, al alcance de tu niño. Pídele a tu hijito que tome uno a uno los pompones con las pinzas, y que los deposite en cada taza por color.",
                                @"Practicando los colores. Además de fomentar sus habilidades motoras finas, este fantástico ejercicio le permitirá a tu pequeño practicar los colores.",
                                @"Un divertido reto. Esta actividad con bandas elásticas y tubos de cartón parece muy simple, pero para los niños puede convertirse en un divertido reto.",
                                @"Pídele a tu niño que coloque tantas bandas elásticas como pueda alrededor de los tubos de cartón. Las bandas crean resistencia al extenderlas, así que deberá utilizar los músculos de sus manos para hacer la fuerza necesaria para colocarlas en los tubos. ¡Le encantará el reto!",
                                @"Arte con pegatinas Las pegatinas (calcomanías) suelen ser uno de los materiales de arte favoritos de los pequeños. No hay niño que se resista a pegar y despegar.",
                                @"Dibuja (o deja que tu niño lo haga) diferentes figuras sobre el papel. Luego pídele a tu pequeño que coloque las pegatinas sobre los bordes de la figuras.",
                                ];
    
    
    
    
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
    
    int numberMessage = 0 + arc4random() % (5 - 0);
    NSString *message = self.arTextNotification[numberMessage];
    NSDictionary *userInfo = @{@"message" : message};
    
    
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    notification.fireDate = [NSDate dateWithTimeIntervalSinceNow:5];
    notification.alertBody = [userInfo objectForKey:@"message"];
    notification.userInfo = userInfo;
    notification.timeZone = [NSTimeZone defaultTimeZone];
    notification.soundName = UILocalNotificationDefaultSoundName;
    //notification.applicationIconBadgeNumber = 1;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
}
@end
