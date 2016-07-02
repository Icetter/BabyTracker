//
//  MainScreenViewController.m
//  BabyTracker
//
//  Created by Iceman on 18.06.16.
//  Copyright © 2016 Kirill Zhukov. All rights reserved.
//

#import "MainScreenViewController.h"
#import "MedicalCardViewController.h"
#import "FeedViewController.h"
#import "SleepViewController.h"
#import "StrollViewController.h"
#import "AddChildViewController.h"
#import "ListViewController.h"
#import "TimerViewController.h"
#import "MeasuresViewController.h"

@interface MainScreenViewController ()
@property (strong, nonatomic) IBOutlet UIBarButtonItem *childListBarButton;
@property (strong, nonatomic) IBOutlet UILabel *childAgeLabel;
@property (strong, nonatomic) IBOutlet UILabel *childNameLabel;
@property (strong, nonatomic) IBOutlet UIImageView *childImage;

@end

@implementation MainScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = _childListBarButton;
}

- (IBAction)childListBarButtonAction:(id)sender {
    [self.navigationController pushViewController:[AddChildViewController new] animated:YES];
}

- (IBAction)medicalCardButtonAction:(id)sender {
    [self.navigationController pushViewController:[MedicalCardViewController new] animated:YES];
}

- (IBAction)sleepButtonAction:(id)sender {
    [self.navigationController pushViewController:[SleepViewController new] animated:YES];
}

- (IBAction)feedButtonAction:(id)sender {
      [self.navigationController pushViewController:[FeedViewController new] animated:YES];
}

- (IBAction)strollButtonAction:(id)sender {
      [self.navigationController pushViewController:[StrollViewController new] animated:YES];
}
- (IBAction)timersListActionButton:(id)sender {
     [self.navigationController pushViewController:[ListViewController new] animated:YES];
}

@end
