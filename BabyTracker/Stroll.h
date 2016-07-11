//
//  Stroll.h
//  BabyTracker
//
//  Created by Iceman on 06.07.16.
//  Copyright © 2016 Kirill Zhukov. All rights reserved.
//

#import "BaseDataObject.h"

@interface Stroll : BaseDataObject

@property (strong, nonatomic) NSDate* strollStart;
@property (strong, nonatomic) NSDate* strollStop;
@property (strong, nonatomic) NSDate* date;
@property (strong, nonatomic) NSString* strollDuration;

@end
