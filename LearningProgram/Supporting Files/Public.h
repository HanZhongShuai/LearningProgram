//
//  Public.h
//  LearningProgram
//
//  Created by RC on 2018/3/9.
//  Copyright © 2018年 HS. All rights reserved.
//

#ifndef InstaShot_Public_h
#define InstaShot_Public_h


#define kAppID @"1300053844"
#define kAppStoreURLPre @"itms-apps://itunes.apple.com/app/id"
#define kAppStoreURL [NSString stringWithFormat:@"%@%@", kAppStoreURLPre, kAppID]
#define kAppStoreScoreURLPre @"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id="
#define kAppStoreScoreURL [NSString stringWithFormat:@"%@%@", kAppStoreScoreURLPre, kAppID]


#define ScreenHeight [[UIScreen mainScreen] bounds].size.height
#define ScreenWidth [[UIScreen mainScreen] bounds].size.width

#define iPhoneX ([[UIScreen mainScreen] bounds].size.height ==812) //414
#define iPhone6plus ([[UIScreen mainScreen] bounds].size.height ==736) //414
#define iPhone6 ([[UIScreen mainScreen] bounds].size.height ==667)  //375
#define iPhone5 ([[UIScreen mainScreen] bounds].size.height ==568)  //320
#define iPhone4 ([[UIScreen mainScreen] bounds].size.height ==480)  //320

//判断是否为iPhone
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
//判断是否为iPad
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
//判断是否为ipod
#define IS_IPOD ([[[UIDevice currentDevice] model] isEqualToString:@"iPod touch"])
//判断是否为iPhone5
#define IS_IPHONE_5_SCREEN [[UIScreen mainScreen] bounds].size.height >= 568.0f && [[UIScreen mainScreen] bounds].size.height < 1024.0f

#define IS_IOS_11 (([[[UIDevice currentDevice] systemVersion] floatValue]>=11.0)?1:0)
#define IS_IOS_10 (([[[UIDevice currentDevice] systemVersion] floatValue]>=10.0)?1:0)
#define IS_IOS_9 (([[[UIDevice currentDevice] systemVersion] floatValue]>=9.0)?1:0)
#define IS_IOS_8 (([[[UIDevice currentDevice] systemVersion] floatValue]>=8.0)?1:0)
#define IS_IOS_7 (([[[UIDevice currentDevice] systemVersion] floatValue]>=7.0)?1:0)
#define IS_IOS_6 (([[[UIDevice currentDevice] systemVersion] floatValue]>=6.0)?1:0)
#define IS_IOS_5 (([[[UIDevice currentDevice] systemVersion] floatValue]<6.0)?1:0)


#define kDocumentPath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]

#define FontNameRegular @"AvenirNext-Regular"
#define FontNameMedium @"AvenirNext-Medium"
//#define FontNameBold @"AvenirNext-Bold"
#define FontNameBold @"AvenirNext-DemiBold"

#endif
