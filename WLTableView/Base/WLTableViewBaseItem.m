//
//  WLTableViewBaseItem.m
//  WLTableView
//
//  Created by Liu,Qingcan on 2016/10/31.
//  Copyright © 2016年 LiuQingcan. All rights reserved.
//

#import "WLTableViewBaseItem.h"

 CGFloat const CellInvalidHeight = -1;


@implementation WLTableViewBaseItem



- (instancetype)init{
    if ([super init]) {
        self = [self initWithTitle:nil Subtitle:nil image:nil accessoryImage:nil];
    }
    
    return self;
}
+ (instancetype)initWithTitle:(NSString *)title Subtitle:(NSString *)subTitle image:(UIImage *)image accessoryImage:(UIImage *)accessoryImage{
    return [[self alloc]initWithTitle:title Subtitle:subTitle image:image accessoryImage:accessoryImage];

}

- (instancetype)initWithTitle:(NSString *)title Subtitle:(NSString *)subTitle image:(UIImage *)image accessoryImage:(UIImage *)accessoryImage{
    self.itemImage = image;
    self.itemAccessoryImage = accessoryImage;
    self.itemTitle = title;
    self.itemSubTitle = subTitle;
    self.itemCellHeight = CellInvalidHeight;
    
    return self;
}


@end
