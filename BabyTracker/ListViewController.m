//
//  ListViewController.m
//  BabyTracker
//
//  Created by Iceman on 25.06.16.
//  Copyright © 2016 Kirill Zhukov. All rights reserved.
//

#import "ListViewController.h"
#import "ChildManager.h"
#import "Child.h"
#import "Sleep.h"
#import "Feed.h"
#import "Stroll.h"

@interface ListViewController () <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) Sleep* sleep;
@property (strong, nonatomic) Feed* feed;
@property (strong, nonatomic) Stroll* stroll;
@property (weak, nonatomic) ChildManager *manager;
@property (strong, nonatomic) NSArray *list;

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _manager = [ChildManager sharedInstance];
    _sleep = [_manager.child.sleeps lastObject];
    _feed = [_manager.child.feeds lastObject];
    _stroll = [_manager.child.strolls lastObject];
    
    NSDateFormatter* formatter = [NSDateFormatter new];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    NSString* sleepDateString = [NSString stringWithFormat:@"%@", [formatter stringFromDate:_sleep.date]];
    NSString* feedDateString = [NSString stringWithFormat:@"%@", [formatter stringFromDate:_feed.date]];
    NSString* strollDateString = [NSString stringWithFormat:@"%@", [formatter stringFromDate:_stroll.date]];
    
    NSString* sleepTempString = [NSString stringWithFormat:@"%@ сон длился: %@", sleepDateString, _sleep.sleepDuration];
    NSString* feedTempString = [NSString stringWithFormat:@"%@ %@ %@мл.", feedDateString, _feed.foodType, _feed.foodQuantity];
    NSString* strollTempString = [NSString stringWithFormat:@"%@ прогулка длилась: %@", strollDateString, _stroll.strollDuration];
    
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _list.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = nil;
    
    
    
    cell.textLabel.text = @"";
    
    return cell;
}

@end
