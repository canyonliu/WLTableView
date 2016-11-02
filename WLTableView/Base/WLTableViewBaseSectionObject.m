//
//  WLTableViewBaseSectionObject.m
//  WLTableView
//
//  Created by Liu,Qingcan on 2016/10/31.
//  Copyright © 2016年 LiuQingcan. All rights reserved.
//

#import "WLTableViewBaseSectionObject.h"

@implementation WLTableViewBaseSectionObject

- (instancetype)init{
    if ([super init]) {
        self.sectionHeaderTitle = @"";
        self.sectionFooterTitle = @"";
        self.items = [NSMutableArray array];
    }
    return self;
}


- (instancetype)initWithItemArray:(NSMutableArray *)itemsArray{
    self = [self init];
    if (self) {
        [self.items addObjectsFromArray:itemsArray];
    }
    return self;
    
}

@end
