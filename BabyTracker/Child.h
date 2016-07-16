//
//  Child.h
//  BabyTracker
//
//  Created by Iceman on 02.07.16.
//  Copyright © 2016 Kirill Zhukov. All rights reserved.
//

#import "BaseDataObject.h"

@interface Child : BaseDataObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *birthDate;
@property (strong, nonatomic) NSDate *creationDate;
@property (strong, nonatomic) NSMutableArray *sleeps;
@property (strong, nonatomic) NSMutableArray *feeds;
@property (strong, nonatomic) NSMutableArray *strolls;
@property (strong, nonatomic) NSMutableArray *measures;

@end
