//
//  WLBaseTableViewCell.h
//  WLTableView
//
//  Created by Liu,Qingcan on 2016/11/1.
//  Copyright © 2016年 LiuQingcan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLTableViewBaseItem.h"

@interface WLBaseTableViewCell : UITableViewCell

@property(nonatomic,strong)id dataObject;

+ (CGFloat)tableView:(UITableView *)tableView rowHeightForObject:(WLTableViewBaseItem *)item;

@end
