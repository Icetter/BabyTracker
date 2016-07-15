//
//  BaseDataObject.h
//  BabyTracker
//
//  Created by Iceman on 02.07.16.
//  Copyright © 2016 Kirill Zhukov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseDataObject : NSObject

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (void)updateWithDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)dictionary;

@end
