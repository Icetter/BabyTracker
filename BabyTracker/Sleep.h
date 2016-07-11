//
//  Sleep.h
//  BabyTracker
//
//  Created by Iceman on 02.07.16.
//  Copyright © 2016 Kirill Zhukov. All rights reserved.
//

#import "BaseDataObject.h"

@interface Sleep : BaseDataObject

@property (strong, nonatomic) NSDate* sleepStart;
@property (strong, nonatomic) NSDate* sleepStop;
@property (strong, nonatomic) NSDate* date;
@property (strong, nonatomic) NSString* sleepDuration;

@end
