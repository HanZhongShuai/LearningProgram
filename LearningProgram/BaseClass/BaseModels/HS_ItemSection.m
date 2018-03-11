//
//  HS_ItemSection.m
//  LearningProgram
//
//  Created by 韩中帅 on 2018/3/9.
//  Copyright © 2018年 HS. All rights reserved.
//

#import "HS_ItemSection.h"

@implementation HS_ItemSection

+ (instancetype)sectionWithItems:(NSArray<HS_TableViewItem *> *)items andHeaderTitle:(NSString *)headerTitle footerTitle:(NSString *)footerTitle
{
    HS_ItemSection *item = [[self alloc] init];
    if (items.count) {
        [item.items addObjectsFromArray:items];
    }
    
    item.headerTitle = headerTitle;
    item.footerTitle = footerTitle;
    
    return item;
}

- (NSMutableArray<HS_TableViewItem *> *)items
{
    if(!_items)
    {
        _items = [NSMutableArray array];
    }
    return _items;
}

@end
