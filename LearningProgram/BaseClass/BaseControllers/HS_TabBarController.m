//
//  HS_TabBarController.m
//  LearningProgram
//
//  Created by RC on 2018/3/9.
//  Copyright © 2018年 HS. All rights reserved.
//

#import "HS_TabBarController.h"
#import "HS_TabBarTransitionAnimation.h"
#import "HS_TabBarTransition.h"

@interface HS_TabBarController ()<UITabBarControllerDelegate,UIGestureRecognizerDelegate>
{
    CGPoint beginPoint;
}
@property (nonatomic, strong) UIPanGestureRecognizer *panGestureRecognizer;
@property (nonatomic, strong) HS_TabBarTransitionAnimation *tabBarTransitionAnimation;

@end

@implementation HS_TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addGestureRecognizer:self.panGestureRecognizer];
    self.delegate = self;
    // Do any additional setup after loading the view.
}

#pragma - mark 过渡效果

- (UIPanGestureRecognizer *)panGestureRecognizer{
    if (_panGestureRecognizer == nil){
        _panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognizer:)];
        _panGestureRecognizer.delegate = self;
    }
    return _panGestureRecognizer;
}

- (void)panGestureRecognizer:(UIPanGestureRecognizer *)pan{
    if (self.transitionCoordinator || self.tabBar.hidden) {
        return;
    }
    if (pan.state == UIGestureRecognizerStateChanged) {
        CGPoint newPoint = [pan translationInView:self.view];
        if ((beginPoint.x > 0 && newPoint.x < 0) || (beginPoint.x < 0 && newPoint.x > 0)) {
            return;
        }
    }
    if (pan.state == UIGestureRecognizerStateBegan || pan.state == UIGestureRecognizerStateChanged){
        beginPoint = [pan translationInView:self.view];
        [self beginInteractiveTransitionIfPossible:pan];
    }
}

- (void)beginInteractiveTransitionIfPossible:(UIPanGestureRecognizer *)sender{
    CGPoint translation = [sender translationInView:self.view];
    if (translation.x > 0.f && self.selectedIndex > 0) {
        self.selectedIndex --;
    }
    else if (translation.x < 0.f && self.selectedIndex + 1 < self.viewControllers.count) {
        self.selectedIndex ++;
    }
    else {
        if (!CGPointEqualToPoint(translation, CGPointZero)) {
            sender.enabled = NO;
            sender.enabled = YES;
        }
    }
    
    
    [self.transitionCoordinator animateAlongsideTransitionInView:self.view animation:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        
    } completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        if ([context isCancelled]) {
            
        }
        else {
            
        }
    }];
}

#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if (self.transitionCoordinator || self.tabBar.hidden) {
        return NO;
    }
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRequireFailureOfGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    if ([otherGestureRecognizer.view isKindOfClass:[UITableView class]]) {
        return NO;
    }
    return YES;
}

#pragma mark - UITabBarControllerDelegate

- (id<UIViewControllerAnimatedTransitioning>)tabBarController:(UITabBarController *)tabBarController animationControllerForTransitionFromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    
    
    NSArray *viewControllers = tabBarController.viewControllers;
    
    NSInteger fromIndex = [viewControllers indexOfObject:fromVC];
    NSInteger toIndex = [viewControllers indexOfObject:toVC];
    UIRectEdge edge = UIRectEdgeLeft;
    if (toIndex > fromIndex) {
        edge = UIRectEdgeLeft;
    }
    else {
        edge = UIRectEdgeRight;
    }
    
    if (!self.tabBarTransitionAnimation) {
        self.tabBarTransitionAnimation = [[HS_TabBarTransitionAnimation alloc] initWithTargetEdge:edge];
    }
    else {
        [self.tabBarTransitionAnimation updataTargetEdge:edge];
    }
    return self.tabBarTransitionAnimation;
}

- (id<UIViewControllerInteractiveTransitioning>)tabBarController:(UITabBarController *)tabBarController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController{
    if (self.panGestureRecognizer.state == UIGestureRecognizerStateBegan || self.panGestureRecognizer.state == UIGestureRecognizerStateChanged) {
        return [animationController isKindOfClass:[HS_TabBarTransitionAnimation class]] ? [[HS_TabBarTransition alloc] initWithGestureRecognizer:self.panGestureRecognizer] : nil;
    }
    else {
        return nil;
    }
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
