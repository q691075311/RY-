//
//  RYTool.m
//  RYFrame
//
//  Created by taobo on 2017/9/11.
//  Copyright © 2017年 rongyun. All rights reserved.
//

#import "RYTool.h"

@implementation RYTool
#pragma mark -- 动态获取Label的高度
+ (CGFloat)getLabelHeightWithString:(NSString *)contentStr withLabelWidth:(CGFloat)width withFontSize:(CGFloat)fontSize{
    return [contentStr boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                                    options:NSStringDrawingUsesLineFragmentOrigin
                                 attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:fontSize]}
                                    context:nil].size.height;
}
#pragma mark -- userDefault存储值
+ (void)userDefaultsSetValue:(id)value forKey:(NSString *)key{
    [NSUSERDEFAULTS setObject:value forKey:key];
    [NSUSERDEFAULTS synchronize];
}
#pragma mark -- 移除userDefault对应key的值
+ (void)userDefaultsRemoveKey:(NSString *)key{
    [NSUSERDEFAULTS removeObjectForKey:key];
    [NSUSERDEFAULTS synchronize];
}

@end
