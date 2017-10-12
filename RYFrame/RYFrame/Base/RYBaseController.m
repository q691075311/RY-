//
//  RYBaseController.m
//  RYFrame
//
//  Created by taobo on 2017/9/12.
//  Copyright © 2017年 rongyun. All rights reserved.
//

#import "RYBaseController.h"

@implementation RYBaseController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.navBar = [[RYNavBar alloc] initWithFrame:CGRectMake(0, TOPBAR_HEIGHT, SCREEN_WIDTH, 44)];
    [self.view addSubview:self.navBar];
}
#pragma mark -- 设置状态栏的颜色
- (void)setStatusBarBackgroundColor:(UIColor *)color{
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }
}

@end
