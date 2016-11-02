//
//  WLBaseTableView.m
//  WLTableView
//
//  Created by Liu,Qingcan on 2016/11/1.
//  Copyright © 2016年 LiuQingcan. All rights reserved.
//

#import "WLBaseTableView.h"
#import "WLBaseTableViewCell.h"

@implementation WLBaseTableView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    if ([super initWithFrame:frame style:style]) {
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        self.showsVerticalScrollIndicator = YES;
        self.showsHorizontalScrollIndicator = NO;
//        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.sectionHeaderHeight = 0;
        self.sectionFooterHeight = 0;
        self.separatorColor = [UIColor clearColor];
        self.delegate = self;
        
    }
    return self;
}



-(void)setWlDataSource:(id<WLTableViewDataSouce>)wlDataSource{
    if (_wlDataSource != wlDataSource) {
        _wlDataSource = wlDataSource;
        self.dataSource = wlDataSource;
    }
}


#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if([_wlDelegate respondsToSelector:@selector(didSelectedObject:indexPath:)]){
        id <WLTableViewDataSouce> datasource = (id <WLTableViewDataSouce>)tableView.dataSource;
        id selectData = [datasource tableView:tableView objectForRowAtIndexPath:indexPath];
        
        [_wlDelegate didSelectedObject:selectData indexPath:indexPath];
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        
    }else if([_wlDelegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)]){
        [_wlDelegate tableView:tableView didSelectRowAtIndexPath:indexPath];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    if([_wlDelegate respondsToSelector:@selector(didSelectedObject:indexPath:)]){
        id <WLTableViewDataSouce> datasource = (id <WLTableViewDataSouce>)tableView.dataSource;
        WLTableViewBaseItem *selectData = [datasource tableView:tableView objectForRowAtIndexPath:indexPath];
        Class cellCls = [datasource tableView:tableView cellClassForObject:selectData];
        if (selectData.itemCellHeight == CellInvalidHeight) {//没有高度缓存
            selectData.itemCellHeight = [cellCls tableView:tableView rowHeightForObject:selectData];
        }
        return selectData.itemCellHeight;
//    }
//    return 44;
}


//#pragma mark WLTableViewDelegate

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if ([_wlDelegate respondsToSelector:@selector(headerViewForSectionObject:atSection:)]) {
        id <WLTableViewDataSouce> datasource  = (id <WLTableViewDataSouce>) tableView.dataSource;
        WLTableViewBaseSectionObject *sectionObject = [((WLTableViewDataSource *)datasource).sections objectAtIndex:section];
        UIView *view = [_wlDelegate headerViewForSectionObject:sectionObject atSection:section];
        return view;

    }else if([_wlDelegate respondsToSelector:@selector(tableView:viewForHeaderInSection:)]){
        UIView *view = [_wlDelegate tableView:tableView viewForHeaderInSection:section];
        return view;
    }
    return nil;
}

#pragma mark - 传递原生协议

//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
//    if ([self.wlDelegate respondsToSelector:@selector(tableView:willDisplayCell:forRowAtIndexPath:)]) {
//        [self.wlDelegate tableView:tableView willDisplayCell:cell forRowAtIndexPath:indexPath];
//    }
//}





@end
