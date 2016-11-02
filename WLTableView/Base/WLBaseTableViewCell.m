//
//  WLBaseTableViewCell.m
//  WLTableView
//
//  Created by Liu,Qingcan on 2016/11/1.
//  Copyright © 2016年 LiuQingcan. All rights reserved.
//

#import "WLBaseTableViewCell.h"

@implementation WLBaseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}



#pragma mark setter
-(void)setDataObject:(WLTableViewBaseItem *)dataObject{
    self.detailTextLabel.text = dataObject.itemSubTitle;
    self.textLabel.text = dataObject.itemTitle;
    self.accessoryView = [[UIImageView alloc]initWithImage:dataObject.itemAccessoryImage];
    self.imageView.image = dataObject.itemImage;
    
}


+ (CGFloat)tableView:(UITableView *)tableView rowHeightForObject:(WLTableViewBaseItem *)item{
    return 44;
}

@end
