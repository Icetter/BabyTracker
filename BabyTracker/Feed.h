//
//  Feed.h
//  BabyTracker
//
//  Created by Iceman on 06.07.16.
//  Copyright © 2016 Kirill Zhukov. All rights reserved.
//

#import "BaseDataObject.h"

@interface Feed : BaseDataObject

@property (strong, nonatomic) NSDate* date;
@property (strong, nonatomic) NSString* foodType;
@property (assign, nonatomic) NSNumber* foodQuantity;

@end
