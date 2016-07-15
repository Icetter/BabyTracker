//
//  Measures.m
//  BabyTracker
//
//  Created by Iceman on 06.07.16.
//  Copyright © 2016 Kirill Zhukov. All rights reserved.
//

#import "Measures.h"

@implementation Measures

- (NSDictionary *)dictionary {
    NSMutableDictionary *dict = [NSMutableDictionary new];
    if (_height) {
        [dict setObject:_height forKey:@"Heihgt"];
        NSLog(@"%@", _height);
    }
    if (_weight) {
        [dict setObject:_weight forKey:@"Weight"];
        NSLog(@"%@", _weight);
    }
    if (_measureDate) {
        [dict setObject:_measureDate forKey:@"Date"];
        NSLog(@"%@", _measureDate);
    }
    
    return dict;
}

- (void)updateWithDictionary:(NSDictionary *)dictionary {
    _measureDate = dictionary[@"Date"];
    _height = dictionary[@"Heihgt"];
    _weight = dictionary[@"Weight"];
}

@end
