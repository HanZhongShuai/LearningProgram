//
//  HS_TabBarTransitionAnimation.m
//  LearningProgram
//
//  Created by RC on 2018/3/9.
//  Copyright © 2018年 HS. All rights reserved.
//

#import "HS_TabBarTransitionAnimation.h"
#import "HS_TabBarController.h"
@implementation HS_TabBarTransitionAnimation

- (instancetype)initWithTargetEdge:(UIRectEdge)targetEdge {
    self = [self init];
    if (self) {
        _targetEdge = targetEdge;
    }
    return self;
}

- (void)updataTargetEdge:(UIRectEdge)targetEdge
{
    _targetEdge = targetEdge;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.35;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    
    CGRect fromFrame = [transitionContext initialFrameForViewController:fromViewController];
    fromFrame = CGRectMake(0, 0, fromFrame.size.width, fromFrame.size.height);
    CGRect toFrame = [transitionContext finalFrameForViewController:toViewController];
    toFrame = CGRectMake(0, 0, toFrame.size.width, toFrame.size.height);
    
    CGVector offset;
    if (self.targetEdge == UIRectEdgeLeft){
        offset = CGVectorMake(-1.f, 0.f);
    }
    else if (self.targetEdge == UIRectEdgeRight){
        offset = CGVectorMake(1.f, 0.f);
    }
    else{
        NSAssert(NO, @"targetEdge must be one of UIRectEdgeLeft, or UIRectEdgeRight.");
    }
    
    fromView.frame = fromFrame;
    toView.frame = CGRectOffset(toFrame,
                                toFrame.size.width * offset.dx * -1,
                                toFrame.size.height * offset.dy * -1);
    
    [transitionContext.containerView addSubview:toView];
    fromFrame = CGRectOffset(fromFrame,
                             fromFrame.size.width * offset.dx,
                             fromFrame.size.height * offset.dy);
    NSTimeInterval transitionDuration = [self transitionDuration:transitionContext];
    
    [UIView animateWithDuration:transitionDuration animations:^{
        toView.frame = toFrame;
        fromView.frame = fromFrame;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

@end
