//
//  HS_TabBarTransitionAnimation.h
//  LearningProgram
//
//  Created by RC on 2018/3/9.
//  Copyright © 2018年 HS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HS_TabBarTransitionAnimation : NSObject<UIViewControllerAnimatedTransitioning>

- (instancetype)initWithTargetEdge:(UIRectEdge)targetEdge;

@property (nonatomic, readwrite) UIRectEdge targetEdge;
- (void)updataTargetEdge:(UIRectEdge)targetEdge;

@end
