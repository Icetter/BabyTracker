//
//  Feed.m
//  BabyTracker
//
//  Created by Iceman on 06.07.16.
//  Copyright © 2016 Kirill Zhukov. All rights reserved.
//

#import "Feed.h"

@implementation Feed

- (NSDictionary *)dictionary {
    NSMutableDictionary *dict = [NSMutableDictionary new];
    if (_foodType) {
        [dict setObject:_foodType forKey:@"Type of food"];
        NSLog(@"%@", _foodType);
    }
    if (_foodQuantity) {
        [dict setObject:_foodQuantity forKey:@"Quantity of food"];
        NSLog(@"%@", _foodQuantity);
    }
    if (_date) {
        [dict setObject:_date forKey:@"Date"];
        NSLog(@"%@", _date);
    }
    
    return dict;
}

- (void)updateWithDictionary:(NSDictionary *)dictionary {
    _foodType = dictionary[@"Start"];
    _foodQuantity = dictionary[@"Stop"];
    _date = dictionary[@"Date"];
}



@end
