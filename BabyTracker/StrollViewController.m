//
//  StrollViewController.m
//  BabyTracker
//
//  Created by Iceman on 18.06.16.
//  Copyright © 2016 Kirill Zhukov. All rights reserved.
//

#import "StrollViewController.h"
#import "TimerViewController.h"
#import "ListViewController.h"

@interface StrollViewController ()
@property (strong, nonatomic) IBOutlet UILabel *timerLabel;
@property (strong, nonatomic) IBOutlet UILabel *timeLapsedLabel;

@end

@implementation StrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDate *startTime = [NSDate date];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)goOutActionButton:(id)sender {
}
- (IBAction)cameFromActionButton:(id)sender {
}
- (IBAction)addStrollActionButton:(id)sender {
}
- (IBAction)strollTimerActionButton:(id)sender {
    [self.navigationController pushViewController:[TimerViewController new] animated:YES];
}

- (IBAction)strollListActionButton:(id)sender {
    [self.navigationController pushViewController:[ListViewController new] animated:YES];
}
@end
