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
    return @{
             @"Date"   : _measureDate,
             @"Heihgt" : _height,
             @"Weight" : _weight
             };
}

- (void)updateWithDictionary:(NSDictionary *)dictionary {
    _measureDate = dictionary[@"Date"];
    _height = dictionary[@"Heihgt"];
    _weight = dictionary[@"Weight"];
}

@end
