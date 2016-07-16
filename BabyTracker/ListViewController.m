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
@property (strong, nonatomic) NSMutableArray *list;
@property (assign, nonatomic) NSInteger numberOfSection;

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _manager = [ChildManager sharedInstance];
    
    NSDateComponents* timer = [[NSCalendar currentCalendar]
                               components:NSCalendarUnitDay
                               fromDate:_manager.child.creationDate
                               toDate:[NSDate date]
                               options:0];
    _numberOfSection = [timer day];
    
    NSDateFormatter* formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"dd.MMM.yyyy HH:mm"];
    
    if (_list == nil) {
        _list = [NSMutableArray new];
    }
    
    unsigned long counter = 0;
    
    if ([_manager.child.sleeps count] >= [_manager.child.feeds count] && [_manager.child.sleeps count] >= [_manager.child.strolls count]) {
            counter = [_manager.child.sleeps count];
    } else if ([_manager.child.feeds count] >= [_manager.child.sleeps count] && [_manager.child.feeds count] >= [_manager.child.strolls count]) {
            counter = [_manager.child.feeds count];
    } else {
            counter = [_manager.child.strolls count];
    }
    
    for (int i = 0; i < counter; i++) {
         _sleep = [_manager.child.sleeps objectAtIndex:i];
        NSString* sleepDateString = [NSString stringWithFormat:@"%@", [formatter stringFromDate:_sleep.date]];
        NSString* sleepTempString = [NSString stringWithFormat:@"%@ sleep lasts: %@", sleepDateString, _sleep.sleepDuration];
        [_list addObject:sleepTempString];
        _feed = [_manager.child.feeds objectAtIndex:i];
        NSString* feedDateString = [NSString stringWithFormat:@"%@", [formatter stringFromDate:_feed.date]];
        NSString* feedTempString = [NSString stringWithFormat:@"%@ %@ %@ml.", feedDateString, _feed.foodType, _feed.foodQuantity];
        [_list addObject:feedTempString];
        _stroll = [_manager.child.strolls objectAtIndex:i];
        NSString* strollDateString = [NSString stringWithFormat:@"%@", [formatter stringFromDate:_stroll.date]];
        NSString* strollTempString = [NSString stringWithFormat:@"%@ stroll lasts: %@", strollDateString, _stroll.strollDuration];
        [_list addObject:strollDateString];
    }
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _list.count;

}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    CGRect headerRect = CGRectMake(0, 0, self.view.frame.size.width, 30);
    UIView *headerSectionView = [[UIView alloc] initWithFrame:headerRect];
    headerSectionView.backgroundColor = [UIColor grayColor];
    return headerSectionView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"1"];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [_list objectAtIndex:indexPath.row] ];
    return cell;
}

@end
