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
#import "Child.h"
#import "DateTools/NSDate+DateTools.h"
#import "ChildManager.h"

@interface MainScreenViewController ()
@property (strong, nonatomic) IBOutlet UIBarButtonItem *childListBarButton;
@property (strong, nonatomic) IBOutlet UILabel *childAgeLabel;
@property (strong, nonatomic) IBOutlet UILabel *childNameLabel;
@property (strong, nonatomic) IBOutlet UIImageView *childImage;
@property (strong, nonatomic) Child* child;
@property (strong, nonatomic) ChildManager* manager;
@property NSDate *selectedDate;
@property NSDateFormatter *formatter;
@property NSTimer *updateTimer;

@end

@implementation MainScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];

#pragma mark - NavigationItems
    self.navigationItem.leftBarButtonItem = _childListBarButton;
    
#pragma mark - 
    
    NSDictionary* tempDict = [NSDictionary dictionaryWithContentsOfFile:_manager.path];
    tempDict = [[_manager.childs objectAtIndex:0] objectForKey:@"Name"];
    _childNameLabel.text = [NSString stringWithFormat:@"%@", tempDict];
    
    
//    self.formatter = [[NSDateFormatter alloc] init];
//    [self.formatter setDateFormat:@"dd w MM yy"];
//    
//    self.selectedDate = [NSDate dateWithString:_child.birthDate formatString:self.formatter];
//    NSString *timeAgo = [NSDate timeAgoSinceDate:self.selectedDate];
//    NSLog(@"TimeAgo:%@", timeAgo);
//
//    self.updateTimer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(updateAgeLabel) userInfo:nil repeats:YES];
//    [[NSRunLoop mainRunLoop] addTimer:self.updateTimer forMode:NSRunLoopCommonModes];
//    
//    [self updateAgeLabel];
    
    
//    NSDictionary *dict=[results valueForKeyPath:(ChildManager*)path][0];
    NSString *name=_child.dictionary[@"Name"];
    NSLog(@"%@", name);
    
}

-(void)updateAgeLabel{
    self.selectedDate = [NSDate date];
    
    self.childAgeLabel.text = [NSString stringWithFormat:@"%ld %ld %ld %ld",
                               (long)self.selectedDate.daysAgo,
                               (long)self.selectedDate.weeksAgo,
                               (long)self.selectedDate.monthsAgo,
                               (long)self.selectedDate.yearsAgo];
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
