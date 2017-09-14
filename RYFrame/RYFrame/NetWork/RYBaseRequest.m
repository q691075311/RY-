//
//  RYBaseRequest.m
//  RYFrame
//
//  Created by taobo on 2017/9/14.
//  Copyright © 2017年 rongyun. All rights reserved.
//

#import "RYBaseRequest.h"



@interface RYBaseRequest ()

@end

@implementation RYBaseRequest

#pragma mark -- 发起GET请求
+ (void)get_withURL:(NSString *)URLStr
         withParams:(NSDictionary *)params
       withProgress:(RYProgress)progress
        withSuccess:(RYRequestSuccess)success
           withFail:(RYRequestFail)fail{
    //配置AFHTTPSessionManager
    AFHTTPSessionManager * manager = [self configurationAFHTTPSessionManager];
    [manager GET:URLStr
      parameters:params
        progress:^(NSProgress * _Nonnull downloadProgress) {
            progress(downloadProgress);
        }
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             success([self parsingJSONResponseObject:responseObject]);
         }
         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             fail(error);
         }];
    
}
#pragma mark -- 发起POST请求
+ (void)post_withURL:(NSString *)URLStr
          withParams:(NSDictionary *)params
        withProgress:(RYProgress)progress
         withSuccess:(RYRequestSuccess)success
            withFail:(RYRequestFail)fail{
    //配置AFHTTPSessionManager
    AFHTTPSessionManager * manager = [self configurationAFHTTPSessionManager];
    [manager.requestSerializer setValue:@"application/json"forHTTPHeaderField:@"Content-Type"];
    [manager POST:URLStr
       parameters:params
         progress:^(NSProgress * _Nonnull uploadProgress) {
             progress(uploadProgress);
         }
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              success([self parsingJSONResponseObject:responseObject]);
          }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              fail(error);
          }];
}
#pragma mark -- 解析JSON数据
+ (id)parsingJSONResponseObject:(id)responseObject{
    NSError * JSONError;
    NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:responseObject
                                                         options:NSJSONReadingMutableContainers
                                                           error:&JSONError];
    if (!JSONError) {//尝试解析数据，如果解析不成功，就直接返回responseObject
        return dic;
    }
    NSLog(@"解析JSON数据失败");
    return responseObject;
}

#pragma mark -- 配置AFHTTPSessionManager
+ (AFHTTPSessionManager *)configurationAFHTTPSessionManager{
    //初始化并配置baseURL
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithBaseURL:[NSURL URLWithString:BaseURL]];
    //设置请求的响应格式
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    return manager;
}
#pragma mark -- 监听网络状态
+ (void)judgeNetworkChange{
    //开始监听网络
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
            {
                NSLog(@"当前网络未知");
            }
                break;
                
            case AFNetworkReachabilityStatusNotReachable:
            {
                NSLog(@"当前网络不可用");
                [SVProgressHUD showErrorWithStatus:@"当前网络不可用"];
            }
                break;
                
            case AFNetworkReachabilityStatusReachableViaWWAN:
            {
                NSLog(@"当前为蜂窝煤网络");
            }
                break;
                
            case AFNetworkReachabilityStatusReachableViaWiFi:
            {
                NSLog(@"当前为WIFI网络");
            }
                break;
                
            default:
                break;
        }
    }];
}


@end
