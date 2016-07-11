//
//  SleepViewController.m
//  BabyTracker
//
//  Created by Iceman on 18.06.16.
//  Copyright © 2016 Kirill Zhukov. All rights reserved.
//

#import "SleepViewController.h"
#import "SleepListViewController.h"
#import "TimerViewController.h"
#import "Sleep.h"
#import "ChildManager.h"
#import "Child.h"

@interface SleepViewController ()

@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) IBOutlet UILabel *timerLabel;
@property (strong, nonatomic) IBOutlet UILabel *timeLapsedLabel;
@property (strong, nonatomic) IBOutlet UILabel *babySleepsLabel;
@property (strong, nonatomic) NSDate* startDate;
@property (strong, nonatomic) NSDate* stoptDate;
@property (strong, nonatomic) Sleep* sleep;
@property (weak, nonatomic) ChildManager *manager;
@property (nonatomic) BOOL needSave;

@end

@implementation SleepViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _needSave = YES;
    _manager = [ChildManager sharedInstance];
   
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [_manager loadSleep];
    if (_manager.sleep) {
        _sleep = _manager.sleep;
        _startDate = _sleep.sleepStart;
        _stoptDate = _sleep.sleepStop;
    }
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    if (self.timer.isValid) {
        [self.timer invalidate];
        self.timer = nil;
    }
    if (_startDate) {
        [self saveSleep];
        [self saveManager];
    }
}

#pragma mark -

- (void)updateTime {
    [self timerFrom:_startDate to:[NSDate date]];
    [self timeLapsedFrom:_stoptDate to:[NSDate date]];
}

- (NSString *) stringTimeFrom:(NSDate*) date to:(NSDate*) date2{
    if (date != nil) {
        NSDateComponents* timer = [[NSCalendar currentCalendar]
                                   components:NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond
                                   fromDate:date
                                   toDate:date2
                                   options:0];
        
        NSInteger hour = timer.hour;
       NSInteger minute = timer.minute;
        NSInteger second = timer.second;
        
        NSString* temp = [NSString string];
        
        if (second <= 60 && minute < 1 && hour < 1) {
            temp =  [NSString stringWithFormat:@"%@ sec.", @(second)];
        }
        if (minute >= 1 && hour < 1) {
            temp = [NSString stringWithFormat:@"%@ min. %@ sec.",@(minute), @(second)];
        }
        if (hour >= 1) {
            temp = [NSString stringWithFormat:@"%@ hours. @% min. %@ sec.", @(hour), @(minute),@(second)];
        }
        return temp;
        
    } else {
        return nil;
    }
}

- (void) timeLapsedFrom:(NSDate*) date to:(NSDate*) date2 {
    if (date != nil) {
        _timeLapsedLabel.text = [self stringTimeFrom:date to:date2];
    }
}

- (void) timerFrom:(NSDate*) date to:(NSDate*) date2 {
    if (date != nil) {
        _timerLabel.text = [self stringTimeFrom:date to:date2];
        
    }
}

- (void)saveSleep {
    if (!_sleep) {
        _sleep = [Sleep new];
    }
    
    [_manager.child.sleeps lastObject];
    
    _sleep.sleepStart = _startDate;
    _sleep.sleepStop = _stoptDate;
    _sleep.date = [NSDate date];
    _sleep.sleepDuration = [self stringTimeFrom:_sleep.sleepStart to:_sleep.sleepStop];
    
    [_manager.child.sleeps addObject:_sleep];
    [_manager saveData];
}

- (void)saveManager {
    if (_needSave) {
        _manager.sleep = _sleep;
        [_manager saveSleep];
    }
}

#pragma mark - Buttons

- (IBAction)sleepStartActionButton:(id)sender {
    _needSave = YES;
     NSDate* date = [NSDate date];
    _startDate = date;
    
}

- (IBAction)sleepStopActionButton:(id)sender {
    NSDate* date = [NSDate date];
    _needSave = NO;
    [_manager removeSleep];
    _stoptDate = date;
    [self saveSleep];
   // _sleep = nil;
    _timerLabel.text = [NSString stringWithFormat:@"Timer"];
    [self.timer invalidate];
    self.timer = nil;
    
}

- (IBAction)addSleepActionButton:(id)sender {
}

- (IBAction)sleepTimerActionButton:(id)sender {
    [self.navigationController pushViewController:[TimerViewController new] animated:YES];
}

- (IBAction)sleepListActionButton:(id)sender {
    [self.navigationController pushViewController:[SleepListViewController new] animated:YES];
}

@end
