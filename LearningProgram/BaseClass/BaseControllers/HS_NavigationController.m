//
//  HS_NavigationController.m
//  LearningProgram
//
//  Created by RC on 2018/3/9.
//  Copyright © 2018年 HS. All rights reserved.
//

#import "HS_NavigationController.h"

@interface HS_NavigationController ()

@end

@implementation HS_NavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationBar setBarTintColor:[UIColor colorWithHexString:@"#FFC34A"]]; //导航背景颜色
    self.navigationBar.translucent = NO;
    
    //Title字体、颜色
    NSDictionary * dict = [NSDictionary dictionaryWithObjects:@[[UIColor whiteColor],[UIFont fontWithName:FontNameBold size:17]] forKeys:@[NSForegroundColorAttributeName,NSFontAttributeName]];
    self.navigationBar.titleTextAttributes = dict;
    
    //去除原生黑线
//    [self.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
//    [self.navigationBar setShadowImage:[[UIImage alloc] init]];
    
    // Do any additional setup after loading the view.
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
