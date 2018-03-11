//
//  HS_TableViewController.m
//  LearningProgram
//
//  Created by 韩中帅 on 2018/3/9.
//  Copyright © 2018年 HS. All rights reserved.
//

#import "HS_TableViewController.h"

@interface HS_TableViewController ()

@end

@implementation HS_TableViewController

- (UITableView *)tableView
{
    if(_tableView == nil)
    {
        
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        [self.view addSubview:tableView];
        
        tableView.delegate = self;
        tableView.dataSource = self;
        
        tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        _tableView = tableView;
    }
    return _tableView;
}

- (NSMutableArray<HS_ItemSection *> *)sections
{
    if(_sections == nil)
    {
        _sections = [NSMutableArray array];
    }
    return _sections;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.equalTo(self.view);
        if (@available(iOS 11.0, *)) {
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        } else {
            make.top.equalTo(self.view.mas_top);
            make.bottom.equalTo(self.view.mas_bottom);
        }
    }];
    
    // Do any additional setup after loading the view.
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.sections[indexPath.section].items[indexPath.row].cellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    HS_TableViewItem *item = self.sections[indexPath.section].items[indexPath.row];
    
    // 普通的cell
    if(item.itemOperation)
    {
        item.itemOperation(indexPath);
        return;
    }
    
    // 带箭头的cell
    if([item isKindOfClass:[HS_TableViewArrowItem class]])
    {
        HS_TableViewArrowItem *arrowItem = (HS_TableViewArrowItem *)item;
        
        if(arrowItem.arrowVc)
        {
            UIViewController *vc = [[arrowItem.arrowVc alloc] init];
            vc.title = arrowItem.title;
            
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.sections[section].items.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return self.sections[section].headerTitle;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return self.sections[section].footerTitle;
}

static NSString *const CellID = @"BaseTableViewCell";
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HS_TableViewItem *item = self.sections[indexPath.section].items[indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellID];
    }
    
    cell.textLabel.text = item.title;
    cell.detailTextLabel.text = item.subTitle;
    cell.imageView.image = item.image;
    cell.textLabel.font = item.titleFont;
    cell.textLabel.textColor = item.titleColor;
    
    cell.detailTextLabel.font = item.subTitleFont;
    cell.detailTextLabel.textColor = item.subTitleColor;
    
    if ([item isKindOfClass:[HS_TableViewArrowItem class]]) {
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
    }else
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    if (item.itemOperation || [item isKindOfClass:[HS_TableViewArrowItem class]]) {
        
        cell.selectionStyle = UITableViewCellSelectionStyleDefault;
        
    }else
    {
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
