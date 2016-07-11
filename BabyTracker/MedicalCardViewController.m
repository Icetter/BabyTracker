//
//  MedicalCardViewController.m
//  BabyTracker
//
//  Created by Iceman on 18.06.16.
//  Copyright © 2016 Kirill Zhukov. All rights reserved.
//

#import "MedicalCardViewController.h"
#import "TimerViewController.h"
#import "MeasuresViewController.h"
#import "Measures.h"
#import "ChildManager.h"
#import "Child.h"

@interface MedicalCardViewController ()
@property (strong, nonatomic) IBOutlet UILabel *measurementsLabel;
@property (strong, nonatomic) IBOutlet UILabel *heightLabel;
@property (strong, nonatomic) IBOutlet UILabel *weightLabel;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) Measures* measures;
@property (weak, nonatomic) ChildManager *manager;

@end

@implementation MedicalCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _manager = [ChildManager sharedInstance];
    if (!_measures) {
        _measures = [Measures new];
    }
    [_manager.child.measures lastObject];
    _heightLabel.text = _measures.height;
    _weightLabel.text = _measures.weight;
    
    
}
- (IBAction)addMeasuresActionButton:(UIButton *)sender {
    [self.navigationController pushViewController:[MeasuresViewController new] animated:YES];
}
- (IBAction)addMedicalNoteActionButton:(id)sender {
}

- (IBAction)medicalTimerActionButton:(UIButton *)sender {
    [self.navigationController pushViewController:[TimerViewController new] animated:YES];
}

@end
