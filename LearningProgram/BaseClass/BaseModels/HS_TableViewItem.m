//
//  HS_TableViewItem.m
//  LearningProgram
//
//  Created by 韩中帅 on 2018/3/9.
//  Copyright © 2018年 HS. All rights reserved.
//

#import "HS_TableViewItem.h"

@implementation HS_TableViewItem

+ (instancetype)itemWithTitle:(NSString *)title subTitle:(NSString *)subTitle
{
    HS_TableViewItem *item = [[self alloc] init];
    item.subTitle = subTitle;
    item.title = title;
    return item;
}

+ (instancetype)itemWithTitle:(NSString *)title subTitle:(NSString *)subTitle itemOperation:(void(^)(NSIndexPath *indexPath))itemOperation {
    HS_TableViewItem *item = [self itemWithTitle:title subTitle:subTitle];
    item.itemOperation = itemOperation;
    return item;
}

- (instancetype)init
{
    if (self = [super init]) {
        
        _titleColor = [UIColor blackColor];
        _subTitleColor = [UIColor blackColor];
        
        _cellHeight = getWidth(60);
        _titleFont = [UIFont fontWithName:FontNameMedium size:getFontSize(17)];
        _subTitleFont = [UIFont fontWithName:FontNameMedium size:getFontSize(15)];
        
    }
    
    return self;
}

@end
