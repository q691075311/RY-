//
//  MainController.m
//  RYFrame
//
//  Created by taobo on 2017/9/12.
//  Copyright © 2017年 rongyun. All rights reserved.
//

#import "MainController.h"

@interface MainController ()<RYBaseRequestDelegate>
@property (nonatomic,strong) NSURLSessionDownloadTask * downTask;
@property (nonatomic,assign) BOOL is;
@end

@implementation MainController

- (void)viewDidLoad{
    [super viewDidLoad];
//    NSLog(@"%@",NSHomeDirectory());
    NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
    NSLog(@"%@",documentsDirectoryURL);
    _is = YES;
    YYCache * cache = [[YYCache alloc] initWithName:@"RYCache"];
    
    
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
    
//    [[RYBaseRequest shareManager] post_withURL:POST_URL
//                     withParams:nil
//               withRequestHeads:nil
//                   withProgress:^(NSProgress *progress) {
//                       
//                   }
//                    withSuccess:^(id responseObject) {
//                        NSLog(@"成功数据%@",responseObject);
//                        [cache containsObjectForKey:POST_URL];
//                        [cache setObject:responseObject forKey:POST_URL];
//                    }
//                       withFail:^(NSError *error,NSDictionary * dic) {
//                           NSLog(@"失败数据%@",error);
//                       }];
//    [RYBaseRequest shareManager].delegate = self;
//    _downTask = [[RYBaseRequest shareManager] downloadFileWithURL:@"http://sw.bos.baidu.com/sw-search-sp/software/f9d83c7730dce/QQ_mac_6.0.1.dmg"
//                                      withFileName:@"QQ.dmg"
//                                      withProgress:^(NSProgress *progress) {
////                                          NSLog(@"%@",progress);
//                                      }
//                               withSuccessFilePath:^(NSURL *filePathURL) {
//                                   NSLog(@"成功的地址：%@",filePathURL);
//                               }
//                                          withFail:^(NSError *error) {
//                                              NSLog(@"%@",error);
//                                          }];
    
    [[RYBaseRequest shareManager] get_withURL:@"https://weibo.com/xuezhiqian?from=myfollow_all&is_all=1#_rnd1505979011067" withParams:nil withProgress:^(NSProgress *progress) {
        
    } withSuccess:^(id responseObject) {
        NSLog(@"%@",responseObject);
    } withFail:^(NSError *error, NSDictionary *dic) {
        
    }];
    
    
    
}
- (void)getWorkingProgress:(NSProgress *)progress{
    NSLog(@"%@",progress);
}
- (IBAction)downOrPause:(UIButton *)sender {
    if (_is == YES) {
        [_downTask resume];
    }else{
        [_downTask suspend];
    }
    _is = !_is;
}


@end
