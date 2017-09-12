//
//  RYBaseController.h
//  RYFrame
//
//  Created by taobo on 2017/9/12.
//  Copyright © 2017年 rongyun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RYNavBar.h"
@interface RYBaseController : UIViewController
/**
 *  存储界面的值
 */
@property (nonatomic,strong) NSDictionary * info;

/**
 *  导航栏的View
 */
@property (nonatomic,strong) RYNavBar * navBar;

@end
