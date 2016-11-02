//
//  WLTableViewBaseItem.h
//  WLTableView
//
//  Created by Liu,Qingcan on 2016/10/31.
//  Copyright © 2016年 LiuQingcan. All rights reserved.
//

#import <UIKit/UIKit.h>


FOUNDATION_EXPORT CGFloat const CellInvalidHeight;

@interface WLTableViewBaseItem : NSObject

@property(nonatomic,assign)CGFloat itemCellHeight;

@property(nonatomic,strong)NSString *itemTitle;

@property(nonatomic,strong)NSString *itemSubTitle;

@property(nonatomic,strong)NSString *itemIdentifier;

@property(nonatomic,strong)UIImage *itemImage;

@property(nonatomic,strong)UIImage *itemAccessoryImage;



#pragma mark Public
+ (instancetype)initWithTitle:(NSString *)title Subtitle:(NSString *)subTitle image:(UIImage *)image accessoryImage:(UIImage *)accessoryImage;

- (instancetype)initWithTitle:(NSString *)title Subtitle:(NSString *)subTitle image:(UIImage *)image accessoryImage:(UIImage *)accessoryImage;



@end
