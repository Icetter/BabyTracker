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

@interface AddChildViewController ()
@property (strong, nonatomic) IBOutlet UITextField *childNameTextField;
@property (strong, nonatomic) IBOutlet UIButton *childSaveActionButton;
@property (strong, nonatomic) IBOutlet UIDatePicker *childAgePicker;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *bottomPickerConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *bottomTableView;
@property (strong, nonatomic) Child* child;


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
        NSLog(@"%@", textField.text);
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
    NSLog(@"%@", _child.birthDate);
    [[ChildManager sharedInstance] addChild:_child];
    [self.navigationController popViewControllerAnimated:YES];
    }

@end
