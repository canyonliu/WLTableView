//
//  WLTableViewDataSource.m
//  WLTableView
//
//  Created by Liu,Qingcan on 2016/11/1.
//  Copyright © 2016年 LiuQingcan. All rights reserved.
//

#import "WLTableViewDataSource.h"
#import "WLTableViewBaseSectionObject.h"
#import "WLBaseTableViewCell.h"

#import <objc/runtime.h>

@implementation WLTableViewDataSource

#pragma mark WLTableViewDataSource  --father 子类可以重写

-(WLTableViewBaseItem *)tableView:(UITableView *)tableView objectForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_sections.count > indexPath.section) {
         WLTableViewBaseSectionObject *section = _sections[indexPath.section];
        if (section.items.count > indexPath.row) {
            WLTableViewBaseItem *item = [section.items objectAtIndex:indexPath.row];
            return item;

        }
    }
    return nil;
}

- (Class)tableView:(UITableView *)tableView cellClassForObject:(WLTableViewBaseItem *)object{
    return [WLBaseTableViewCell class];
}

#pragma mark UITableViewDataSouce --Required 


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (_sections.count > section) {
        WLTableViewBaseSectionObject *object = [_sections objectAtIndex:section];
        return object.items.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WLTableViewBaseItem *item = [self tableView:tableView objectForRowAtIndexPath:indexPath];
    Class cellCls = [self tableView:tableView cellClassForObject:item];
    NSString *cellString = [NSString stringWithUTF8String:class_getName(cellCls)];
    WLBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellString];
    
    if (!cell) {
        cell = [[cellCls alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellString];
    }
    
    [cell setDataObject:item];
    
    return cell;
}

#pragma mark UITableViewDataSource Optional

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _sections.count > 0 ? _sections.count : 0;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (self.sections.count > section) {
        WLTableViewBaseSectionObject *object = [_sections objectAtIndex:section];
        return object.sectionHeaderTitle != nil ? object.sectionHeaderTitle : @"";
    }
    return nil;
}


-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    if(self.sections.count > section){
        WLTableViewBaseSectionObject *object = [_sections objectAtIndex:section];
        return object.sectionFooterTitle != nil ? object.sectionFooterTitle : @"";
        
    }
    return nil;
}





#pragma mark Public

-(void)clearAllItems{
    [self.sections removeAllObjects];
}


//- (void)appendItem:(KtTableViewBaseItem *)item {
//    KtTableViewSectionObject *firstSectionObject = [self.sections objectAtIndex:0];
//    [firstSectionObject.items addObject:item];
//}

@end
