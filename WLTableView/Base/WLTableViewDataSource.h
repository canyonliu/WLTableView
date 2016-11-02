//
//  WLTableViewDataSource.h
//  WLTableView
//
//  Created by Liu,Qingcan on 2016/11/1.
//  Copyright © 2016年 LiuQingcan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WLTableViewBaseItem;

@protocol WLTableViewDataSouce <UITableViewDataSource>

//- (void)didSelectedObject:(id)object indexPath:(NSIndexPath *)indexPath;
-(WLTableViewBaseItem *)tableView:(UITableView *)tableView
          objectForRowAtIndexPath:(NSIndexPath *)indexPath;

-(Class)tableView:(UITableView *)tableView cellClassForObject:(WLTableViewBaseItem*)object;



@end


@interface WLTableViewDataSource : NSObject<WLTableViewDataSouce>
@property(nonatomic,strong)NSMutableArray *sections;//二维数组


-(void)clearAllItems;

@end
