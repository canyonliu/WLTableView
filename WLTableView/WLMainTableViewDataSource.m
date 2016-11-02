//
//  WLMainTableViewDataSource.m
//  WLTableView
//
//  Created by Liu,Qingcan on 2016/11/1.
//  Copyright © 2016年 LiuQingcan. All rights reserved.
//

#import "WLMainTableViewDataSource.h"
#import "WLTableViewBaseSectionObject.h"
#import "WLTableViewBaseItem.h"
#import "WLMainTableViewCell.h"


@implementation WLMainTableViewDataSource

-(instancetype)init{
    if ([super init]) {
         
         
        WLTableViewBaseSectionObject *firstSectionObject = [[WLTableViewBaseSectionObject alloc] initWithItemArray:[NSMutableArray arrayWithObjects:
                                                                            [[WLTableViewBaseItem alloc]initWithTitle:@"first" Subtitle:@"haha" image:nil accessoryImage:nil],
                                                                                                            [[WLTableViewBaseItem alloc]initWithTitle:@"seconde" Subtitle:@"haha" image:nil accessoryImage:nil],
                                                                                                                    [[WLTableViewBaseItem alloc]initWithTitle:@"third" Subtitle:@"haha" image:nil accessoryImage:nil],
                                                                                                                    [[WLTableViewBaseItem alloc]initWithTitle:@"fourth" Subtitle:@"haha" image:nil accessoryImage:nil],
                                                                                                                    [[WLTableViewBaseItem alloc]initWithTitle:@"five" Subtitle:@"haha" image:nil accessoryImage:nil],
                                                                                                                    [[WLTableViewBaseItem alloc]initWithTitle:@"six" Subtitle:@"haha" image:nil accessoryImage:nil],
                                                                                                            nil]];
        self.sections = [NSMutableArray arrayWithObject: firstSectionObject];

    }
    return self;
}

- (Class)tableView:(UITableView *)tableView cellClassForObject:(WLTableViewBaseItem *)object{
    return [WLMainTableViewCell class];
}



@end
