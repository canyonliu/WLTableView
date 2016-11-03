//
//  WLBaseServerAPI.m
//  WLTableView
//
//  Created by Liu,Qingcan on 2016/11/3.
//  Copyright © 2016年 LiuQingcan. All rights reserved.
//

#import "WLBaseServerAPI.h"

@interface WLBaseServerAPI()

@property(nonatomic,assign)CFTimeInterval startTime;
@property(nonatomic,assign)CFTimeInterval costTime;
@property(nonatomic,strong)NSString *server;
@property(nonatomic,strong)NSString *responseRawString;// 原生string数据
//请求
@property(nonatomic,strong)NSDictionary *paraDicts;
@property(nonatomic,strong)NSDictionary *paraFiles;


//task
@property(nonatomic,strong)NSURLSessionDataTask *task;

@end



@implementation WLBaseServerAPI


#pragma mark 构造器
- (instancetype)initWithServer:(NSString *)server{
    if ([super init]) {
        if(![server hasPrefix:@"http://"]){
            server = [@"http://" stringByAppendingString:server];
        }
        if ([server hasSuffix:@"/"]) {
            server = [server substringToIndex:server.length - 1];
        }
        self.server = server;
    }
    return self;
}

#pragma mark -m 接口

- (void)accessAPI:(NSString *)api requestMethod:(WLRequestMethod)method params:(NSDictionary *)params files:(NSDictionary *)files completionBlock:(WLBaseAPIBlock)completionBlock{
    
    if (!_manager) {
        _manager = [AFHTTPSessionManager manager];
        _manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        _manager.responseSerializer.acceptableContentTypes = [_manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
        
    }
    if(self.processState == WL_PROCESS_LOADING){
        [self cancleRequest];
    }
    
    if(![api hasPrefix:@"/"]){
        self.api = [@"/" stringByAppendingString:api];
    }else{
        self.api = api;
    }
    
    self.paraDicts = params;
    self.paraFiles = files;
    self.completionBlock = completionBlock;
    self.costTime = 0;
    self.startTime = CFAbsoluteTimeGetCurrent();
    
    //重置状态
    self.processState = WL_PROCESS_CREATED;
    self.responseRawData = nil;
    self.responseJsonData = nil;
    self.responseRawString = nil;
    self.error = nil;
    
    //发起请求
    NSString *url = [self.server stringByAppendingString:self.api];
    
    if (method == WL_REQUEST_POST) {
        self.task = [_manager POST:url parameters:self.paraDicts progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            self.costTime = CFAbsoluteTimeGetCurrent() - self.startTime;
            self.responseRawData = (NSData *)responseObject;
            self.responseJsonData = [NSJSONSerialization JSONObjectWithData:self.responseRawData options:NSJSONReadingMutableContainers error:nil];
            
            self.processState = WL_PROCESS_SUCCEED;
            if(self.completionBlock){
                self.completionBlock(self);
            }
            
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            self.processState = WL_PROCESS_FAILED;
        }];

    }else{
        //get 方法
    }
    
    self.processState = WL_PROCESS_LOADING;
    
}


-(void)accessAPI:(NSString *)api requestMethod:(WLRequestMethod)method params:(NSDictionary *)params completionBlock:(WLBaseAPIBlock)completionBlock{
    [self accessAPI:api requestMethod:method params:params files:nil completionBlock:completionBlock];
}

- (void)accessAPI:(NSString *)api params:(NSDictionary *)params completionBlock:(WLBaseAPIBlock)completionBlock{
    [self accessAPI:api requestMethod:WL_REQUEST_POST params:params files:nil completionBlock:completionBlock];
}



#pragma mark Public
- (void)cancleRequest{
    if(self.processState == WL_PROCESS_LOADING){
    [self.task cancel];
        self.processState = WL_PROCESS_CANCELLED;
    }else{
        //做提醒
    }
}

- (void)refreshRequest{
    [self accessAPI:self.api requestMethod:WL_REQUEST_POST params:self.paraDicts files:self.paraFiles completionBlock:self.completionBlock];
}


#pragma mark 懒加载
- (NSString *)responseRawString{
    if(_responseRawString){
        return _responseRawString;
    }
    if (_responseRawData) {
        _responseRawString = [[NSString alloc]initWithData:_responseRawData encoding:NSUTF8StringEncoding];
        return  self -> _responseRawString;
    }
    return nil;
}


//- (void)setResponseRawString:(NSString *)responseRawString{
////    if()
//}

@end
