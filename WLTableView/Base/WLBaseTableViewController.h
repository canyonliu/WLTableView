//
//  WLBaseTableViewController.h
//  WLTableView
//
//  Created by Liu,Qingcan on 2016/11/1.
//  Copyright © 2016年 LiuQingcan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLTableViewDataSource.h"
#import "WLBaseTableView.h"

@protocol WLTableViewControllerDelegate <NSObject>

@required
-(void)createDataSource;

@end


@interface WLBaseTableViewController : UIViewController<WLTableViewDelegate,WLTableViewControllerDelegate>

@property(nonatomic,strong)WLTableViewDataSource *wlDataSource;

@property(nonatomic,strong)WLBaseTableView *wlTableView;
@property(nonatomic,assign)UITableViewStyle tableviewStyle;

-(instancetype)initWithTableViewStyle:(UITableViewStyle)tableViewStyle;


@end
