//
//  StrollViewController.m
//  BabyTracker
//
//  Created by Iceman on 18.06.16.
//  Copyright © 2016 Kirill Zhukov. All rights reserved.
//

#import "StrollViewController.h"
#import "ListViewController.h"
#import "Stroll.h"
#import "ChildManager.h"
#import "Child.h"

@interface StrollViewController ()
@property (strong, nonatomic) IBOutlet UILabel *timerLabel;
@property (strong, nonatomic) IBOutlet UILabel *timeLapsedLabel;
@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) NSDate* startStroll;
@property (strong, nonatomic) NSDate* stoptStroll;
@property (strong, nonatomic) Stroll* stroll;
@property (weak, nonatomic) ChildManager *manager;
@property (nonatomic) BOOL needSave;

@end

@implementation StrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _needSave = YES;
    _manager = [ChildManager sharedInstance];
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [_manager loadSleep];
    if (_manager.stroll) {
        _stroll      = _manager.stroll;
        _startStroll = _stroll.strollStart;
        _stoptStroll = _stroll.strollStop;
    }
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    if (self.timer.isValid) {
        [self.timer invalidate];
        self.timer = nil;
    }
    if (_startStroll) {
        [self saveStroll];
        [self saveManager];
    }
}

#pragma mark - 

- (void)updateTime {
    [self timerFrom:_startStroll to:[NSDate date]];
    [self timeLapsedFrom:_stoptStroll to:[NSDate date]];
}

- (NSString *) stringTimeFrom:(NSDate*) date to:(NSDate*) date2{
    if (date != nil) {
        NSDateComponents* timer = [[NSCalendar currentCalendar]
                                   components:NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond
                                   fromDate:date
                                   toDate:date2
                                   options:0];
        
        NSInteger hour   = timer.hour;
        NSInteger minute = timer.minute;
        NSInteger second = timer.second;
        
        NSString* temp = [NSString string];
        
        if (second <= 60 && minute < 1 && hour < 1) {
            temp =  [NSString stringWithFormat:@"%@ sec.", @(second)];
        }
        if (minute >= 1 && hour < 1) {
            temp = [NSString stringWithFormat:@"%@ min. %@ sec.",@(minute), @(second)];
        }
        if (hour == 1) {
            temp = [NSString stringWithFormat:@"%@ hour @% min. %@ sec.", @(hour), @(minute),@(second)];
        }
        if (hour > 1) {
            temp = [NSString stringWithFormat:@"%@ hours @% min. %@ sec.", @(hour), @(minute),@(second)];
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

- (void)saveStroll {
    if (!_stroll) {
        _stroll = [Stroll new];
    }
    
    [_manager.child.strolls lastObject];
    
    _stroll.strollStart    = _startStroll;
    _stroll.strollStop     = _stoptStroll;
    _stroll.date           = [NSDate date];
    _stroll.strollDuration = [self stringTimeFrom:_startStroll to:_stoptStroll];
    
    [_manager.child.strolls addObject:_stroll];
    [_manager saveData];
}

- (void)saveManager {
    if (_needSave) {
        _manager.stroll = _stroll;
        [_manager saveStroll];
    }
}


#pragma mark - Buttons

- (IBAction)goOutActionButton:(id)sender {
    _needSave = YES;
    NSDate* date = [NSDate date];
    _startStroll = date;
}
- (IBAction)cameFromActionButton:(id)sender {
    NSDate* date = [NSDate date];
    _needSave = NO;
    [_manager removeStroll];
    _stoptStroll = date;
    [self saveStroll];
    _timerLabel.text = [NSString stringWithFormat:@"Timer"];
    [self.timer invalidate];
    self.timer = nil;
}

@end
