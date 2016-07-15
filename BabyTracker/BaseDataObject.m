//
//  BaseDataObject.m
//  BabyTracker
//
//  Created by Iceman on 02.07.16.
//  Copyright © 2016 Kirill Zhukov. All rights reserved.
//

#import "BaseDataObject.h"

@implementation BaseDataObject

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init] ) {
        [self updateWithDictionary:dictionary];
    }
    return self;
}

- (NSDictionary *)dictionary {
    return @{};
}

- (void)updateWithDictionary:(NSDictionary *)dictionary {
}

@end
