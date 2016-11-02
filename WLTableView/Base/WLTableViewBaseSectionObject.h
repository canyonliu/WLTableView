//
//  WLTableViewBaseSectionObject.h
//  WLTableView
//
//  Created by Liu,Qingcan on 2016/10/31.
//  Copyright © 2016年 LiuQingcan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WLTableViewBaseSectionObject : NSObject

@property(nonatomic,copy)NSString *sectionHeaderTitle;

@property(nonatomic,copy)NSString *sectionFooterTitle;

@property(nonatomic,strong)NSMutableArray *items;//cell 的数据

//gou zao qi
- (instancetype)initWithItemArray:(NSMutableArray *)itemsArray;

@end
