//
//  WLBaseTableView.h
//  WLTableView
//
//  Created by Liu,Qingcan on 2016/11/1.
//  Copyright © 2016年 LiuQingcan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLTableViewDataSource.h"

@class WLTableViewBaseSectionObject;


@protocol WLTableViewDelegate <UITableViewDelegate>

@optional
-(void)didSelectedObject:(id)object indexPath:(NSIndexPath *)indexPath;
//我觉得这里不应该由VC来决定headerView长什么样子
-(UIView *)headerViewForSectionObject:(WLTableViewBaseSectionObject *)sectionObject atSection:(NSInteger)section;

@end



@interface WLBaseTableView : UITableView<UITableViewDelegate>

@property(nonatomic,assign) id <WLTableViewDelegate> wlDelegate;

@property(nonatomic,assign) id <WLTableViewDataSouce> wlDataSource;


@end
