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
    self.navBar = [[RYNavBar alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    [self.view addSubview:self.navBar];
}



@end
