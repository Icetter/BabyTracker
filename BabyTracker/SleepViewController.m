//
//  SleepViewController.m
//  BabyTracker
//
//  Created by Iceman on 18.06.16.
//  Copyright © 2016 Kirill Zhukov. All rights reserved.
//

#import "SleepViewController.h"
#import "ListViewController.h"
#import "TimerViewController.h"

@interface SleepViewController ()
@property (strong, nonatomic) IBOutlet UILabel *timerLabel;
@property (strong, nonatomic) IBOutlet UILabel *timeLapsedLabel;
@property (strong, nonatomic) IBOutlet UILabel *babySleepsLabel;

@end

@implementation SleepViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)sleepStartActionButton:(id)sender {
}
- (IBAction)sleepStopActionButton:(id)sender {
}
- (IBAction)addSleepActionButton:(id)sender {
}

- (IBAction)sleepTimerActionButton:(id)sender {
    [self.navigationController pushViewController:[TimerViewController new] animated:YES];
}

- (IBAction)sleepListActionButton:(id)sender {
    [self.navigationController pushViewController:[ListViewController new] animated:YES];
}

@end
