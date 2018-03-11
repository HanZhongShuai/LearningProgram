//
//  CMethods.h
//  TaxiTest
//
//  Created by Xiaohui Guo  on 13-3-13.
//  Copyright (c) 2013年 FJKJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CGBase.h>

@interface CMethods : NSObject

CGFloat getFontSize(CGFloat size);
CGFloat getWidth(CGFloat width);
CGFloat getHeight(CGFloat height);
CGFloat getScaleFontSize(CGFloat size);
CGFloat getScaleWidth(CGFloat width);
CGFloat getScaleHeight(CGFloat height);

CGFloat fontSizeFromPX(CGFloat pxSize);

@end
