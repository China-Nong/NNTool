//
//  UITableView+Extension.m
//  NNTool
//
//  Created by cycx on 2019/12/16.
//  Copyright © 2019 cycx. All rights reserved.
//

#import "UITableView+Extension.h"

@implementation UITableView (Extension)

/**
 
 */
+ (instancetype) initTbaleview
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:(CGRectZero) style:(UITableViewStylePlain)];
    tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
//    [tableView setSeparatorColor:[UIColor whiteColor]]; // 线条颜色
//    tableView.separatorStyle = UITableViewCellSeparatorStyleNone; // 线条隐藏显示

    return tableView;
}

@end
