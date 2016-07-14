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
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView init];
    
    
    
    cell.textLabel.text = @"";
    
    return cell;
}

@end
