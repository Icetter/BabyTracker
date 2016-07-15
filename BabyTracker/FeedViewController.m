//
//  FeedViewController.m
//  BabyTracker
//
//  Created by Iceman on 18.06.16.
//  Copyright © 2016 Kirill Zhukov. All rights reserved.
//

#import "FeedViewController.h"
#import "Feed.h"
#import "ChildManager.h"
#import "Child.h"

@interface FeedViewController () <UIPickerViewDataSource, UIPickerViewDelegate>
@property (strong, nonatomic) IBOutlet UIButton *addFoodActionButton;
@property (strong, nonatomic) IBOutlet UILabel *timeLapsedLabel;
@property (strong, nonatomic) IBOutlet UILabel *foodQuantityLabel;
@property (strong, nonatomic) IBOutlet UITextField *foodQuantityTextField;
@property (strong, nonatomic) IBOutlet UIPickerView *foodPicker;
@property (strong, nonatomic) NSArray* foodArray;
@property (strong, nonatomic) Feed* feed;
@property (weak, nonatomic) ChildManager *manager;
@property (strong, nonatomic) NSString* selection;

@end

@implementation FeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _manager = [ChildManager sharedInstance];
    
    self.foodArray = [NSArray arrayWithObjects:@"Left breast", @"Right breast", @"Racking", @"Infant formula", @"Milk porridge", @"Dairy-free porridge", @"Vegetable puree", @"Fruit puree", @"Meat puree", @"Fish puree", @"Juice", @"Water", @"Biscuit", nil]; 
    
    _foodPicker.delegate = self;
    _foodPicker.dataSource = self;
    
    [_foodQuantityTextField addTarget:self action:@selector(textFieldShouldReturn:) forControlEvents:UIControlEventEditingDidEndOnExit];
    _addFoodActionButton.enabled = NO;
    
    _foodQuantityTextField.text = nil;
    [_foodPicker selectRow:0 inComponent:0 animated:YES];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (_foodQuantityTextField == textField){
        _addFoodActionButton.enabled = YES;
        return YES;
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
    _selection = _foodArray[row];
    return _selection;
}

#pragma mark - Buttons


- (IBAction)addFoodActionButton:(id)sender {
    if (!_feed) {
        _feed = [Feed new];
    }
    
    [_manager.child.feeds lastObject];
    
    _feed.foodQuantity = _foodQuantityTextField.text;
    _feed.foodType = _selection;
    _feed.date = [NSDate date];

   
    [_manager.child.feeds addObject:_feed];
    [_manager saveData];
    
    _foodQuantityTextField.text = nil;
    [_foodPicker selectRow:0 inComponent:0 animated:YES];
}

@end
