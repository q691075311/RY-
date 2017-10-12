//
//  RYTool.h
//  RYFrame
//
//  Created by taobo on 2017/9/11.
//  Copyright © 2017年 rongyun. All rights reserved.
//

#import <Foundation/Foundation.h>
//找到NSUserDefaults
#define NSUSERDEFAULTS [NSUserDefaults standardUserDefaults]

@interface RYTool : NSObject
/**
 *  动态获取Label的高度
 *
 *  @param contentStr label的内容
 *  @param width      label的宽度
 *  @param fontSize   label字体的大小
 *
 *  @return label的高度
 */
+ (CGFloat) getLabelHeightWithString:(NSString *)contentStr withLabelWidth:(CGFloat)width withFontSize:(CGFloat)fontSize;

/**
 userDefault存储值

 @param value 存储的值
 @param key 存储的key
 */
+ (void)userDefaultsSetValue:(id)value forKey:(NSString *)key;

/**
 移除userDefault对应key的值

 @param key key
 */
+ (void)userDefaultsRemoveKey:(NSString *)key;

@end

