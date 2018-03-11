//
//  HS_TableViewController.h
//  LearningProgram
//
//  Created by 韩中帅 on 2018/3/9.
//  Copyright © 2018年 HS. All rights reserved.
//

#import "HS_BaseViewController.h"
#import "HS_TableViewItem.h"
#import "HS_TableViewArrowItem.h"
#import "HS_ItemSection.h"

@interface HS_TableViewController : HS_BaseViewController<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;
// 需要把组模型添加到数据中
@property (nonatomic, strong) NSMutableArray<HS_ItemSection *> *sections;

@end
