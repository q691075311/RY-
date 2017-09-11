//
//  UIColor+RY.h
//  RYFrame
//
//  Created by taobo on 2017/9/11.
//  Copyright © 2017年 rongyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (RY)
/**
 *  16进制转RGB
 *
 *  @param colorString 16进制string
 *
 *  @return UIColor
 */
+ (UIColor *)ry_colorWithHexString:(NSString *)colorString;
@end
