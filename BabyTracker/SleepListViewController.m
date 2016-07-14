//
//  SleepListViewController.m
//  BabyTracker
//
//  Created by Iceman on 11.07.16.
//  Copyright © 2016 Kirill Zhukov. All rights reserved.
//

#import "SleepListViewController.h"
#import "Sleep.h"
#import "ChildManager.h"
#import "Child.h"

@interface SleepListViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) Sleep* sleep;
@property (weak, nonatomic) ChildManager *manager;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSDate* date;

@end

@implementation SleepListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     _manager = [ChildManager sharedInstance];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _manager.child.sleeps.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd.MM.yyyy"];
    _date = _sleep.date;
    
    NSString* cellText = [NSString stringWithFormat:@"%@", [formatter stringFromDate:_date]];
    UITableViewCell* cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellText];
    
    cell.textLabel.text = _manager.child.sleeps[indexPath.row];
    
    return cell;
}

@end
