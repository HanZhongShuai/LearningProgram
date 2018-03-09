//
//  AppDelegate.m
//  LearningProgram
//
//  Created by RC on 2018/3/9.
//  Copyright © 2018年 HS. All rights reserved.
//

#import "AppDelegate.h"
#import "HS_TabBarController.h"
#import "PracticeViewController.h"
#import "LearnViewController.h"
#import "DemoViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window makeKeyAndVisible];
    
    [self setRootViewControllerToTabbarViewController];
    
    return YES;
}

- (void)setRootViewControllerToTabbarViewController
{
    
    PracticeViewController *exploreViewController = [[PracticeViewController alloc]init];
    UIImage *exploreImage = [UIImage imageNamed:@"explore"];
    exploreImage = [exploreImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *exploreSelectedImage = [UIImage imageNamed:@"explore_pressed"];
    exploreSelectedImage = [exploreSelectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem *exploreItem = [[UITabBarItem alloc]initWithTitle:NSLocalizedString(@"tab.practice", nil) image:exploreImage selectedImage:exploreSelectedImage];
    [exploreItem setTitlePositionAdjustment:UIOffsetMake(0, -3)];
    [exploreItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithHexString:@"#88592b"],NSForegroundColorAttributeName,[UIFont systemFontOfSize:11.0f],NSFontAttributeName, nil]  forState:UIControlStateSelected];
    HS_NavigationController *exploreNav = [[HS_NavigationController alloc]initWithRootViewController:exploreViewController];
    exploreNav.tabBarItem = exploreItem;
    
    LearnViewController *historyViewController = [[LearnViewController alloc]init];
    UIImage *historyImage = [UIImage imageNamed:@"active_normal"];
    historyImage = [historyImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *historySelectedImage = [UIImage imageNamed:@"active_pressed"];
    historySelectedImage = [historySelectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem *historyItem = [[UITabBarItem alloc]initWithTitle:NSLocalizedString(@"tab.learn",nil) image:historyImage selectedImage:historySelectedImage];
    [historyItem setTitlePositionAdjustment:UIOffsetMake(0, -3)];
    [historyItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithHexString:@"#88592b"],NSForegroundColorAttributeName,[UIFont systemFontOfSize:11.0f],NSFontAttributeName, nil]  forState:UIControlStateSelected];
    HS_NavigationController *historyNav = [[HS_NavigationController alloc]initWithRootViewController:historyViewController];
    historyNav.tabBarItem = historyItem;
    
    DemoViewController *messageViewController = [[DemoViewController alloc]init];
    UIImage *messageImage = [UIImage imageNamed:@"message"];
    messageImage = [messageImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *messageSelectedImage = [UIImage imageNamed:@"message_pressed"];
    messageSelectedImage = [messageSelectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem *messageItem = [[UITabBarItem alloc]initWithTitle:NSLocalizedString(@"tab.demo",nil) image:messageImage selectedImage:messageSelectedImage];
    //     [messageItem setBadgeValue:@""];
    [messageItem setTitlePositionAdjustment:UIOffsetMake(0, -3)];
    [messageItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithHexString:@"#88592b"],NSForegroundColorAttributeName,[UIFont systemFontOfSize:11.0f],NSFontAttributeName, nil]  forState:UIControlStateSelected];
    HS_NavigationController *messageNav = [[HS_NavigationController alloc]initWithRootViewController:messageViewController];
    messageNav.tabBarItem = messageItem;
    
    HS_TabBarController *tabBarController = [[HS_TabBarController alloc]init];
//    tabBarController.delegate = self;
    tabBarController.tabBar.backgroundColor = [UIColor clearColor];
    [tabBarController.tabBar setBarTintColor:[UIColor whiteColor]];
    [tabBarController.tabBar setBarStyle:UIBarStyleDefault];
    tabBarController.tabBar.translucent = NO;
    tabBarController.viewControllers = [NSArray arrayWithObjects:exploreNav,historyNav,messageNav, nil];
    
    self.window.rootViewController = tabBarController;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
