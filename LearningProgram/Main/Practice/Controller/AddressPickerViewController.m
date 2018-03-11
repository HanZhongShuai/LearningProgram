//
//  AddressPickerViewController.m
//  LearningProgram
//
//  Created by 韩中帅 on 2018/3/9.
//  Copyright © 2018年 HS. All rights reserved.
//

#import "AddressPickerViewController.h"
#import <MOFSPickerManager.h>

@interface AddressPickerViewController ()

@end

@implementation AddressPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    __weak typeof(self)weakSelf = self;
    NSArray *array = @[[HS_TableViewItem itemWithTitle:@"选择地址" subTitle:@"" itemOperation:^(NSIndexPath *indexPath) {
        
        [[MOFSPickerManager shareManger] showMOFSAddressPickerWithTitle:nil cancelTitle:@"取消" commitTitle:@"完成" commitBlock:^(NSString *address, NSString *zipcode) {
            
            NSLog(@"==%@==", [NSThread currentThread]);
            dispatch_async(dispatch_get_main_queue(), ^{
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:address message:zipcode preferredStyle:UIAlertControllerStyleAlert];
                [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    
                }]];
                [weakSelf presentViewController:alert animated:YES completion:nil];
            });
            
        } cancelBlock:^{
            
        }];
        
    }], [HS_TableViewItem itemWithTitle:@"选择时间" subTitle:@"" itemOperation:^(NSIndexPath *indexPath) {
        [[MOFSPickerManager shareManger] showDatePickerWithTag:1 title:@"时间" cancelTitle:@"取消" commitTitle:@"确定" datePickerMode:UIDatePickerModeDate commitBlock:^(NSDate *date) {
            dispatch_async(dispatch_get_main_queue(), ^{
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"时间" message:date.description preferredStyle:UIAlertControllerStyleAlert];
                [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    
                }]];
                [weakSelf presentViewController:alert animated:YES completion:nil];
            });
        } cancelBlock:^{
            
        }];
//        [[MOFSPickerManager shareManger] searchAddressByZipcode:@"450000-450900-450921" block:^(NSString *address) {
//            
//            NSLog(@"==%@==", [NSThread currentThread]);
//            dispatch_async(dispatch_get_main_queue(), ^{
//                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"450000-450900-450921" message:address preferredStyle:UIAlertControllerStyleAlert];
//                [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//                    
//                }]];
//                [weakSelf presentViewController:alert animated:YES completion:nil];
//            });
//            NSLog(@"%@",address);
//            
//        }];
        
    }], [HS_TableViewItem itemWithTitle:@"根据地址获得编号" subTitle:@"河北省-石家庄市-长安区" itemOperation:^(NSIndexPath *indexPath) {
        
        [[MOFSPickerManager shareManger] searchZipCodeByAddress:@"河北省-石家庄市-长安区" block:^(NSString *zipcode) {
            NSLog(@"%@",zipcode);
            NSLog(@"==%@==", [NSThread currentThread]);
            dispatch_async(dispatch_get_main_queue(), ^{
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"河北省-石家庄市-长安区" message:zipcode preferredStyle:UIAlertControllerStyleAlert];
                [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    
                }]];
                [weakSelf presentViewController:alert animated:YES completion:nil];
            });
        }];
        
    }]];
    
    [self.sections addObject:[HS_ItemSection sectionWithItems:array andHeaderTitle:nil footerTitle:nil]];
    
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
