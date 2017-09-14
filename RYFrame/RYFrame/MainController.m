//
//  MainController.m
//  RYFrame
//
//  Created by taobo on 2017/9/12.
//  Copyright © 2017年 rongyun. All rights reserved.
//

#import "MainController.h"

@interface MainController ()

@end

@implementation MainController

- (void)viewDidLoad{
    [super viewDidLoad];
//    [RYBaseRequest get_withURL:@"http://192.168.99.122:8080/Bookkeeping/user/showView"
//                    withParams:nil
//                  withProgress:^(NSProgress *progress) {
//                      NSLog(@"进度%@",progress);
//                  }
//                   withSuccess:^(id responseObject) {
//                       NSLog(@"成功数据%@",responseObject);
//                   }
//                      withFail:^(NSError *error) {
//                          NSLog(@"失败数据%@",error);
//                      }];
    [RYBaseRequest post_withURL:@"phone/product/bannerList"
                     withParams:nil
                   withProgress:^(NSProgress *progress) {
                       
                   }
                    withSuccess:^(id responseObject) {
                        NSLog(@"成功数据%@",responseObject);
                    }
                       withFail:^(NSError *error) {
                           NSLog(@"失败数据%@",error);
                       }];
    
}


@end
