//
//  MedicalCardViewController.m
//  BabyTracker
//
//  Created by Iceman on 18.06.16.
//  Copyright © 2016 Kirill Zhukov. All rights reserved.
//

#import "MedicalCardViewController.h"
#import "MeasuresViewController.h"
#import "Measures.h"
#import "ChildManager.h"
#import "Child.h"

@interface MedicalCardViewController () <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UILabel *measurementsLabel;
@property (strong, nonatomic) IBOutlet UILabel *heightLabel;
@property (strong, nonatomic) IBOutlet UILabel *weightLabel;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) Measures* measures;
@property (weak, nonatomic) ChildManager *manager;
@property (strong, nonatomic) NSMutableArray *list;

@end

@implementation MedicalCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _manager = [ChildManager sharedInstance];
    [self updateLabels];
    
    if (_list == nil) {
        _list = [NSMutableArray array];
    }
    
    for (int i = 0; i < [_manager.child.measures count]; i++) {
        _measures = [_manager.child.measures objectAtIndex:i];
        NSDateFormatter* formatter = [NSDateFormatter new];
        [formatter setDateStyle:NSDateFormatterLongStyle];
        NSString* dateString = [NSString stringWithFormat:@"%@", [formatter stringFromDate:_measures.measureDate]];
        NSString* tempString = [NSString stringWithFormat:@"%@ added: height %@cm. & weight %@kg.", dateString, _measures.height, _measures.weight];
        [_list addObject:tempString];
    }
   

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
    [self updateLabels];
}

- (void)updateLabels {
//        if (!_measures) {
//            _measures = [Measures new];
//        }
    _measures = [_manager.child.measures lastObject];
    _heightLabel.text = [NSString stringWithFormat:@"%@ cm.", _measures.height];
    _weightLabel.text = [NSString stringWithFormat:@"%@ kg.", _measures.weight];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _list.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"1"];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [_list objectAtIndex:indexPath.row]];
    return cell;
}

- (IBAction)addMeasuresActionButton:(UIButton *)sender {
    [self.navigationController pushViewController:[MeasuresViewController new] animated:YES];
}

@end
