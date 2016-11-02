//
//  WLBaseTableViewController.m
//  WLTableView
//
//  Created by Liu,Qingcan on 2016/11/1.
//  Copyright © 2016年 LiuQingcan. All rights reserved.
//

#import "WLBaseTableViewController.h"

@interface WLBaseTableViewController ()

@end

@implementation WLBaseTableViewController
#pragma mark Public
-(instancetype)initWithTableViewStyle:(UITableViewStyle)tableViewStyle{
    if ([super init]) {
        [self createDataSource];
//        _tableviewStyle = tableViewStyle;
        [self createTableView];
    }
    return self;
}

#pragma mark life circle

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self createTableView];
//    [self.view addSubview:self.wlTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark WLTableViewControllerDelegate
-(void)createDataSource{
    @throw [NSException exceptionWithName:@"不能主动调用这个方法"
                                   reason:@"只能是这个子类才可以进行调用"
                                 userInfo:nil];
}


#pragma mark Private

- (void)createTableView{
    if(!_wlTableView){
        _wlTableView = [[WLBaseTableView alloc]initWithFrame:self.view.bounds style:self.tableviewStyle];
        _wlTableView.wlDelegate = self;
        _wlTableView.wlDataSource = self.wlDataSource;
        [self.view addSubview:_wlTableView];
    }
}






@end
