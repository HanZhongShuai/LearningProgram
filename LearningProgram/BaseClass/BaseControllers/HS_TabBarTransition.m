//
//  HS_TabBarTransition.m
//  LearningProgram
//
//  Created by RC on 2018/3/9.
//  Copyright © 2018年 HS. All rights reserved.
//

#import "HS_TabBarTransition.h"

@interface HS_TabBarTransition ()
@property (nonatomic, weak) id<UIViewControllerContextTransitioning> transitionContext;
@property (nonatomic, strong, readonly) UIPanGestureRecognizer *gestureRecognizer;
@property (nonatomic, readwrite) CGPoint initialTranslationInContainerView;
@end

@implementation HS_TabBarTransition

- (instancetype)initWithGestureRecognizer:(UIPanGestureRecognizer *)gestureRecognizer{
    self = [super init];
    if (self){
        _gestureRecognizer = gestureRecognizer;
        [_gestureRecognizer addTarget:self action:@selector(gestureRecognizeDidUpdate:)];
    }
    return self;
}

- (instancetype)init{
    @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Use -initWithGestureRecognizer:" userInfo:nil];
}

- (void)dealloc{
    [self.gestureRecognizer removeTarget:self action:@selector(gestureRecognizeDidUpdate:)];
}

- (void)startInteractiveTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    self.transitionContext = transitionContext;
    self.initialTranslationInContainerView = [self.gestureRecognizer translationInView:transitionContext.containerView];
    [super startInteractiveTransition:transitionContext];
}

- (CGFloat)percentForGesture:(UIPanGestureRecognizer *)gesture{
    UIView *transitionContainerView = self.transitionContext.containerView;
    CGPoint translation = [gesture translationInView:gesture.view.superview];
    if ((translation.x > 0.f && self.initialTranslationInContainerView.x < 0.f) ||
        (translation.x < 0.f && self.initialTranslationInContainerView.x > 0.f)){
        return -1.f;
    }
    if (translation.x > 0.f && self.initialTranslationInContainerView.x >= 0.f) {
        return (translation.x-self.initialTranslationInContainerView.x)/CGRectGetWidth(transitionContainerView.bounds);
    }
    if (translation.x < 0.f && self.initialTranslationInContainerView.x <= 0.f) {
        return (self.initialTranslationInContainerView.x-translation.x)/CGRectGetWidth(transitionContainerView.bounds);
    }
    return -1.f;
}

- (void)gestureRecognizeDidUpdate:(UIPanGestureRecognizer *)gestureRecognizer{
    switch (gestureRecognizer.state) {
        case UIGestureRecognizerStateBegan:
            break;
        case UIGestureRecognizerStateChanged:
            if ([self percentForGesture:gestureRecognizer] < 0.f) {
                [self.gestureRecognizer removeTarget:self action:@selector(gestureRecognizeDidUpdate:)];
                [self cancelInteractiveTransition];
            }
            else {
                [self updateInteractiveTransition:[self percentForGesture:gestureRecognizer]];
            }
            break;
        case UIGestureRecognizerStateEnded:
            [self.gestureRecognizer removeTarget:self action:@selector(gestureRecognizeDidUpdate:)];
            if ([self percentForGesture:gestureRecognizer] >= 0.25f){
                [self finishInteractiveTransition];
            }
            else{
                [self cancelInteractiveTransition];
            }
            break;
        default:
            [self.gestureRecognizer removeTarget:self action:@selector(gestureRecognizeDidUpdate:)];
            [self cancelInteractiveTransition];
            break;
    }
}

@end
