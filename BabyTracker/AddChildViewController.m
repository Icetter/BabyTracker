//
//  AddChildViewController.m
//  BabyTracker
//
//  Created by Iceman on 18.06.16.
//  Copyright © 2016 Kirill Zhukov. All rights reserved.
//

#import "AddChildViewController.h"
#import "Child.h"
#import "ChildManager.h"

@interface AddChildViewController ()
@property (strong, nonatomic) IBOutlet UITextField *childNameTextField;
@property (strong, nonatomic) IBOutlet UIButton *childSaveActionButton;
@property (strong, nonatomic) IBOutlet UIDatePicker *childAgePicker;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *bottomPickerConstraint;
@property (strong, nonatomic) Child* child;


@end

@implementation AddChildViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Child *newChild = [Child new];
    _child = newChild;
    
    [_childNameTextField addTarget:self action:@selector(textFieldShouldReturn:) forControlEvents:UIControlEventEditingDidEndOnExit];
    _bottomPickerConstraint.constant = -1000;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (_childNameTextField == textField){
        _child.name = _childNameTextField.text;
        NSLog(@"%@", _child.name);
        _bottomPickerConstraint.constant = +120;
        return _child.name;
    } else if (_childAgePicker.isEnabled){
        
//        _child.age = _childAgeTextField.text;
//         NSLog(@"%lu", (unsigned long)_child.age);
//        _child.age = [[NSDate date] timeIntervalSinceDate:_childAgePicker.date];
        return YES;
    }
    return NO;
}
- (IBAction)childSaveActionButton:(id)sender {
    _child.age = _childAgePicker.date;
    NSLog(@"%@", _child.age);
    [[ChildManager sharedInstance] addChild:_child];
}

@end
