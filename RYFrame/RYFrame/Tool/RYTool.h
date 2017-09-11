//
//  RYTool.h
//  RYFrame
//
//  Created by taobo on 2017/9/11.
//  Copyright © 2017年 rongyun. All rights reserved.
//

#import <Foundation/Foundation.h>

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
@end

