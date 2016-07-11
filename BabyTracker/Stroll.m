//
//  Stroll.m
//  BabyTracker
//
//  Created by Iceman on 06.07.16.
//  Copyright © 2016 Kirill Zhukov. All rights reserved.
//

#import "Stroll.h"

@implementation Stroll

- (NSDictionary *)dictionary {
    NSMutableDictionary *dict = [NSMutableDictionary new];
    if (_strollStart) {
        [dict setObject:_strollStart forKey:@"Start"];
        NSLog(@"%@", _strollStart);
    }
    if (_strollStop) {
        [dict setObject:_strollStop forKey:@"Stop"];
        NSLog(@"%@", _strollStop);
    }
    if (_date) {
        [dict setObject:_date forKey:@"Date"];
        NSLog(@"%@", _date);
    }
    if (_strollDuration) {
        [dict setObject:_strollDuration forKey:@"Duration"];
        NSLog(@"%@", _strollDuration);
    }
    
    return dict;
}

- (void)updateWithDictionary:(NSDictionary *)dictionary {
    _strollStart = dictionary[@"Start"];
    _strollStop = dictionary[@"Stop"];
    _date = dictionary[@"Date"];
    _strollDuration = dictionary[@"Duration"];
}

@end
