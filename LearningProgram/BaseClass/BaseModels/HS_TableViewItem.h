//
//  HS_TableViewItem.h
//  LearningProgram
//
//  Created by 韩中帅 on 2018/3/9.
//  Copyright © 2018年 HS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HS_TableViewItem : NSObject

/** 标题 */
@property (nonatomic, copy) NSString *title;
/** 副标题的字体 */
@property (nonatomic, strong) UIFont *titleFont;
/** 主标题的颜色 */
@property (nonatomic, strong) UIColor *titleColor;

/** subTitle */
@property (nonatomic, copy) NSString *subTitle;
/** 副标题的字体 */
@property (nonatomic, strong) UIFont *subTitleFont;
/** 副标题的颜色 */
@property (nonatomic, strong) UIColor *subTitleColor;

/** 左边的图片 */
@property (nonatomic, strong) UIImage *image;

/** 设置cell的高度, 默认60 */
@property (assign, nonatomic) CGFloat cellHeight;

/** 点击操作 */
@property (nonatomic, copy) void(^itemOperation)(NSIndexPath *indexPath);

+ (instancetype)itemWithTitle:(NSString *)title subTitle:(NSString *)subTitle;

+ (instancetype)itemWithTitle:(NSString *)title subTitle:(NSString *)subTitle itemOperation:(void(^)(NSIndexPath *indexPath))itemOperation;

@end
