//
//  classModel.m
//  RYFrame
//
//  Created by taobo on 2017/8/28.
//  Copyright © 2017年 rongyun. All rights reserved.
//

#import "classModel.h"

@implementation classModel

- (instancetype)init{
    self = [super init];
    if (self) {
        self.name = @"袁心刚";
        self.age = @(35);
        self.iD = @(13);
    }
    return self;
}

@end
