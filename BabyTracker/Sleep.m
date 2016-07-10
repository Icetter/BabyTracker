//
//  Sleep.m
//  BabyTracker
//
//  Created by Iceman on 02.07.16.
//  Copyright © 2016 Kirill Zhukov. All rights reserved.
//

#import "Sleep.h"

@implementation Sleep

- (NSDictionary *)dictionary {
    NSMutableDictionary *dict = [NSMutableDictionary new];
    if (_sleepStart) {
        [dict setObject:_sleepStart forKey:@"Start"];
        NSLog(@"%@", _sleepStart);
    }
    if (_sleepStop) {
        [dict setObject:_sleepStop forKey:@"Stop"];
        NSLog(@"%@", _sleepStop);
    }
    if (_date) {
        [dict setObject:_date forKey:@"Date"];
        NSLog(@"%@", _date);
    }
    if (_sleepDuration) {
        [dict setObject:_sleepDuration forKey:@"Duration"];
        NSLog(@"%@", _sleepDuration);
    }
    
    return dict;
}

- (void)updateWithDictionary:(NSDictionary *)dictionary {
    _sleepStart = dictionary[@"Start"];
    _sleepStop = dictionary[@"Stop"];
    _date = dictionary[@"Date"];
    _sleepDuration = dictionary[@"Duration"];
}

@end
