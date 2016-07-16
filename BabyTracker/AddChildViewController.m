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
@property (weak, nonatomic) ChildManager *manager;
@property (strong, nonatomic) NSMutableArray *list;

@end

@implementation AddChildViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _manager = [ChildManager sharedInstance];
    
    [_childNameTextField addTarget:self action:@selector(textFieldShouldReturn:) forControlEvents:UIControlEventEditingDidEndOnExit];
    _bottomPickerConstraint.constant = -1000;
    _childSaveActionButton.enabled = NO;
    
    if (_list == nil) {
        _list = [NSMutableArray array];
    }
    
    for (int i = 0; i < [_manager.childs count]; i++) {
        _child = [_manager.childs objectAtIndex:i];
         NSString* child = [NSString stringWithFormat:@"%@", _child.name];
        [_list addObject:child];
    }
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (_childNameTextField == textField){
        _bottomPickerConstraint.constant = +120;
        _bottomTableView.constant = -1000;
         _childSaveActionButton.enabled = YES;
        return YES;
    } else if (_childAgePicker.isEnabled){
        return YES;
        }
    return NO;
}
- (IBAction)childSaveActionButton:(id)sender {
    Child *newChild = [[Child alloc] init];
    _child = newChild;
    _child.name = _childNameTextField.text;
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd.MM.yyyy"];
    _child.birthDate =[formatter stringFromDate:_childAgePicker.date];
    _child.creationDate = [NSDate date];
    [[ChildManager sharedInstance] addChild:_child];
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _list.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"1"];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [_list objectAtIndex:indexPath.row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [_manager removeChild];
    _manager.child = [_manager.childs objectAtIndex:indexPath.row];
    [_manager saveChild];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
