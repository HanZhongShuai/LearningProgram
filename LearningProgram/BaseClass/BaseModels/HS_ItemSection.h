//
//  HS_ItemSection.h
//  LearningProgram
//
//  Created by 韩中帅 on 2018/3/9.
//  Copyright © 2018年 HS. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HS_TableViewItem;
@interface HS_ItemSection : NSObject

/** <#digest#> */
@property (nonatomic, copy) NSString *headerTitle;

/** <#digest#> */
@property (nonatomic, copy) NSString *footerTitle;

/** <#digest#> */
@property (nonatomic, strong) NSMutableArray<HS_TableViewItem *> *items;

+ (instancetype)sectionWithItems:(NSArray<HS_TableViewItem *> *)items andHeaderTitle:(NSString *)headerTitle footerTitle:(NSString *)footerTitle;

@end
