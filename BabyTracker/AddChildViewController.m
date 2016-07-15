//
//  AddChildViewController.m
//  BabyTracker
//
//  Created by Iceman on 18.06.16.
//  Copyright © 2016 Kirill Zhukov. All rights reserved.
//

#import "AddChildViewController.h"
#import "MainScreenViewController.h"
#import "Child.h"
#import "ChildManager.h"

@interface AddChildViewController () <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UITextField *childNameTextField;
@property (strong, nonatomic) IBOutlet UIButton *childSaveActionButton;
@property (strong, nonatomic) IBOutlet UIDatePicker *childAgePicker;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *bottomPickerConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *bottomTableView;
@property (strong, nonatomic) Child* child;
@property (strong, nonatomic) NSArray *list;

@end

@implementation AddChildViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Child *newChild = [[Child alloc] init];
    _child = newChild;
    
    [_childNameTextField addTarget:self action:@selector(textFieldShouldReturn:) forControlEvents:UIControlEventEditingDidEndOnExit];
    _bottomPickerConstraint.constant = -1000;
    _childSaveActionButton.enabled = NO;
    
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (_childNameTextField == textField){
        _child.name = _childNameTextField.text;
        _bottomPickerConstraint.constant = +120;
        _bottomTableView.constant = -1000;
         _childSaveActionButton.enabled = YES;
        return _child.name;
    } else if (_childAgePicker.isEnabled){
        return YES;
        }
    return NO;
}
- (IBAction)childSaveActionButton:(id)sender {
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd.MM.yyyy"];
    _child.birthDate =[formatter stringFromDate:_childAgePicker.date];
    [[ChildManager sharedInstance] addChild:_child];
    [self.navigationController popViewControllerAnimated:YES];
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
