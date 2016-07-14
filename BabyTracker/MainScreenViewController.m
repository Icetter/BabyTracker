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
#import "MeasuresViewController.h"
#import "Child.h"
#import "ChildManager.h"


@interface MainScreenViewController ()
@property (strong, nonatomic) IBOutlet UIBarButtonItem *childListBarButton;
@property (strong, nonatomic) IBOutlet UILabel *childAgeLabel;
@property (strong, nonatomic) IBOutlet UILabel *childNameLabel;
@property (strong, nonatomic) IBOutlet UIImageView *childImage;
@property (strong, nonatomic) Child* child;

@end

@implementation MainScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.leftBarButtonItem = _childListBarButton;
    
    ChildManager *manager = [ChildManager sharedInstance];
    _child = manager.childs.firstObject;
    manager.child = _child;
    _childNameLabel.text = [NSString stringWithFormat:@"%@", _child.name];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd.MM.yyyy"];
    NSDate *date = [formatter dateFromString:_child.birthDate];
    
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:date toDate:[NSDate date] options:0];
    
    NSInteger year = components.year;
    NSInteger month = components.month;
    NSInteger day = components.day;
    
    if (day <= 30 && month < 1 && year < 1) {
        _childAgeLabel.text = [NSString stringWithFormat:@"%@ дней", @(day)];

    }
    if (month >= 1 && year < 1) {
        _childAgeLabel.text = [NSString stringWithFormat:@"%@ мес. %@ days", @(month), @(day)];
    }
    if (year == 1) {
        _childAgeLabel.text = [NSString stringWithFormat:@"%@ год %@ мес. %@ дней", @(year), @(month), @(day)];
    }
    if (year > 1) {
        _childAgeLabel.text = [NSString stringWithFormat:@"%@ года %@ мес. %@ дней", @(year), @(month), @(day)];
    }
    

//    NSString *name = [NSString stringWithFormat:@"%@", _child.dictionary[@"Name"]];
//    NSLog(@"%@", name);
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    [_childNameLabel reloadInputViews];
}

#pragma mark - Buttons

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
