//
//  RYBaseRequest.h
//  RYFrame
//
//  Created by taobo on 2017/9/14.
//  Copyright © 2017年 rongyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RYBaseRequestDelegate <NSObject>

- (void)getWorkingProgress:(NSProgress *)progress;

@end

typedef void(^RYRequestSuccess)(id responseObject);//请求成功的Block
typedef void(^RYRequestFail)(NSError * error);//请求失败的Block
typedef void(^RYProgress)(NSProgress * progress);//请求的进度
typedef void(^RYDownLoadFilePath)(NSURL * filePathURL);//文件下载完成后的路径

@interface RYBaseRequest : NSObject

/**
 传回上传下载进度
 */
@property (nonatomic,assign) id<RYBaseRequestDelegate>delegate;

/**
 网络状态
 */
@property (nonatomic,assign) AFNetworkReachabilityStatus netWorkingStatus;
+ (RYBaseRequest *)shareManager;

/**
 GET请求

 @param URLStr 请求的URL
 @param params 请求的参数
 @param progress 请求的进度
 @param success 请求成功的回调
 @param fail 请求失败的回调
 */
- (void)get_withURL:(NSString *)URLStr
         withParams:(NSDictionary *)params
       withProgress:(RYProgress)progress
        withSuccess:(RYRequestSuccess)success
           withFail:(RYRequestFail)fail;


/**
 POST请求

 @param URLStr 请求的URL
 @param params 请求的参数
 @param progress 请求的进度
 @param heads 请求头数据
 @param success 请求成功的回调
 @param fail 请求失败的回调
 */
- (void)post_withURL:(NSString *)URLStr
          withParams:(NSDictionary *)params
    withRequestHeads:(NSDictionary *)heads
        withProgress:(RYProgress)progress
         withSuccess:(RYRequestSuccess)success
            withFail:(RYRequestFail)fail;


/**
 通过POST用文件路径上传文件

 @param URLStr URL
 @param params 参数
 @param heads 请求头数据
 @param fileURL 上传的文件路径 不能为nil
 @param fileName 上传的文件名字，不能为nil
 @param progress 上传进度
 @param success 上传成功的回调
 @param fail 上传的失败回调
 */
- (void)post_uploadFileWithURL:(NSString *)URLStr
                    withParams:(NSDictionary *)params
              withRequestHeads:(NSDictionary *)heads
                  withFilePath:(NSURL *)fileURL
                  withFileName:(NSString *)fileName
                  withProgress:(RYProgress)progress
                   withSuccess:(RYRequestSuccess)success
                      withFail:(RYRequestFail)fail;


/**
 下载任务

 @param URLStr 下载地址
 @param fileName 保存的文件名
 @param progress 下载进度
 @param success 下载成功返回文件地址
 @param fail 下载失败返回error
 @return 返回一个下载任务
 */
- (NSURLSessionDownloadTask *)downloadFileWithURL:(NSString *)URLStr
                                     withFileName:(NSString *)fileName
                                     withProgress:(RYProgress)progress
                              withSuccessFilePath:(RYDownLoadFilePath)success
                                         withFail:(RYRequestFail)fail;


/**
 遍历请求头的数据

 @param dic 请求头的字典
 @param manager AFHTTPSessionManager
 */
- (void)traversalRequestHeads:(NSDictionary *)dic withAFManager:(AFHTTPSessionManager*)manager;

/**
 解析JSON数据

 @param configurationAFHTTPSessionManager 返回的数据
 @return 解析出来的数据
 */
- (id)parsingJSONResponseObject:(id)responseObject;

/**
 配置AFHTTPSessionManager

 @return AFHTTPSessionManager的实例
 */
- (AFHTTPSessionManager *)configurationAFHTTPSessionManager;

/**
 判断网络状态
 */
- (void)judgeNetworkChange;


@end
