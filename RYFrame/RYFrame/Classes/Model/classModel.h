//
//  classModel.h
//  RYFrame
//
//  Created by taobo on 2017/8/28.
//  Copyright © 2017年 rongyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface classModel : NSObject

@property (nonatomic,copy) NSString *name;

@property (nonatomic,strong) NSNumber *age;

@property (nonatomic,strong) NSNumber *iD;

- (instancetype)init;
@end
