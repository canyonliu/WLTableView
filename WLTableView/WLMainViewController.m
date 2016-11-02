//
//  WLMainViewController.m
//  WLTableView
//
//  Created by Liu,Qingcan on 2016/11/1.
//  Copyright © 2016年 LiuQingcan. All rights reserved.
//

#import "WLMainViewController.h"
#import "WLMainTableViewDataSource.h"

@interface WLMainViewController ()

@end

@implementation WLMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)createDataSource{
    self.wlDataSource = [[WLMainTableViewDataSource alloc]init];
}



#pragma mark WLTableViewDelegate

-(void)didSelectedObject:(id)object indexPath:(NSIndexPath *)indexPath{
    NSLog(@"123");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
