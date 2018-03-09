//
//  HS_TabBarTransition.h
//  LearningProgram
//
//  Created by RC on 2018/3/9.
//  Copyright © 2018年 HS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HS_TabBarTransition : UIPercentDrivenInteractiveTransition

- (instancetype)initWithGestureRecognizer:(UIPanGestureRecognizer *)gestureRecognizer NS_DESIGNATED_INITIALIZER;

- (instancetype)init NS_UNAVAILABLE;

@end
