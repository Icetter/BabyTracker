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
@property (assign, nonatomic) NSDate *birthDate;
@property (strong, nonatomic) NSMutableArray *sleeps;

@end
