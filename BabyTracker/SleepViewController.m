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
@property NSTimer *updateTimer;
@property NSDate *selectedDate;
@property NSDateFormatter *formatter;
@property NSTimer* timer;

@end

@implementation SleepViewController

int seconds = 0;

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.formatter = [[NSDateFormatter alloc] init];
    [self.formatter setDateFormat:@"HH:mm"];
    self.timerLabel.text = [self.formatter stringFromDate:self.selectedDate];
}

-(void)updateTimeAgoLabels{
   
    self.selectedDate = [NSDate date];

    self.timerLabel.text = [self.formatter stringFromDate:self.selectedDate];
    
//    self.MinutesLabel.text = [NSString stringWithFormat:@"%.0f", self.selectedDate.minutesAgo];
//    self.HoursLabel.text = [NSString stringWithFormat:@"%.0f", self.selectedDate.hoursAgo];
   
}



- (IBAction)sleepStartActionButton:(id)sender {
    [_timer invalidate];
   _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(tick) userInfo:nil repeats:YES];
    self.selectedDate = [self.formatter dateFromString:@"00:00"];
    [self updateTimeAgoLabels];
    
}

- (void) tick {
    NSDate* date = [NSDate dateWithTimeIntervalSinceNow:1];
    seconds++;
//    NSString* timeString = [NSString stringWithFormat:@"%d", seconds];
    self.timerLabel.text = [self.formatter stringFromDate:date];
}

- (IBAction)sleepStopActionButton:(id)sender {
    [_timer invalidate];
    seconds = 0;
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
