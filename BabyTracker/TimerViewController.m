//
//  TimerViewController.m
//  BabyTracker
//
//  Created by Iceman on 25.06.16.
//  Copyright © 2016 Kirill Zhukov. All rights reserved.
//

#import "TimerViewController.h"

@interface TimerViewController ()
@property (strong, nonatomic) IBOutlet UILabel *timerTextLabel;
@property (strong, nonatomic) IBOutlet UITextField *badgeTextField;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation TimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)addTimerActionButton:(id)sender {
}

@end
