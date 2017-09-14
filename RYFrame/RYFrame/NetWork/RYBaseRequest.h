//
//  RYBaseRequest.h
//  RYFrame
//
//  Created by taobo on 2017/9/14.
//  Copyright © 2017年 rongyun. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^RYRequestSuccess)(id responseObject);//请求成功的Block
typedef void(^RYRequestFail)(NSError * error);//请求失败的Block
typedef void(^RYProgress)(NSProgress * progress);//请求的进度

@interface RYBaseRequest : NSObject


/**
 GET请求

 @param URLStr 请求的URL
 @param params 请求的参数
 @param progress 请求的进度
 @param success 请求成功的回调
 @param fail 请求失败的回调
 */
+ (void)get_withURL:(NSString *)URLStr
         withParams:(NSDictionary *)params
       withProgress:(RYProgress)progress
        withSuccess:(RYRequestSuccess)success
           withFail:(RYRequestFail)fail;


/**
 POST请求

 @param URLStr 请求的URL
 @param params 请求的参数
 @param progress 请求的进度
 @param success 请求成功的回调
 @param fail 请求失败的回调
 */
+ (void)post_withURL:(NSString *)URLStr
          withParams:(NSDictionary *)params
        withProgress:(RYProgress)progress
         withSuccess:(RYRequestSuccess)success
            withFail:(RYRequestFail)fail;

/**
 解析JSON数据

 @param configurationAFHTTPSessionManager 返回的数据
 @return 解析出来的数据
 */
+ (id)parsingJSONResponseObject:(id)responseObject;

/**
 配置AFHTTPSessionManager

 @return AFHTTPSessionManager的实例
 */
+ (AFHTTPSessionManager *)configurationAFHTTPSessionManager;

/**
 判断网络状态
 */
+ (void)judgeNetworkChange;


@end
