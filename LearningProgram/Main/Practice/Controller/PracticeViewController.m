//
//  PracticeViewController.m
//  LearningProgram
//
//  Created by RC on 2018/3/9.
//  Copyright © 2018年 HS. All rights reserved.
//

#import "PracticeViewController.h"
#import "AddressPickerViewController.h"

@interface PracticeViewController ()

@end

@implementation PracticeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSLocalizedString(@"tab.practice", nil);
    
    HS_TableViewArrowItem *item1 = [HS_TableViewArrowItem itemWithTitle:@"省市区与时间三级联动" subTitle:nil];
    item1.arrowVc = [AddressPickerViewController class];
    
    HS_ItemSection *section0 = [HS_ItemSection sectionWithItems:@[item1] andHeaderTitle:nil footerTitle:nil];
    
    [self.sections addObject:section0];
    // Do any additional setup after loading the view from its nib.
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
