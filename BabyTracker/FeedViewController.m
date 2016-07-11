//
//  FeedViewController.m
//  BabyTracker
//
//  Created by Iceman on 18.06.16.
//  Copyright © 2016 Kirill Zhukov. All rights reserved.
//

#import "FeedViewController.h"
#import "ListViewController.h"
#import "TimerViewController.h"
#import "Feed.h"
#import "ChildManager.h"

@interface FeedViewController () <UIPickerViewDataSource, UIPickerViewDelegate>
@property (strong, nonatomic) IBOutlet UIButton *addFoodActionButton;
@property (strong, nonatomic) IBOutlet UILabel *timeLapsedLabel;
@property (strong, nonatomic) IBOutlet UILabel *foodQuantityLabel;
@property (strong, nonatomic) IBOutlet UITextField *foodQuantityTextField;
@property (strong, nonatomic) IBOutlet UIPickerView *foodPicker;
@property (strong, nonatomic) NSArray* foodArray;
@property (strong, nonatomic) Feed* sleep;
@property (weak, nonatomic) ChildManager *manager;

@end

@implementation FeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.foodArray = [NSArray arrayWithObjects:@"Left breast", @"Right breast", @"Racking", @"Infant formula", @"Milk porridge", @"Dairy-free porridge", @"Vegetable puree", @"Fruit puree", @"Meat puree", @"Fish puree", @"Juice", @"Water", @"Biscuit", nil];
    
    _foodPicker.delegate = self;
    _foodPicker.dataSource = self;
    
    [_foodQuantityTextField addTarget:self action:@selector(textFieldShouldReturn:) forControlEvents:UIControlEventEditingDidEndOnExit];
    _addFoodActionButton.enabled = NO;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (_foodQuantityTextField == textField){
//        _feed.name = _foodQuantityTextField.text;
        NSLog(@"%@", textField.text);
        
        _addFoodActionButton.enabled = YES;
//        return _child.name;
    } else if (_foodPicker.isFocused){
        return YES;
    }
    return NO;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    NSInteger result = _foodArray.count;
    return result;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSString* selection= _foodArray[row];
    return selection;
}


- (IBAction)addFoodActionButton:(id)sender {
}

- (IBAction)feedTimerActionButton:(id)sender {
    [self.navigationController pushViewController:[TimerViewController new] animated:YES];
}

- (IBAction)feedListActionButton:(id)sender {
    [self.navigationController pushViewController:[ListViewController new] animated:YES];
}
@end
