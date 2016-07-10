//
//  Measures.h
//  BabyTracker
//
//  Created by Iceman on 06.07.16.
//  Copyright © 2016 Kirill Zhukov. All rights reserved.
//

#import "BaseDataObject.h"
#import <CoreGraphics/CoreGraphics.h>

@interface Measures : BaseDataObject

@property (strong, nonatomic) NSString* height;
@property (strong, nonatomic) NSString* weight;
@property (strong, nonatomic) NSDate* measureDate;

@end
