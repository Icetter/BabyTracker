//
//  MeasuresViewController.m
//  BabyTracker
//
//  Created by Iceman on 02.07.16.
//  Copyright © 2016 Kirill Zhukov. All rights reserved.
//

#import "MeasuresViewController.h"
#import "Measures.h"
#import "Child.h"
#import "ChildManager.h"

@interface MeasuresViewController ()
@property (strong, nonatomic) IBOutlet UITextField *heightTextField;
@property (strong, nonatomic) IBOutlet UITextField *weightTextField;
@property (strong, nonatomic) IBOutlet UIButton *addMeasuresActionButton;
@property (strong, nonatomic) ChildManager* manager;
@property (strong, nonatomic) Measures* measures;
@property (strong, nonatomic) Child* child;

@end

@implementation MeasuresViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _manager = [ChildManager sharedInstance];
    
    [_heightTextField addTarget:self action:@selector(textFieldShouldReturn:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [_weightTextField addTarget:self action:@selector(textFieldShouldReturn2:) forControlEvents:UIControlEventEditingDidEndOnExit];
    
    _addMeasuresActionButton.enabled = NO;
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (_heightTextField == textField){
        _measures.height = _heightTextField.text;
        NSLog(@"%@", textField.text);
        [_weightTextField becomeFirstResponder];
        return YES;
    }
    return NO;
}

- (BOOL)textFieldShouldReturn2:(UITextField *)textField {
    if (_weightTextField == textField) {
        _measures.weight = _weightTextField.text;
        NSLog(@"%@", textField.text);
        _addMeasuresActionButton.enabled = YES;
        return _measures.weight;
    }

    
    return NO;
}

- (IBAction)addMeasuresActionButton:(UIButton *)sender {
    if (!_measures) {
        _measures = [Measures new];
    }
     [_manager.child.measures lastObject];
    _measures.measureDate = [NSDate date];
    _measures.height = _heightTextField.text;
    _measures.weight = _weightTextField.text;
    
    [_manager.child.measures addObject:_measures];
    [_manager saveData];
    
    [self.navigationController popViewControllerAnimated:YES];
}


@end
