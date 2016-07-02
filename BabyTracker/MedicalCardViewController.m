//
//  MedicalCardViewController.m
//  BabyTracker
//
//  Created by Iceman on 18.06.16.
//  Copyright © 2016 Kirill Zhukov. All rights reserved.
//

#import "MedicalCardViewController.h"
#import "TimerViewController.h"
#import "MeasuresViewController.h"

@interface MedicalCardViewController ()
@property (strong, nonatomic) IBOutlet UILabel *measurementsLabel;
@property (strong, nonatomic) IBOutlet UILabel *heightLabel;
@property (strong, nonatomic) IBOutlet UILabel *weightLabel;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MedicalCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)addMeasuresActionButton:(UIButton *)sender {
    [self.navigationController pushViewController:[MeasuresViewController new] animated:YES];
}

- (IBAction)medicalTimerActionButton:(UIButton *)sender {
    [self.navigationController pushViewController:[TimerViewController new] animated:YES];
}

@end
