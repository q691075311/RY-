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
    withRequestHeads:(NSDictionary *)heads
        withProgress:(RYProgress)progress
         withSuccess:(RYRequestSuccess)success
            withFail:(RYRequestFail)fail{
    //配置AFHTTPSessionManager
    AFHTTPSessionManager * manager = [self configurationAFHTTPSessionManager];
    //添加请求头数据
    [self traversalRequestHeads:heads withAFManager:manager];
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
#pragma mark -- 通过POST用文件路径上传文件
+ (void)post_uploadFileWithURL:(NSString *)URLStr
                    withParams:(NSDictionary *)params
              withRequestHeads:(NSDictionary *)heads
                  withFilePath:(NSURL *)fileURL
                  withFileName:(NSString *)fileName
                  withProgress:(RYProgress)progress
                   withSuccess:(RYRequestSuccess)success
                      withFail:(RYRequestFail)fail{
    //配置AFHTTPSessionManager
    AFHTTPSessionManager * manager = [self configurationAFHTTPSessionManager];
    //添加请求头数据
    [self traversalRequestHeads:heads withAFManager:manager];
    [manager POST:URLStr
       parameters:params
constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
    //拼接文件路径到请求Body
    NSError * appendError = nil;
    [formData appendPartWithFileURL:fileURL
                               name:fileName
                              error:&appendError];
    if (appendError) {
        [SVProgressHUD showErrorWithStatus:@"文件路径添加失败"];
        return;
    }
}
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

+ (NSURLSessionDownloadTask *)downloadFileWithURL:(NSString *)URLStr
                                     withFileName:(NSString *)fileName
                                     withProgress:(RYProgress)progress
                              withSuccessFilePath:(RYDownLoadFilePath)success
                                         withFail:(RYRequestFail)fail{
    //初始化AFHTTPSessionManager
    NSURLSessionConfiguration * configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFHTTPSessionManager * manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:configuration];
    //设置超时时间
    manager.requestSerializer.timeoutInterval = 60;
    //创建请求任务
    NSURL * URL = [NSURL URLWithString:URLStr];
    NSURLRequest * request = [NSURLRequest requestWithURL:URL];
    NSURLSessionDownloadTask * downTask;//声明一个下载任务
    downTask = [manager downloadTaskWithRequest:request
                                       progress:^(NSProgress * _Nonnull downloadProgress) {
                                           progress(downloadProgress);
                                       }
                                    destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
                                        //返回文件的存放位置
                                        return [self createFileDownPathWithFileName:fileName];
                                    }
                              completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
                                  if (error) {
                                      fail(error);
                                  }else{
                                      success(filePath);
                                  }
                              }];
    return downTask;
}
#pragma mark -- 创建文件的下载路径
+ (NSURL *)createFileDownPathWithFileName:(NSString *)fileName{
    //获取dcuments目录
    NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
    //拼接上文件名
    NSURL * url = [documentsDirectoryURL URLByAppendingPathComponent:fileName];
    return url;
}

#pragma mark -- 遍历请求头的数据
+ (void)traversalRequestHeads:(NSDictionary *)dic withAFManager:(AFHTTPSessionManager*)manager{
    if (dic) {//如果dic存在
        for (NSString * key in dic) {//遍历dic，把值放在HTTPHeader里面
            NSString * value = dic[key];
            [manager.requestSerializer setValue:value forHTTPHeaderField:key];
        }
    }
}
#pragma mark -- 解析JSON数据
+ (id)parsingJSONResponseObject:(id)responseObject{
    NSError * JSONError;
    NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:responseObject
                                                         options:NSJSONReadingMutableContainers
                                                           error:&JSONError];
    if (!JSONError) {//尝试解析数据，如果解析不成功，就直接返回responseObject
        //根据服务端判断JSON中Code的值
        return dic;
    }
    NSLog(@"解析JSON数据失败");
    return responseObject;
}

#pragma mark -- 配置AFHTTPSessionManager
+ (AFHTTPSessionManager *)configurationAFHTTPSessionManager{
    //初始化并配置baseURL
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithBaseURL:[NSURL URLWithString:BaseURL]];
    //设置请求超时时间
    manager.requestSerializer.timeoutInterval = 60;
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
