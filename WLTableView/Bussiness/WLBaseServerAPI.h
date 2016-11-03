//
//  WLBaseServerAPI.h
//  WLTableView
//
//  Created by Liu,Qingcan on 2016/11/3.
//  Copyright © 2016年 LiuQingcan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@class WLBaseServerAPI;
typedef void (^WLBaseAPIBlock)(WLBaseServerAPI *);

typedef NS_ENUM(NSInteger,WLProcessState){
    WL_PROCESS_LOADING = 0,
    WL_PROCESS_CANCELLED,
    WL_PROCESS_SUCCEED,
    WL_PROCESS_FAILED,
    WL_PROCESS_CREATED
};

typedef NS_ENUM(NSInteger,WLRequestMethod){
    WL_REQUEST_POST = 1,
    WL_REQUEST_GET
};



@interface WLBaseServerAPI : NSObject
@property(nonatomic,copy)WLBaseAPIBlock completionBlock;
@property(nonatomic,assign,readonly)CFTimeInterval startTime;
@property(nonatomic,assign,readonly)CFTimeInterval costTime;
@property(nonatomic,strong,readonly)NSString *server;
@property(nonatomic,copy)NSString *api;
@property(nonatomic,strong)NSMutableDictionary *responseJsonData;
@property(nonatomic,strong)NSData *responseRawData;
@property(nonatomic,strong,readonly)NSString *responseRawString;// 原生string数据
@property(nonatomic,copy)NSError *error;
//请求
@property(nonatomic,strong,readonly)NSDictionary *paraDicts;
@property(nonatomic,strong,readonly)NSDictionary *paraFiles;

//状态
@property(nonatomic,assign)WLProcessState processState;


//sessionManager
@property(nonatomic,strong)AFHTTPSessionManager *manager;


//构造方法
- (instancetype)initWithServer:(NSString *)server;

//接口
-(void)accessAPI:(NSString *)api
   requestMethod:(WLRequestMethod)method
          params:(NSDictionary *)params
           files:(NSDictionary *)files
 completionBlock:(WLBaseAPIBlock)completionBlock;

//接口 -- 省略files
-(void)accessAPI:(NSString *)api
   requestMethod:(WLRequestMethod)method
          params:(NSDictionary *)params
 completionBlock:(WLBaseAPIBlock)completionBlock;


//接口 -- 省略 files和请求方式
-(void)accessAPI:(NSString *)api
          params:(NSDictionary *)params
 completionBlock:(WLBaseAPIBlock)completionBlock;


- (void)cancleRequest;

- (void)refreshRequest;




@end
