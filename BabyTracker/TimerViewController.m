//
//  TimerViewController.m
//  BabyTracker
//
//  Created by Iceman on 25.06.16.
//  Copyright © 2016 Kirill Zhukov. All rights reserved.
//

#import "TimerViewController.h"
#import "Timers.h"
#import "ListViewController.h"

@interface TimerViewController ()
@property (strong, nonatomic) IBOutlet UILabel *timerTextLabel;
@property (strong, nonatomic) IBOutlet UITextField *badgeTextField;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (strong, nonatomic) IBOutlet UIButton *addTimerActionButton;
@property (strong, nonatomic) Timers* timer;

@end

@implementation TimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_badgeTextField addTarget:self action:@selector(textFieldShouldReturn:) forControlEvents:UIControlEventEditingDidEndOnExit];
    _addTimerActionButton.enabled = NO;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (_badgeTextField == textField){
        _timer.timerText = _badgeTextField.text;
        NSLog(@"%@", _badgeTextField.text);
        _addTimerActionButton.enabled = YES;
        return _timer.timerText;
    } else if (_datePicker.isEnabled){
        return YES;
    }
    return NO;
}

- (IBAction)addTimerActionButton:(id)sender {
    [self.navigationController pushViewController:[ListViewController new] animated:YES];
}

@end
