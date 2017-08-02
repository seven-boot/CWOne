//
//  ONENetworkTool.m
//  CWOne
//
//  Created by Coulson_Wang on 2017/8/1.
//  Copyright © 2017年 Coulson_Wang. All rights reserved.
//

#import "ONENetworkTool.h"
#import <AFNetworking.h>

static ONENetworkTool *_instance;
@implementation ONENetworkTool

// 单例
+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[ONENetworkTool alloc] init];
    });
    return _instance;
}

- (void)requestHomeDataWithDate:(NSString *)date success:(void (^)(NSDictionary *))success failure:(void (^)(NSError *))failure {
    
    NSString *requestURL;
    if (date == nil) {
        requestURL = @"http://v3.wufazhuce.com:8000/api/channel/one/0/0";
    } else {
        requestURL = [NSString stringWithFormat:@"http://v3.wufazhuce.com:8000/api/channel/one/%@/0",date];
    }
    
    
    [[AFHTTPSessionManager manager] GET:requestURL parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        // 进度
    } success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *responseObject) {
        if (success) {
            NSDictionary *dataDict = responseObject[@"data"];
            success(dataDict);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

- (void)postPraisedWithItemId:(NSString *)item_id success:(void (^)())success failure:(void (^)(NSError *))failure {
    
    NSDictionary *parameters = @{};
    
    [[AFHTTPSessionManager manager] POST:@"" parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        // 进度
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success();
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

@end
